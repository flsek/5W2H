package announcement.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import announcement.model.dao.AnnouncementDAO;
import announcement.model.vo.Announcement;
import announcement.model.vo.PageInfo;

public class AnnouncementService {
   
   // 공지사항 리스트
   public ArrayList<Announcement> selectList(PageInfo pi) {
      Connection conn = getConnection();
      
      ArrayList<Announcement> list = new AnnouncementDAO().selectList(conn, pi);
      
      close(conn);
      return list;
   }

   // 공지사항 삭제
   public int deleteA(int no) {
      Connection conn = getConnection();
      
      int result = new AnnouncementDAO().deleteA(conn, no);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      
      close(conn);
      return result;
   }

   // 조회수 업데이트 + 공지사항 상세보기
   public Announcement selectA(int no) {
      Connection conn = getConnection();
      
      // 조회수 업데이트
      int result = new AnnouncementDAO().updateCount(conn, no);
      
      // 공지사항 상세보기
      Announcement a = new AnnouncementDAO().selectA(conn, no);
      
      if(result > 0) {
         a = new AnnouncementDAO().selectA(conn, no);
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      return a;
   }
   
   // 공지사항 수정
   public int updateA(Announcement a) {
      Connection conn = getConnection();
      
      int result = new AnnouncementDAO().updateA(conn, a);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      return result;
   }

   // 공지사항 작성
   public int insertA(Announcement a) {
      Connection conn = getConnection();
      
      int result = new AnnouncementDAO().insertA(conn, a);
      
      if(result > 0) {
         commit(conn);
      } else {
         rollback(conn);
      }
      close(conn);
      return result;
   }

   // 전체 게시글 개수 구해오기
   public int getListCount() {
      Connection conn = getConnection();
      int listCount = new AnnouncementDAO().getListCount(conn);
      
      close(conn);
      return listCount;
   }
   
   public ArrayList<Announcement> showListToAD(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Announcement> announceList = new AnnouncementDAO().ShowListToAD(conn, pi);
		System.out.println("controller의 announceList : " + announceList);
		close(conn);
		
		return announceList;
	}

	public int getListCountByAD() {
		Connection conn = getConnection();
		int listCount = new AnnouncementDAO().getListCountByAD(conn);
		
		close(conn);
		return listCount;
	}

	public int saveAnnounce(int aNo) {
		Connection conn = getConnection();
		
		int result = new AnnouncementDAO().saveAnnounce(conn, aNo);
		
		close(conn);
		
		return result;
	}

}