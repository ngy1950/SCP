package com.company.view.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.company.SCP.user.UserDAO;
import com.company.SCP.user.UserVO;

@Controller
public class LoginController {
	@RequestMapping(value = "joinMember.do", method = RequestMethod.POST)
	public String joinMember(UserVO vo, UserDAO userDAO) {
		userDAO.insertUserVO(vo);
		return "index.jsp";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, UserDAO userDAO, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		UserVO user = userDAO.getUserVO(vo);
		if (user != null) {
			// 로그인 성공
			session.setAttribute("user", user);
			return "index.do";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('다시입력해 주세요.'); history.go(-1);</script>");
			out.flush();

			System.out.println(" 로그인 실패 !! ");
			return "login.jsp";

		}
	}
}
