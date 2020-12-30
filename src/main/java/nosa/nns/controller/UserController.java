package nosa.nns.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import nosa.nns.dto.UserDTO;
import nosa.nns.service.UserService;

@Controller
public class UserController {
	
	private UserService userService;
	
	@Autowired
	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/sign.do")
	public String userRegitserForm() {
		return "user/signin";
	}
	
	/**
	 *	회원가입 이벤트 발생
	 *	AJAX 조건 분기를 위해 반환 값 HashMap으로 선언
	 */
	@ResponseBody
	@PostMapping("/save.do")
	public  HashMap<String, String> userRegister(@ModelAttribute UserDTO userDTO, BindingResult bindingResult) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		if(userService.findById(userDTO.getUserId()) == 1) {
			result.put("code","2");
			result.put("msg","입력하신 ID가 이미 존재합니다."); 
		}else if(userService.findByEmail(userDTO.getUserEmail()) == 1) {
			result.put("code","3");
			result.put("msg","입력하신 E-mail은 이미 존재합니다."); 
		}else{
			result.put("code","1");
			result.put("msg","회원가입에 성공했습니다.");
			userService.save(userDTO);
		}
		return result;
	}
}
