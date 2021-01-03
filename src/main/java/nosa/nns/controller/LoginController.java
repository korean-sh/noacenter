package nosa.nns.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import nosa.nns.dto.LoginDTO;
import nosa.nns.service.LoginService;

@Controller
public class LoginController {
	
	private LoginService loginService;
	

	@Autowired
	public LoginController(LoginService loginService) {
		this.loginService = loginService;
	}

	/**
	 *	�α��� ȭ�� 
	 */
	@GetMapping("/")
	public String userLogin() throws Exception{
		return "login/login";
	}
	
	/**
	 *	�α��� �̺�Ʈ �߻�
	 *	AJAX ���� �б⸦ ���� ��ȯ �� HashMap���� ����
	 */
	@ResponseBody
	@PostMapping("/loginEvent.do")
	//public HashMap<String, String> userLoginEvent(HttpServletRequest request, HttpSession session) throws Exception{
	public HashMap<String, String> userLoginEvent(@ModelAttribute LoginDTO loginDTO, HttpSession session) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
			
		if(validateLogin(loginDTO)) {
			if(statusLogin(loginDTO) == 0) {
				result.put("code","0");
				result.put("msg","ȸ������ ���� �������Դϴ�.");
			}else if(statusLogin(loginDTO) == 1) {
				result.put("code","1");
				result.put("msg","�α��� ����");
				session.setAttribute("userId", loginDTO.getUserId());
			}else {
				result.put("code","2");
				result.put("msg","Ż�� �� ������ ���̵��Դϴ�.");
			}
		}else {
			result.put("code","-1");
			result.put("msg","��ȿ���� ���� ���� �����Դϴ�.");
		}
		return result;
	}
	
	/*
	 * �α��� ������ ����ȭ��
	 */
	@GetMapping("/index.do")
	public String userLoingSuccess()  throws Exception{
		return "board/index";
	}
	
	/**
	 * �α׾ƿ�
	 */
	@GetMapping("/logout.do")
	public String userLogout(HttpSession session)  throws Exception{
		session.removeAttribute("userId");
		return "login/login";
	}
	
	/*==================================
	 * ��ƿ��Ƽ
	 *==================================/
	
	/**
	 * �α��� ���̵� ��ȿ�� �˻�
	 * ��й�ȣ ��ȣȭ ���� �ʿ�
	 */
	public Boolean validateLogin(LoginDTO loginDTO) throws Exception {
		
		/*
		 * �׽�Ʈ ����
		 * hohoho �ڼ�ȣ123!
		 */
		String password = getSHA256(loginDTO.getUserPwd());
		String encryptionPwd = loginService.findPwd(loginDTO.getUserId());
		
		Optional<String> optOfPwd = Optional.ofNullable(encryptionPwd);
		
		if(optOfPwd.isPresent()) {
			if(encryptionPwd.equals(password)) {	
				loginDTO.setUserPwd(password);
				if( loginService.findByIdAndPwd(loginDTO) == 1)
					return true;
				else 
					return false;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	
	/*
	 * ��й�ȣ ��ȣȭ
	 */
	public static String getSHA256(String input) throws UnsupportedEncodingException, NoSuchAlgorithmException{

		String toReturn = null;
		
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.reset();
		digest.update(input.getBytes("utf8"));
		
		toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
		
		return toReturn;
	}
	
	/**
	 * �α��� ���̵� ���� ����
	 * (0) - �̽��� (1) - ����  (2) - Ż��
	 * @throws Exception 
	 */
	public int statusLogin(LoginDTO loginDTO) throws Exception {
		return loginService.findStatus(loginDTO);
	}
	
}
