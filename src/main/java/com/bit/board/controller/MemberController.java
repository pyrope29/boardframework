package com.bit.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.board.model.MemoDto;
import com.bit.board.service.MemberService;
import com.bit.member.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {
	
		@Autowired
		private MemberService memberService;

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		return "redirect:/badmin/boardmenu.bit";
	}

	@RequestMapping(value = "join.bit", method = RequestMethod.GET)
	public String join() {
		return "member/join";
	}

	@RequestMapping(value = "modify.bit", method = RequestMethod.GET)
	public String modify(Model model, HttpSession session) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		
		MemberDto member = memberService.selectMember(memberDto.getId());
		
		model.addAttribute("id", member.getId());
		model.addAttribute("name", member.getName());
		model.addAttribute("bdate", member.getBdate().substring(0, 10));
		model.addAttribute("gender", member.getGender());
		model.addAttribute("pnum", member.getPnum());
		model.addAttribute("addr", member.getAddr());
		
		return "member/modify";
	}
	
	@RequestMapping(value = "list.bit", method = RequestMethod.GET)
	public String list(Model model) {
		List<MemberDto> mList = new ArrayList<MemberDto>();
		mList = memberService.selectAllMember();
		
		model.addAttribute("mList", mList);
		return "member/list";
	}

	@RequestMapping(value = "login.bit", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}

	@RequestMapping(value = "login.bit", method = RequestMethod.POST)
	public String login(@RequestParam Map<String, String> param, Model model, HttpSession session) {
		String id = param.get("id");
		String pw = param.get("pw");
		MemberDto memberDto = memberService.selectMember(id);
		
		if(memberDto.getSts().equals("0")) {
			model.addAttribute("msg", "탈퇴한 아이디입니다");
			model.addAttribute("url", "login.bit");
			return "error";
		}

		if (memberDto != null) {
			if (memberDto.getPw().equals(pw)) {
				model.addAttribute("msg", id + " 님 환영합니다");
				session.setAttribute("userInfo", memberDto);
				System.out.println(memberDto.toString() + "님이 로그인함");
				model.addAttribute("url", "../badmin/boardmenu.bit");
				return "info";
			} else {
				model.addAttribute("msg", "비밀번호가 잘못되었습니다");
				model.addAttribute("url", "login.bit");
				return "error";
			}
		} else {
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
		memberDto.setPw(param.get("pw"));
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
		MemberDto member = memberService.selectMember(memberDto.getId());

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
		int cnt=0;
		if (member != null) {
			
			memberDto.setPw(member.getPw());
			memberDto.setZcode(member.getZcode());
			cnt = memberService.updateMember(memberDto);
		}
		if (0 < cnt) {
			model.addAttribute("msg", "회원수정이 완료되었습니다");
			return "{\"result\" : \"modify.bit\" }" ;
		} else {
			model.addAttribute("msg", "회원수정이 실패했습니다");
			model.addAttribute("url", "/member/m");
			return "{\"result\" : \"history.back()\" }" ;
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
