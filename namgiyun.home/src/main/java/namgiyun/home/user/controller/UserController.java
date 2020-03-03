package namgiyun.home.user.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import namgiyun.home.user.domain.User;
import namgiyun.home.user.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
	@Autowired UserService userService;

	@RequestMapping("join.do")
	@ResponseBody
	public boolean joinMember(User user) {
		return userService.joinMember(user);
	}

	@RequestMapping("login.do")
	@ResponseBody
	public boolean login(User user, HttpSession session, HttpServletResponse response) throws IOException {
		User loginUser = userService.loginUser(user);

		if (loginUser == null || loginUser.equals("")) 
			return false;
		else {
			session.setAttribute("user", loginUser);
			return true;	
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login";
	}

	@RequestMapping("kLogin.do")
	@ResponseBody
	public boolean kLogin(User user, HttpSession session, HttpServletResponse response) throws IOException {
		boolean kakaoUser = userService.idCheck(user.getUserId()); // 카카오톡 ID로 회원가입이 되어 있는지 판단
		
		user.setPhone(" ");
		user.setUserPassword(" ");

		if (!kakaoUser) { 								// 회원가입이 되어있지 않다면 카카오톡 ID로 회원가입 시킴
			if (userService.joinMember(user)){ 			// 회원가입 정상 실행 시
				user = userService.loginUser(user); 			
				session.setAttribute("user", user);		// 로그인 시킴.
			}
		}else return false;

		return true;									// 로그인 성공을 알리기 위해 true 리턴
	}

	@RequestMapping("/idCheck.do")
	@ResponseBody
	public boolean idCheck(String userId) {
		return userService.idCheck(userId);
	}
	
	@RequestMapping("userInfoUpdate.do")
	@ResponseBody
	public boolean infoUpdate(User user, HttpSession session){
		User updateUser = (User)session.getAttribute("user");
		
		updateUser.setUserPassword(user.getUserPassword());
		updateUser.setUserName(user.getUserName());
		updateUser.setPhone(user.getPhone());
		updateUser.setEmail(user.getEmail());
		
		return userService.userUpdate(updateUser);
	}

	/* View controller */
	@RequestMapping("/login")
	public String login() {
		return "user/login";
	}

	@RequestMapping("/join") 
	public String join() {
		return "user/joinMember";
	}

	@RequestMapping("/findId")
	public String findId() {
		return "user/findId";
	}
	
	@RequestMapping("/findId.do")
	@ResponseBody
	public String findId_do(User user){
		System.out.println("findId===>");
		System.out.println(user.toString());
		String id = userService.findId(user);
		System.out.println(id);
		if(id == "" || id == null)
			return "";
		else
			return id;
	}

	@RequestMapping("/findPassword")
	@ResponseBody
	public String findPassword(User user) {
		System.out.println("findPassword===>");
		String id = userService.findId(user);
		System.out.println();
		if(id == ""){
			return "회원정보를 다시 확인해주세요.";
		}else
			return id;
		
	}

	@RequestMapping("/findPassword.do")
	@ResponseBody
	public String findPassword_do(User user){
		System.out.println("findfindPassword==>");
		System.out.println(user.toString());
		String id = userService.findId(user);
		System.out.println(id);
		if(id == "" || id == null)
			return "";
		else
			return id;
	}
	
	@RequestMapping("/userInfo")
	public String userInfo() {
		return "user/userInfo";
	}
}
