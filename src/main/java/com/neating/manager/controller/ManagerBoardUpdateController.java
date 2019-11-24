package com.neating.manager.controller;

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

import com.neating.board.vo.BoardVO;
import com.neating.manager.svc.ManagerBoardUpdateService;

@Controller
public class ManagerBoardUpdateController {
	@Autowired
	private ManagerBoardUpdateService managerBoardUpdateService;
	
	@RequestMapping(value="managerFolder/Manager_Board_Update.do", method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView execute(@RequestParam("board_class") String board_class,
								@RequestParam("board_index") int board_index, HttpServletRequest request,MultipartHttpServletRequest mtfRequest) throws Exception
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
						board_index,
						board_class,
						request.getParameter("member_id"),
						request.getParameter("board_title"),
						request.getParameter("board_content"),
						titleFile,
						0,null,null
				);
		
		int count = managerBoardUpdateService.ManagerBoardUpdate(boardVO);
		if(count > 0)
		{
			System.out.println("업데이트성공");
		}
		else
		{
			System.out.println("업데이트실패");
		}
		
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
		
		mnv.addObject("board_index",board_index);
		mnv.addObject("board_class",board_class);
		mnv.setViewName("redirect:Board_SelectOne.do");
		
		return mnv;
	}
}
