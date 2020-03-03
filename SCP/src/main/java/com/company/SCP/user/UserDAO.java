package com.company.SCP.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.company.SCP.common.JDBCUtil;

public class UserDAO {
	//DB 관련 멤버변수 선언
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	//SQL 명령어
	private final String USER_GET = "select * from USER where id=? and passwd=?";
	private final String USER_INSERT = "insert into user values(?,?,?,?,?,sysdate,?,?,?)";
	
	// 회원가입 //
	public void insertUserVO(UserVO vo) {
		System.out.println(" insertUserVO ===> ");
		
		try {
			conn = JDBCUtil.getconnConnection();
			stmt = conn.prepareStatement(USER_INSERT);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPasswd());
			stmt.setString(3, vo.getName());
			stmt.setString(4, vo.getPhone());
			stmt.setString(5, vo.getBirth());
			stmt.setString(6, vo.getAddress());
			stmt.setString(7, vo.getEmail());
			stmt.setString(8, vo.getZipcode());
			stmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("insertUserVO : " + e);
		}finally {
			JDBCUtil.close(rs, stmt, conn);
		}
	}
	// 로그인 //
	public UserVO getUserVO(UserVO vo) {
		UserVO user = null;
		System.out.println(" vo!! "+ vo);
		try {
			System.out.println("===> JDBC로 getUser() 기능 처리");
			
			conn = JDBCUtil.getconnConnection();
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPasswd());		
				
			rs = stmt.executeQuery();
			System.out.println("!! rs : " + rs);
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("id"));
				user.setPasswd(rs.getString("passwd"));
				user.setName(rs.getString("name"));
				user.setPhone(rs.getString("phone"));
				user.setBirth(rs.getString("birth"));
				user.setAddress(rs.getString("address"));
				user.setEmail(rs.getString("email"));
				user.setRegdate(rs.getDate("regdate"));
				user.setZipcode(rs.getString("zipcode"));
			}
		} catch (Exception e) {
			System.out.println("===> getUserVO() " + e);
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}
}
