package nosa.nns.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import nosa.nns.dao.UserDAO;
import nosa.nns.dto.UserDTO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	private UserDAO userDAO;
	
	@Autowired
	public UserServiceImpl(nosa.nns.dao.UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public void save(UserDTO user) throws Exception {
		// TODO Auto-generated method stub
		userDAO.save(user);
	}

	@Override
	public int findById(String userId) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.findById(userId);
	}

	@Override
	public int findByEmail(String userId) {
		// TODO Auto-generated method stub
		return userDAO.findByEmail(userId);
	}

}
