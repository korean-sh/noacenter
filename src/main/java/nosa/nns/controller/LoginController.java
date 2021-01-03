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
	 *	로그인 화면 
	 */
	@GetMapping("/")
	public String userLogin() throws Exception{
		return "login/login";
	}
	
	/**
	 *	로그인 이벤트 발생
	 *	AJAX 조건 분기를 위해 반환 값 HashMap으로 선언
	 */
	@ResponseBody
	@PostMapping("/loginEvent.do")
	//public HashMap<String, String> userLoginEvent(HttpServletRequest request, HttpSession session) throws Exception{
	public HashMap<String, String> userLoginEvent(@ModelAttribute LoginDTO loginDTO, HttpSession session) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
			
		if(validateLogin(loginDTO)) {
			if(statusLogin(loginDTO) == 0) {
				result.put("code","0");
				result.put("msg","회원가입 절차 승인중입니다.");
			}else if(statusLogin(loginDTO) == 1) {
				result.put("code","1");
				result.put("msg","로그인 성공");
				session.setAttribute("userId", loginDTO.getUserId());
			}else {
				result.put("code","2");
				result.put("msg","탈퇴 및 삭제된 아이디입니다.");
			}
		}else {
			result.put("code","-1");
			result.put("msg","유효하지 않은 계정 정보입니다.");
		}
		return result;
	}
	
	/*
	 * 로그인 성공시 메인화면
	 */
	@GetMapping("/index.do")
	public String userLoingSuccess()  throws Exception{
		return "board/index";
	}
	
	/**
	 * 로그아웃
	 */
	@GetMapping("/logout.do")
	public String userLogout(HttpSession session)  throws Exception{
		session.removeAttribute("userId");
		return "login/login";
	}
	
	/*==================================
	 * 유틸리티
	 *==================================/
	
	/**
	 * 로그인 아이디 유효성 검사
	 * 비밀번호 암호화 검증 필요
	 */
	public Boolean validateLogin(LoginDTO loginDTO) throws Exception {
		
		/*
		 * 테스트 계정
		 * hohoho 박성호123!
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
	 * 비밀번호 암호화
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
	 * 로그인 아이디 상태 검증
	 * (0) - 미승인 (1) - 승인  (2) - 탈퇴
	 * @throws Exception 
	 */
	public int statusLogin(LoginDTO loginDTO) throws Exception {
		return loginService.findStatus(loginDTO);
	}
	
}
