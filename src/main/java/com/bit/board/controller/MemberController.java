package com.bit.board.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.board.service.MemberService;
import com.bit.member.model.MemberDto;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "join.bit", method = RequestMethod.GET)
	public String joinMember() {
		return "member/join";
	}

	// --------------------restful 구현-----------------------------------

	// 화면갖고오기 create
	@RequestMapping(method = RequestMethod.POST)
	public String joinMember(@RequestParam Map<String, String> param, HttpSession session, Model model) {
		System.out.println("조인한 아이디 : " + param.get("id"));
		//session.setAttribute("id", param.get("id"));

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
			System.out.println("회원가입 완료되었습니다");
		}
		return "admin/boardmenu";
	}

	/*
	 * //화면뿌리기 read
	 * 
	 * @RequestMapping(value="member/{seq}", method=RequestMethod.GET) public String
	 * viewMember(@PathVariable(value="seq") int seq) { String memolist =
	 * memberService.listMemo(seq); return memolist; }
	 * 
	 * //update
	 * 
	 * @RequestMapping(value="member", method=RequestMethod.PUT) public String
	 * modifyMember(@RequestBody MemoDto memoDto, HttpSession session) { MemberDto
	 * memberDto = (MemberDto) session.getAttribute("userInfo"); if(memberDto !=
	 * null) { memoDto.setId(memberDto.getId());
	 * memoDto.setName(memberDto.getName()); int cnt =
	 * memberService.modifyMemo(memoDto); } String memolist =
	 * memberService.listMemo(memoDto.getSeq()); return memolist; }
	 * 
	 * @RequestMapping(value="member/{seq}/{mseq}", method=RequestMethod.DELETE)
	 * public String deleteMember(@PathVariable(value="seq")ㅊ int
	 * seq, @PathVariable(value="mseq") int mseq) { memberService.deleteMemo(mseq);
	 * String memolist = memberService.listMemo(seq); return memolist; }
	 */
}
