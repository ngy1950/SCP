package com.company.SCP.pdetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.SCP.common.JDBCUtil;
import com.company.SCP.product.productVO;

public class pdetailDAO {
	
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private final String PRODUCT_OPTION_GET = "select * from pdetail where pcode = ?";
	private final String GET_OPTION1 = "select min(poption),pname,pcode,price from pdetail where pcode = ? group by pname order by 1;";
	

	public List<pdetailVO> GetOption1(pdetailVO vo) {
		System.out.println("GetOption1 ====>");
		List<pdetailVO> optionList = new ArrayList<pdetailVO>();
		
		try {
			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(GET_OPTION1);
			pstmt.setInt(1, vo.getPcode());
			System.out.println("getPcode =>" + vo.getPcode());
			rs = pstmt.executeQuery();
			System.out.println("GET_OPTION1 =>" + pstmt);
			while (rs.next()) {	
				pdetailVO productoption = new pdetailVO();
				productoption.setPoption(rs.getInt("min(poption)"));
				productoption.setPname(rs.getString("PNAME"));
				productoption.setPcode(rs.getInt("PCODE"));
				productoption.setPrice(rs.getInt("PRICE"));
				optionList.add(productoption);
			}
		} catch (Exception e) {
			System.out.println("getProduct : " + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		System.out.println(optionList.size());
		return optionList;
	}// end GetOption1()
	
	public List<pdetailVO> GetOption2(String itemList) {
		System.out.println("GetOption2  Size====>");
		String [] option = itemList.split(",", -1);

		String GET_OPTION2 = "";
		if(option.length == 2) {			// 옵션박스2 번째까지 선택했을 경우SQL문

			GET_OPTION2 = "select size from PDETAIL  where pname like '"+ option[1]+"' and pcode = ? group by size";
				
		}else if(option.length == 3){								// 옵션박스 3번째까지 선택했을 경우 SQL문
			GET_OPTION2 = "select * from PDETAIL  where pname like '%"+ option[1]+"%' and pcode = ? and " +"size = '"+option[option.length-1]+"'";
		}else {
			GET_OPTION2 = "select * from pdetail where pname ='"+ option[1] +"' and pcode = ? and size ='"+ option[2] +"' and color = '"+ option[3] +"'";
		}
		List<pdetailVO> optionList = new ArrayList<pdetailVO>();
		
		try {
			con = JDBCUtil.getconnConnection();
			pstmt = con.prepareStatement(GET_OPTION2);	
			pstmt.setInt(1, Integer.parseInt(option[0]));
			rs = pstmt.executeQuery();

			while (rs.next()) {
				pdetailVO productoption = new pdetailVO();		
				if(option.length == 2) {productoption.setSize(rs.getString("SIZE"));}
				else {
					productoption.setColor(rs.getString("COLOR"));
					productoption.setMargin(rs.getInt("MARGIN"));
					productoption.setPoption(rs.getInt("poption"));
					productoption.setPrice(rs.getInt("price"));
				}
				optionList.add(productoption);	
			}
		} catch (Exception e) {
			System.out.println("getProduct : " + e);
		} finally {
			JDBCUtil.close(rs, pstmt, con);
		}
		System.out.println(optionList.size());
		return optionList;
	}// end GetOption2()
	
}
