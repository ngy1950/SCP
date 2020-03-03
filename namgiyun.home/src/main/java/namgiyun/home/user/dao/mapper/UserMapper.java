package namgiyun.home.user.dao.mapper;

import namgiyun.home.user.domain.User;

public interface UserMapper {
	int addUser(User user);		// 사이트 회원가입
	User loginUser(User user);	// 사이트로 로그인
	int idCheck(String userId);	// 회원가입 Id중복 check
	int userUpdate(User user);	// 회원정보 수정
	
	String findId(User user);
	
}
