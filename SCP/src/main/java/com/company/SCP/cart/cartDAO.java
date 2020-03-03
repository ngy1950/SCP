package com.company.SCP.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.SCP.common.JDBCUtil;

public class cartDAO {
	private Connection con = null;
	private PreparedStatement pstmt =  null;
	private ResultSet rs = null;
	
	private final String INSERT_CART = "insert into cart values(?,?,?,?,?)";
	private final String GET_CART = "select * from cart ca, pdetail pd where ca.poption = pd.poption and id = ?";
	private final String SELECT_CART = "select * from cart ca, pdetail pd where ca.poption = pd.poption and id = ? and ca.poption = ?";
	private final String DELETE_CART = "delete from cart where id = ? and poption = ?";
	public void insertCartVO(String cartList) {
		System.out.println("insertCartVO ===>");
		String [] cartVO = cartList.split(",", -1);
		
		
		try {
			con = JDBCUtil.getconnConnection();
			/*
			pstmt = con.prepareStatement(SELECT_CART);
			pstmt.setString(1, cartVO[1]);
			pstmt.setInt(2, Integer.parseInt(cartVO[4]));
			pstmt.executeQuery();
			if(rs.next()) {
				pstmt.executeUpdate(sql);
			}else {		
			
				pstmt = con.prepareStatement(INSERT_CART);
				pstmt.setInt(1, Integer.parseInt(cartVO[0]));											// PCODE
				pstmt.setString(2, cartVO[1]);															// ID
				pstmt.setInt(3, Integer.parseInt(cartVO[2]));											// ORDERNUM
				pstmt.setInt(4, Integer.parseInt(cartVO[3]) * Integer.parseInt(cartVO[2]));				// PRICE 
				pstmt.setInt(5, Integer.parseInt(cartVO[4]));											// POPTION
				
				pstmt.executeUpdate();
				
			}
			*/
			pstmt = con.prepareStatement(INSERT_CART);
			pstmt.setInt(1, Integer.parseInt(cartVO[0]));											// PCODE
			pstmt.setString(2, cartVO[1]);															// ID
			pstmt.setInt(3, Integer.parseInt(cartVO[2]));											// ORDERNUM
			pstmt.setInt(4, Integer.parseInt(cartVO[3]));											// PRICE 
			pstmt.setInt(5, Integer.parseInt(cartVO[4]));											// POPTION
			
			pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println("insertCartVO : " + e);
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
	
	public List<cartVO> getCartList(cartVO vo) {
		//String [] cartVO = cartList.split(",", -1);
		System.out.println("getCartList ===>");
		List<cartVO> cartlist = new ArrayList<cartVO>();
		try {
			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(GET_CART);		// select * from cart ca, pdetail pd where
														//   ca.poption = pd.poption and id = ?
			System.out.println("!!!!! => " + vo.getId());
			pstmt.setString(1, vo.getId());
			//pstmt.setString(1, cartVO[1]);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				cartVO product = new cartVO();
				product.setPcode(rs.getInt("PCODE"));
				product.setId(rs.getString("ID"));
				product.setOrderNum(rs.getInt("ORDERNUM"));
				product.setPrice(rs.getInt("PRICE"));
				product.setPoption(rs.getInt("POPTION"));
				product.setPname(rs.getString("PNAME"));
				product.setSize(rs.getString("SIZE"));
				product.setColor(rs.getString("COLOR"));
				product.setMargin(rs.getInt("MARGIN"));
				product.setImgpath(rs.getString("IMGPATH"));
				cartlist.add(product);
			}
			
		}catch (Exception e) {
			System.out.println("getCartList : " + e);
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		
		return cartlist;
	}
	public void deleteCart(cartVO vo) {
		System.out.println("deleteCart ===>");
		System.out.println(vo.getId());
		System.out.println(vo.getPoption());
		try {
			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(DELETE_CART);		// delete from cart where id = ? and poption = ?
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getPoption());
			System.out.println(pstmt);
			pstmt.executeUpdate();
			
			
			
		}catch (Exception e) {
			System.out.println("deleteCart : " + e);
		}finally {
			JDBCUtil.close(rs, pstmt, con);
		}
	}
}
