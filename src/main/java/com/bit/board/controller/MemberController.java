package com.bit.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.board.service.MemberService;
import com.bit.member.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	
		@Autowired
		private MemberService memberService;
		@Autowired
		BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/badmin/boardmenu.bit";
	}

	@RequestMapping(value = "join.bit", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	public @ResponseBody String idCheck(@RequestParam("id") String id){
		String result;
		MemberDto CheckedId = memberService.selectMemberById(id);
		if(CheckedId==null){
			result = "YES";	
		}else { 
			result = "NO";
		}
		return result;
	}

	@RequestMapping(value = "modify.bit", method = RequestMethod.GET)
	public String modify(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		if(memberDto != null) {
			MemberDto member = memberService.selectMemberById(memberDto.getId());
			
			model.addAttribute("id", member.getId());
			model.addAttribute("name", member.getName());
			model.addAttribute("bdate", member.getBdate().substring(0, 10));
			model.addAttribute("gender", member.getGender());
			model.addAttribute("pnum", member.getPnum());
			model.addAttribute("zcode", member.getZcode());
			model.addAttribute("addr", member.getAddr());
			return "member/modify";
		} else {
			model.addAttribute("msg", "회원전용 게시판입니다. 로그인 해주세요");
			model.addAttribute("url", "login.bit");
			return "error";
		}
		
		
	}
	
	@RequestMapping(value = "modifyPw.bit", method = RequestMethod.GET)
	public String modifyPw(Model model, HttpSession session) {
		return "member/modifyPw";
	}
	
	@RequestMapping(value = "list.bit", method = RequestMethod.GET)
	public String list(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			List<MemberDto> mList = new ArrayList<MemberDto>();
			mList = memberService.selectAllMember();
		
			model.addAttribute("mList", mList);
		
			return "member/list";
		} else {
			model.addAttribute("msg", "회원전용 게시판입니다. 로그인 해주세요");
			model.addAttribute("url", "login.bit");
			return "error";
		}
			
	}

	@RequestMapping(value = "login.bit", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "login.bit", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> param, Model model, HttpSession session) {
		String id = param.get("id");
		String pw = param.get("pw");
		MemberDto memberDto = memberService.selectMemberById(id);
		
		System.out.println("rawPw : " + pw);
		System.out.println("getPw : " + memberDto.getPw());
		
		
		if (memberDto != null) {
			if(memberDto.getSts().equals("0")) {
				model.addAttribute("msg", "탈퇴한 아이디입니다");
				model.addAttribute("url", "login.bit");
				return "error";
			}
			
			if (passwordEncoder.matches(pw, memberDto.getPw())) {
				model.addAttribute("msg", id + " 님 환영합니다");
				session.setAttribute("userInfo", memberDto);
				model.addAttribute("url", "../badmin/boardmenu.bit");
				return "info";
			} else {
				model.addAttribute("msg", "비밀번호가 잘못되었습니다");
				model.addAttribute("url", "login.bit");
				return "error";
			}
		} else {
			System.out.println("memberDto :" + memberDto);
			model.addAttribute("msg", "아이디가 잘못되었습니다");
			model.addAttribute("url", "login.bit");
			return "error";
		}
		
	}

	// --------------------restful 구현-----------------------------------

	@RequestMapping(method = RequestMethod.POST)
	public String join(@RequestParam Map<String, String> param, Model model) throws IOException {
		System.out.println("조인한 아이디 : " + param.get("id"));

		MemberDto memberDto = new MemberDto();
		memberDto.setId(param.get("id"));
		memberDto.setName(param.get("name"));
		
		// 비밀번호 암호화
		memberDto.setPw(passwordEncoder.encode(param.get("pw")));

		memberDto.setBdate(param.get("bdate"));
		memberDto.setGender(param.get("gender"));
		memberDto.setPnum(param.get("pnum"));
		memberDto.setZcode(param.get("zcode"));
		memberDto.setAddr(param.get("addr"));

		System.out.println(memberDto.toString());

		if (0 < memberService.insertMember(memberDto)) {
			model.addAttribute("msg", "회원가입 완료");
			model.addAttribute("url", "badmin/boardmenu.bit");
		}
		return "info";
	}

	@RequestMapping(method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		MemberDto member = memberService.selectMemberById(memberDto.getId());

		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		model.addAttribute("bdate", member.getBdate().substring(0, 10));

		if (member.getGender().equals("1")) {
			model.addAttribute("gender", "남자");
		} else {
			model.addAttribute("gender", "여자");
		}

		model.addAttribute("pnum", member.getPnum());
		model.addAttribute("addr", member.getAddr());

		return "member/view";
	}

	@RequestMapping(method = RequestMethod.PUT, headers={"Content-type=application/json"})
	public @ResponseBody String modifyMember(@RequestBody MemberDto memberDto, HttpSession session, Model model,
			HttpServletRequest request) {
		
		MemberDto member = (MemberDto) session.getAttribute("userInfo");
		memberDto.setPw(member.getPw());
		if (0 < memberService.updateMember(memberDto)) {
			System.out.println( "회원수정이 완료되었습니다");
			return "{\"result\" : \"YES\" }" ;
		} else {
			System.out.println( "회원수정이 실패했습니다");
			return "{\"result\" : \"NO\" }" ;
		}
	}
	
	@RequestMapping(value="modifyPw", method = RequestMethod.PUT, headers={"Content-type=application/json"})
	public @ResponseBody String modifyPw(@RequestParam Map<String, String> param, HttpSession session, Model model,
			HttpServletRequest request) {
		
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
	
		memberDto.setPw(param.get("pw"));
		
		System.out.println(param.get("pw"));
		
		if (0 < memberService.updateMember(memberDto)) {
			System.out.println( "비번 수정이 완료되었습니다");
			return "{\"result\" : \"YES\" }" ;
		} else {
			System.out.println( "비번 수정이 실패했습니다");
			return "{\"result\" : \"NO\" }" ;
		}
	}
	
	@RequestMapping(method = RequestMethod.DELETE)
	public @ResponseBody String delete(Model model,HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		memberService.deleteMember(memberDto.getId());
		session.removeAttribute("userInfo");
		model.addAttribute("msg", "회원탈퇴가 완료되었습니다");
		return "{\"result\" : \"badmin/boardmenu.bit\" }" ;
	}
}
