package com.neating.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.neating.manager.svc.ManagerMainService;
import com.neating.member.vo.MemberPointVO;

@Controller
public class ManagerMainController {
	@Autowired
	private ManagerMainService managerMainService;
	@RequestMapping(value="managerFolder/ManagerMain.ajax", method= {RequestMethod.GET, RequestMethod.POST})
	@ResponseBody			// 값을 view가 아니라 ajax로 보내겠음
	public Object execute(HttpServletRequest request) throws Exception
	{
		int memberCount = managerMainService.ManagerMainMemberCount();
		int goodsCount = managerMainService.ManagerMainGoodsCount();
		int boardCount = managerMainService.ManagerMainBoardCount();
		int allPay = managerMainService.ManagerAllPayCount();
		List<MemberPointVO> memberPointVO = managerMainService.ManagerMainMemberPoint();
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("memberCount", memberCount);
		resultMap.put("goodsCount", goodsCount);
		resultMap.put("boardCount", boardCount);
		resultMap.put("allPay", allPay);
		resultMap.put("memberPointVO", memberPointVO);
		
		Gson gson = new Gson();

		return gson.toJson(resultMap);
	}
}
