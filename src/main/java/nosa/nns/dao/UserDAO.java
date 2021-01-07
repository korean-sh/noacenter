package nosa.nns.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import nosa.nns.dto.UserDTO;

@Mapper
public interface UserDAO {
	
	public void save(UserDTO user) throws Exception;
	
	public int findById(String userId) throws Exception;
	
	public int findByEmail(String userId);
}
