package com.neating.manager.svc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neating.manager.dao.ManagerDAO;
import com.neating.manager.vo.ManagerVO;

@Service
public class ManagerLoginService {
	@Autowired
	private ManagerDAO managerDAO;
	
	public ManagerVO ManagerLogin(String manager_id, String manager_password) throws Exception
	{
		ManagerVO managerVO = managerDAO.ManagerLogin(manager_id, manager_password);
		
		return managerVO;
	}
}
