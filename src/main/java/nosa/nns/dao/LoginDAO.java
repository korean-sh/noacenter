package nosa.nns.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import nosa.nns.dto.LoginDTO;

@Mapper
public interface LoginDAO {
	public int findByIdAndPwd(LoginDTO loginDTO) throws Exception;
	public int findStatus(LoginDTO loginDTO) throws Exception;
	public String findPwd(String userID) throws Exception;
}
