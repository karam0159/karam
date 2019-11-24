package com.neating.manager.controller;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.neating.manager.svc.ManagerGoodsDeleteService;

@Controller
public class ManagerGoodsDeleteController {
	@Autowired
	private ManagerGoodsDeleteService managerGoodsDeleteService;
	
	@RequestMapping(value="managerFolder/Goods_Delete.do", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_index") int goods_index,
								@RequestParam("goods_class") String goods_class,
								@RequestParam("goods_kind") String goods_kind,
								@RequestParam("goods_name") String goods_name, HttpServletRequest request) throws Exception
	{
		request.setCharacterEncoding("UTF-8");
		String realFolder = "";
		String saveFolder = "/image/goods/goodsImage";
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("realFolder ="+realFolder);
		String realSaveFolder = realFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name;
		String realSaveSCFolder = realFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name+"/screen";
		
		// 폴더 삭제
		File removeFolder = new File(realSaveFolder);
		File removeFolder2 = new File(realSaveSCFolder);
		// 폴더안의 하위 파일 삭제(screen 폴더안의 모든 파일을 제거 후 상품폴더 속의 모든 파일 제거 후 상품폴더제거)
		File[] deleteFolderList = removeFolder.listFiles();
		File[] deleteFolderList2 = removeFolder2.listFiles();
		
		for (int j = 0; j < deleteFolderList.length; j++) {
			deleteFolderList[j].delete();
		}
		for (int j = 0; j < deleteFolderList2.length; j++) {
			deleteFolderList2[j].delete();
		}
		removeFolder2.delete();
		removeFolder.delete();

		int count = managerGoodsDeleteService.ManagerGoodsDelete(goods_index);
		if(count > 0)
		{
			System.out.println("삭제 완료");
		}
		else
		{
			System.out.println("삭제 실패");
		}
		
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("section",1);
		mnv.addObject("page", 1);
		mnv.addObject("goods_class",goods_class);
		mnv.addObject("goods_kind","All");
		mnv.setViewName("redirect:/managerFolder/Manager_GoodsSelectList.do");
		
		return mnv;
	}
}
