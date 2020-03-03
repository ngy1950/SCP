package com.company.SCP.notic;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.company.SCP.common.JDBCUtil;


public class NoticeDAO {
	//DB 관련 변수 선언
		private Connection conn= null;
		private PreparedStatement stmt = null;
		private ResultSet rs = null;
		
		private final String NOTICE_GET = "select * from notice where seq=?";
		
		public List<NoticeVO> getNoticeList(NoticeVO vo){
			System.out.println("===> JDBC로 getBoardList() 기능처리");
			
			List<NoticeVO> noticeList = new ArrayList<NoticeVO>();
			
			try {
				conn = JDBCUtil.getconnConnection();
				
				/*
				 * //아주 중요 => [SQL 문장] String where =""; if(searchField != null && searchText !=
				 * null) { where = "where " + searchField + " like '%" + searchText + "%'"; }
				 * 
				 * String BOARD_CONDITION_LIST ="select * from board " + where +
				 * " order by seq asc";
				 */
				String NOTICE_CONDITION_LIST ="select * from notice order by seq asc";
				stmt = conn.prepareStatement(NOTICE_CONDITION_LIST);
				rs = stmt.executeQuery();
				
				while(rs.next()) {
					NoticeVO notice = new NoticeVO(); //객체 생성
					
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
			System.out.println("===>JDBC로 getBoard()");
			NoticeVO notice = null;
			
			try {
				conn = JDBCUtil.getconnConnection();
				
				//1. 해당 게시글의 조회수(cnt) + 1 =>갱신(update) 처리
				String UPDATE_CNT ="update notice set cnt=cnt+1 where seq=?";
				stmt = conn.prepareStatement(UPDATE_CNT);
				stmt.setInt(1, vo.getSeq());
				stmt.executeUpdate();
				
				//2. 해당 게시글 가져오기
				stmt = conn.prepareStatement(NOTICE_GET); //"select * from board where seq=?"
				stmt.setInt(1, vo.getSeq());
				rs = stmt.executeQuery();
				
				if(rs.next()) {
					notice = new NoticeVO(); //객체 생성
					//BoardVO 클래스의 멤버변수 초기화 작업
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
