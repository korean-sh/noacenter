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
	 *	ȸ������ �̺�Ʈ �߻�
	 *	AJAX ���� �б⸦ ���� ��ȯ �� HashMap���� ����
	 */
	@ResponseBody
	@PostMapping("/save.do")
	public  HashMap<String, String> userRegister(@ModelAttribute UserDTO userDTO, BindingResult bindingResult) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		
		if(userService.findById(userDTO.getUserId()) == 1) {
			result.put("code","2");
			result.put("msg","�Է��Ͻ� ID�� �̹� �����մϴ�."); 
		}else if(userService.findByEmail(userDTO.getUserEmail()) == 1) {
			result.put("code","3");
			result.put("msg","�Է��Ͻ� E-mail�� �̹� �����մϴ�."); 
		}else{
			result.put("code","1");
			result.put("msg","ȸ�����Կ� �����߽��ϴ�.");
			userService.save(userDTO);
		}
		return result;
	}
}
