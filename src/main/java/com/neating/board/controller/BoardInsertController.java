package com.neating.board.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.neating.board.svc.BoardInsertService;
import com.neating.board.vo.BoardVO;
import com.neating.manager.svc.ManagerBoardInsertService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BoardInsertController {
	@Autowired
	private BoardInsertService boardInsertService;
	
	@RequestMapping(value="Board_Insert.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_class") String board_class, 
								 HttpServletRequest request,MultipartHttpServletRequest mtfRequest) throws Exception
	{
		ModelAndView mnv = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		String realFolder = "";
		String saveFolder = "/image/board/boardImage";

		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("realFolder ="+realFolder);

		MultipartFile board_image = mtfRequest.getFile("board_image");
		String originFileName1 = board_image.getOriginalFilename(); // 원본 파일 명
		
		String titleFile = null;
		String safeFile1= null;
		if(originFileName1 != "")
		{
			safeFile1 = System.currentTimeMillis() + originFileName1;
			titleFile = saveFolder + "/"+ safeFile1;
		}
		else
		{
			titleFile = null;
			safeFile1= null;
		}
		
		BoardVO boardVO = new BoardVO
				(
						0,
						board_class,
						request.getParameter("member_id"),
						request.getParameter("board_title"),
						request.getParameter("board_content"),
						titleFile,
						0,null,null
				);
		
		File Folder = new File(realFolder);
		Folder.mkdirs();
		
		 try {
			 if(safeFile1 != null)
			 {
				 board_image.transferTo(new File(realFolder + "/"+safeFile1));
			 }
	       
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

		int count = boardInsertService.BoardInsert(boardVO);
		
		if(count > 0)
		{
			System.out.println("등록성공");
		}
		else
		{
			System.out.println("등록 실패");
		}
		
		mnv.setViewName("redirect:Board_SelectList.do?section=1&page=1&board_class="+board_class);
		
		
		return mnv;
	}
}
