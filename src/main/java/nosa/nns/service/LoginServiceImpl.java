package nosa.nns.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nosa.nns.dao.LoginDAO;
import nosa.nns.dto.LoginDTO;

@Service("loginService")
public class LoginServiceImpl implements LoginService{
	
	private LoginDAO loginDAO; 
	
	@Autowired
	public LoginServiceImpl(nosa.nns.dao.LoginDAO loginDAO) {
		this.loginDAO = loginDAO;
	}

	@Override
	public int findByIdAndPwd(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findByIdAndPwd(loginDTO);
	}

	@Override
	public int findStatus(LoginDTO loginDTO) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findStatus(loginDTO);
	}

	@Override
	public String findPwd(String userID) throws Exception {
		// TODO Auto-generated method stub
		return loginDAO.findPwd(userID);
	}
}
