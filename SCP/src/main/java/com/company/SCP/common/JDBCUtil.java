package com.company.SCP.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class JDBCUtil {
	//H2 DB 연동
	static final String driver = "org.h2.Driver";
	static final String url = "jdbc:h2:tcp://localhost/~/test";
	
	//DB 연결 객체 만드는 메소드
	public static Connection getconnConnection() throws Exception{
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, "sa", "qwer1321");
			return con;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//select 작업 종료시 자원 해제시키는 메소드
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) {
		if(rs != null) {
			try {
				if(!rs.isClosed()) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				rs = null;
			}
		}
		if(stmt != null) {
			try {
				if(!stmt.isClosed()) stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				stmt = null;
			}
		}
		if(conn != null) {
			try {
				if(!conn.isClosed()) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}
	
	//DML(insert, update, delete) 작업 종료시 자원 해제시키는 메소드
	public static void close(PreparedStatement stmt, Connection conn) {
		if(stmt != null) {
			try {
				if(!stmt.isClosed()) stmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				stmt = null;
			}
		}
		if(conn != null) {
			try {
				if(!conn.isClosed()) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				conn = null;
			}
		}
	}	
}
