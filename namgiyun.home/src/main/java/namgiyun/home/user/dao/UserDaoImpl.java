package namgiyun.home.user.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import namgiyun.home.user.dao.mapper.UserMapper;
import namgiyun.home.user.domain.User;

@Repository("userdao")
public class UserDaoImpl implements UserDao{
	@Autowired private UserMapper userMapper;
	
	@Override
	public int addUser(User user) {
		return userMapper.addUser(user);
	}
	@Override
	public User loginUser(User user) {
		System.out.println("loginUser");
		return userMapper.loginUser(user);
	}

	@Override
	public int idCheck(String userId) {
		return userMapper.idCheck(userId);
	}
	
	@Override
	public int userUpdate(User user) {
		return userMapper.userUpdate(user);
	}
	@Override
	public String findId(User user) {
		return userMapper.findId(user);
	}
}
