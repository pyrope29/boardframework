package com.bit.board.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.board.model.AlbumDto;
import com.bit.board.model.ReboardDto;
import com.bit.board.service.AlbumService;
import com.bit.common.service.CommonService;
import com.bit.member.model.MemberDto;
import com.bit.util.PageNavigation;

@Controller
@RequestMapping("/album")
public class AlbumController {

	@Autowired
	private AlbumService albumService;
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private ServletContext servletContext;
	
	@RequestMapping("list.bit")
	public ModelAndView list(@RequestParam Map<String, String> param) {
		ModelAndView mav = new ModelAndView();
		List<AlbumDto> list = albumService.listArticle(param);
		PageNavigation navigation = commonService.makePageNavigation(param);
		navigation.setRoot("/board");
		navigation.makeNavigator();
		
		mav.addObject("articlelist", list);
		mav.addObject("navigator", navigation);
		mav.setViewName("album/list");
		return mav;
	}
	
	@RequestMapping(value="write.bit", method=RequestMethod.GET)
	public String write(@RequestParam Map<String, String> param) {
		return "album/write";
	}
	
	@RequestMapping(value="write.bit", method=RequestMethod.POST)
	public String write(AlbumDto albumDto, @RequestParam("picture") MultipartFile multipartFile, HttpSession session, Model model) {
		MemberDto memberDto = (MemberDto) session.getAttribute("userInfo");
		if(memberDto != null) {
			albumDto.setId(memberDto.getId());
			albumDto.setName(memberDto.getName());
			albumDto.setEmail(memberDto.getEmail());
			
			if(multipartFile != null && !multipartFile.isEmpty()) {
				String opicture = multipartFile.getOriginalFilename();
				
				String realPath = servletContext.getRealPath("/img/upload/album");
//				System.out.println(realPath);
				DateFormat df = new SimpleDateFormat("yyMMdd");
				String saveFolder = df.format(new Date());//181224
				String fullSaveFolder = realPath + File.separator + saveFolder;
				File dir = new File(fullSaveFolder);
				if(!dir.exists())
					dir.mkdirs();
				
				String savePicture = UUID.randomUUID().toString() + opicture.substring(opicture.lastIndexOf('.'));
				
				File file = new File(fullSaveFolder, savePicture);
				
				try {
					multipartFile.transferTo(file);
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				albumDto.setOrignPicture(opicture);
				albumDto.setSavePicture(savePicture);
				albumDto.setSavefolder(saveFolder);
			}
			
			int seq = albumService.writeArticle(albumDto);
			if(seq != 0) {
				model.addAttribute("wseq", seq);
			} else {
				model.addAttribute("errorMsg", "에러메시지입니다!!!");
			}
		} else {
			model.addAttribute("errorMsg", " 회원전용게시판 ");
		}
		return "album/writeOk";
	}
}
