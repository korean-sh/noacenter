package nosa.nns.service;

import nosa.nns.dto.UserDTO;

public interface UserService {
	public void save(UserDTO user) throws Exception; 
	public int findById(String userId) throws Exception;
	public int findByEmail(String userId) throws Exception;
}
