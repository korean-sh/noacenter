package nosa.nns.service;

import nosa.nns.dto.LoginDTO;

public interface LoginService {
	public int findByIdAndPwd(LoginDTO loginDTO) throws Exception;
	public int findStatus(LoginDTO loginDTO) throws Exception;
}
