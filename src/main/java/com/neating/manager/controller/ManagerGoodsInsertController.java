package com.neating.manager.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

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

import com.neating.goods.vo.GoodsImageVO;
import com.neating.goods.vo.GoodsVO;
import com.neating.manager.svc.ManagerGoodsInsertService;

@Controller
public class ManagerGoodsInsertController {
	@Autowired
	private ManagerGoodsInsertService managerGoodsInsertService;
	
	@RequestMapping(value="managerFolder/Manager_Goods_Insert.do",method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView execute(@RequestParam("goods_class") String goods_class,
								@RequestParam("goods_kind") String goods_kind,
								@RequestParam("goods_name") String goods_name, @RequestParam("goods_price") int goods_price,
								@RequestParam("goods_sale") int goods_sale,HttpServletRequest request, MultipartHttpServletRequest mtfRequest) throws Exception
	{

		ModelAndView mnv = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");
		String realFolder = "";
		String saveFolder = "/image/goods/goodsImage";
		String saveImageFolder = saveFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name;
		String saveContentImageFolder = saveFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name+"/screen";
		
		ServletContext context = request.getServletContext();
		realFolder = context.getRealPath(saveFolder);
		System.out.println("realFolder ="+realFolder);
		String realSaveFolder = realFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name;
		String realSaveSCFolder = realFolder+"/"+goods_class+"/"+goods_kind+"/"+goods_name+"/screen";
		
		MultipartFile goods_imageTitle = mtfRequest.getFile("goods_imageTitle");
		String originFileName1 = goods_imageTitle.getOriginalFilename(); // 원본 파일 명
		String safeFile1 = System.currentTimeMillis() + originFileName1;
		String titleFile = 	   saveImageFolder + "/"+ safeFile1;
		
		int goods_saling = goods_price * goods_sale / 100;
		int goods_lastprice = goods_price - goods_saling;
		
		GoodsVO goodsVO = new GoodsVO
				(
					0,
					goods_class,	
					goods_name,
					goods_kind,
					titleFile,
					Integer.parseInt(request.getParameter("goods_countS")),
					Integer.parseInt(request.getParameter("goods_countM")),
					Integer.parseInt(request.getParameter("goods_countL")),
					goods_price,
					goods_sale,
					goods_lastprice,
					request.getParameter("goods_content"),
					0,0,null
				);
		
		int count = managerGoodsInsertService.GoodsInsert(goodsVO);
		if(count > 0)
		{
			System.out.println("상품등록성공");
		}
		else
		{
			System.out.println("상품등록실패");
		}
		//                         이미지                          
		
		
		// 폴더생성
		File Folder = new File(realSaveSCFolder);
		Folder.mkdirs();
		
		MultipartFile goods_imageTitleSub1 = mtfRequest.getFile("goods_imageTitleSub1");
		String originFileName2 = goods_imageTitleSub1.getOriginalFilename(); // 원본 파일 명
		
		MultipartFile goods_imageTitleSub2 = mtfRequest.getFile("goods_imageTitleSub2");
		String originFileName3 = goods_imageTitleSub2.getOriginalFilename(); // 원본 파일 명
		
		MultipartFile goods_imageTitleSub3 = mtfRequest.getFile("goods_imageTitleSub3");
		String originFileName4 = goods_imageTitleSub3.getOriginalFilename(); // 원본 파일 명
		
		// 파일 이동 -> 바뀐 경로로 파일명
		
		String safeFile2 = System.currentTimeMillis() + originFileName2;
		String safeFile3 = System.currentTimeMillis() + originFileName3;
		String safeFile4 = System.currentTimeMillis() + originFileName4;
		
	        try {
	        	goods_imageTitle.transferTo(new File(realSaveFolder + "/"+safeFile1));
	        	goods_imageTitleSub1.transferTo(new File(realSaveFolder + "/"+safeFile2));
	        	goods_imageTitleSub2.transferTo(new File(realSaveFolder + "/"+safeFile3));
	        	goods_imageTitleSub3.transferTo(new File(realSaveFolder + "/"+safeFile4));
	       
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	        
			String titleSubFile1 = saveImageFolder + "/"+ safeFile2;
			String titleSubFile2 = saveImageFolder + "/"+ safeFile3;
			String titleSubFile3 = saveImageFolder + "/"+ safeFile4;		
		
			GoodsImageVO goodsImageVO = new GoodsImageVO(
					0,
					titleSubFile1,
					titleSubFile2,
					titleSubFile3,
					null,
					0
				);
		
		int count2 = managerGoodsInsertService.GoodsImageInsert(goodsImageVO);
		if(count2>0)
		{
			System.out.println("이미지업로드성공");
		}
		else
		{
			System.out.println("이미지업로드실패");
		}
		
		//   다중 상품 이미지 업로드
		
		
		List<MultipartFile> fileList = mtfRequest.getFiles("goods_ContentImage"); //4
	//	int filesCount = fileList.size();
		
		for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명

	            String safeFile = realSaveSCFolder + "/"+ System.currentTimeMillis() + originFileName;
	            String contentFile = saveContentImageFolder + "/"+ System.currentTimeMillis() + originFileName;
	            
	            int count3 = managerGoodsInsertService.GoodsContentInsert(contentFile);
	            if(count3 > 0)
	            {
	            	System.out.println("상품 다중 이미지 업로드 성공");
	            }
	            else
	            {
	            	System.out.println("상품 다중 이미지 업로드 실패");
	            }
	            
	            try {
	                mf.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
	        }

		mnv.setViewName("redirect:Manager_GoodsSelectList.do?section=1&page=1&goods_kind=All&goods_class="+goods_class);
		
		
		return mnv;
		
	}
	
}
