package com.company.SCP.notic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.SCP.common.JDBCUtil;


public class NoticeDAO {
	//DB ���� ���� ����
		private Connection conn= null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		
		private final String NOTICE_GET = "select * from notice where seq=?";
		
		public List<NoticeVO> getNoticeList(NoticeVO vo){
			System.out.println("===> JDBC�� getBoardList() ���ó��");
			
			List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
			
			try {
				conn = JDBCUtil.getconnConnection();
				
				/*
				 * //���� �߿� => [SQL ����] String where =""; if(searchField != null && searchText !=
				 * null) { where = "where " + searchField + " like '%" + searchText + "%'"; }
				 * 
				 * String BOARD_CONDITION_LIST ="select * from board " + where +
				 * " order by seq asc";
				 */
				String NOTICE_CONDITION_LIST ="select * from notice order by seq asc";
				stmt = conn.prepareStatement(NOTICE_CONDITION_LIST);
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					NoticeVO notice = new NoticeVO(); //��ü ����
					
					notice.setSeq(rs.getInt("SEQ"));
					notice.setTitle(rs.getString("TITLE"));
					notice.setContent(rs.getString("CONTENT"));
					notice.setRegDate(rs.getDate("REGDATE"));
					notice.setCnt(rs.getInt("CNT"));
					
					noticeList.add(notice);
					
				}
						
			}catch(Exception e) {
				System.out.println("getBoardList()" + e);
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return noticeList;
		}//end getBoardList
		
		public NoticeVO getNotice(NoticeVO vo) {
			System.out.println("===>JDBC�� getBoard()");
			NoticeVO notice = null;
			
			try {
				conn = JDBCUtil.getconnConnection();
				
				//1. �ش� �Խñ��� ��ȸ��(cnt) + 1 =>����(update) ó��
				String UPDATE_CNT ="update notice set cnt=cnt+1 where seq=?";
				stmt = conn.prepareStatement(UPDATE_CNT);
				stmt.setInt(1, vo.getSeq());
				stmt.executeUpdate();
				
				//2. �ش� �Խñ� ��������
				stmt = conn.prepareStatement(NOTICE_GET); //"select * from board where seq=?"
				stmt.setInt(1, vo.getSeq());
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					notice = new NoticeVO(); //��ü ����
					//BoardVO Ŭ������ ������� �ʱ�ȭ �۾�
					notice.setTitle(rs.getString("TITLE"));
					notice.setContent(rs.getString("CONTENT"));
					notice.setRegDate(rs.getDate("REGDATE"));
					notice.setCnt(rs.getInt("CNT"));
				}
				
			}catch(Exception e) {
				System.out.println("getList()" + e);
			}finally {
				JDBCUtil.close(rs, stmt, conn);
			}
			return notice;
		}//end getBoard
}
