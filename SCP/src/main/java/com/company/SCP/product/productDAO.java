package com.company.SCP.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.SCP.common.JDBCUtil;

public class productDAO {
	// DB 관한 변수 선언
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	// CRUD SQL 명령문 정의
	private final String PRODUCT_GET = "select * from product where pcode=?";
	private final String SEARCH_GET = "select * from product where pname like '%?%'";
	private final String PRODUCT_CATEGORY = "select * from product where category = ?";

	public List<productVO> getProductList(productVO vo) {
		System.out.println("getProductList ===> ");
		List<productVO> productList = new ArrayList<productVO>();
		try {
			con = JDBCUtil.getconnConnection();
			String where = "";
			/*
			 * if(searchField != null && searchText != null) { where = "where " +
			 * searchField + " like '%" + searchText + "%' "; }
			 */
			String BOARD_CONDITION_LIST = "select * from product " + where + " order by pcode ASC";
			pstmt = con.prepareStatement(BOARD_CONDITION_LIST);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				productVO product = new productVO();
				product.setPcode(rs.getInt("PCODE"));
				product.setPname(rs.getString("PNAME"));
				product.setPprice(rs.getInt("PPRICE"));
				product.setPdate(rs.getDate("PDATE"));
				product.setPtext(rs.getString("PTEXT"));
				product.setSale(rs.getInt("SALE"));
				product.setImgpath(rs.getString("IMGPATH"));
				product.setImgpath2(rs.getString("IMGPATH2"));

				productList.add(product);
			}
		} catch (Exception e) {
			System.out.println("getBoardList()" + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		return productList;
	}// end getProductList()

	public productVO getProduct(productVO vo) {
		System.out.println("getProduct ====>");
		productVO product = new productVO();

		try {
			/*
			 * con = JDBCUtil.getconnConnection(); pstmt =
			 * con.prepareStatement(PRODUCT_GET); pstmt.setInt(1, vo.getPcode()); rs =
			 * pstmt.executeQuery();
			 */

			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(PRODUCT_GET);
			pstmt.setInt(1, vo.getPcode());
			rs = pstmt.executeQuery();

			if (rs.next()) {
				product.setPcode(rs.getInt("PCODE"));
				product.setPname(rs.getString("PNAME"));
				product.setPprice(rs.getInt("PPRICE"));
				product.setPdate(rs.getDate("PDATE"));
				product.setPtext(rs.getString("PTEXT"));
				product.setSale(rs.getInt("SALE"));
				product.setImgpath(rs.getString("IMGPATH"));
				product.setImgpath2(rs.getString("IMGPATH2"));
			}
		} catch (Exception e) {
			System.out.println("getProduct : " + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		System.out.println(" product =>" + product);
		return product;
	}// end getProduct()

	public List<productVO> getSearchList(productVO vo, String searchText) {
		System.out.println("getSearchList ===> ");
		List<productVO> productList = new ArrayList<productVO>();
		try {
			con = JDBCUtil.getconnConnection();

			String BOARD_CONDITION_LIST = "select * from product where pname like '%"+ searchText +"%' order by pcode";
			pstmt = con.prepareStatement(BOARD_CONDITION_LIST);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("!!"+ rs.getString("PNAME"));
				productVO product = new productVO();
				product.setPcode(rs.getInt("PCODE"));
				product.setPname(rs.getString("PNAME"));
				product.setPprice(rs.getInt("PPRICE"));
				product.setPdate(rs.getDate("PDATE"));
				product.setPtext(rs.getString("PTEXT"));
				product.setSale(rs.getInt("SALE"));
				product.setImgpath(rs.getString("IMGPATH"));
				product.setImgpath2(rs.getString("IMGPATH2"));
				productList.add(product);
			}
		} catch (Exception e) {
			System.out.println("getBoardList()" + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		System.out.println("productList" + productList);
		return productList;
	}// end getSearchList()
	
	public List<productVO> getCategory(productVO vo) {
		System.out.println("getCategory ====>");
		List<productVO> productList = new ArrayList<productVO>();

		try {
			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(PRODUCT_CATEGORY);
			pstmt.setString(1, vo.getCategory());
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				productVO product = new productVO();
				product.setPcode(rs.getInt("PCODE"));
				product.setPname(rs.getString("PNAME"));
				product.setPprice(rs.getInt("PPRICE"));
				product.setPdate(rs.getDate("PDATE"));
				product.setSale(rs.getInt("SALE"));
				product.setPtext(rs.getString("PTEXT"));
				product.setImgpath(rs.getString("IMGPATH"));
				product.setImgpath2(rs.getString("IMGPATH2"));
				product.setCategory(rs.getString("CATEGORY"));
				
				productList.add(product);
				System.out.println("product : " + product);
			}
		} catch (Exception e) {
			System.out.println("getProduct : " + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		System.out.println("productList : " + productList);
		return productList;
	}// end getCategory()

	
}
