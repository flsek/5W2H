package announcement.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import announcement.model.vo.Announcement;
import announcement.model.vo.PageInfo;

public class AnnouncementDAO {
   private Properties prop = new Properties();
   
   public AnnouncementDAO() {
      String filename = AnnouncementDAO.class.getResource("/sql/announcement/a-query.properties").getPath();
      try {
         prop.load(new FileReader(filename));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   
// 공지사항 리스트 보기
   public ArrayList<Announcement> selectList(Connection conn, PageInfo pi) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Announcement> list = new ArrayList<Announcement>();
      
      String query = prop.getProperty("selectList");
      
      int startRow = (pi.getCurrentPage() - 1) * pi.getA_Limit() + 1;
      int endRow = startRow + pi.getA_Limit() - 1;
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Announcement(
                  rset.getInt("A_NO"), 
                  rset.getString("A_TITLE"), 
                  rset.getString("A_CONTENT"),
                  rset.getString("A_Writer"),
                  rset.getInt("A_COUNT"), 
                  rset.getDate("A_AT"),
                  rset.getString("STATUS")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }

   
   // 공지사항 삭제
   public int deleteA(Connection conn, int no) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("deleteA");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, no);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }

   // 조회수 업데이트
   public int updateCount(Connection conn, int no) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("updateCount");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, no);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }

   // 공지사항 상세 보기
   public Announcement selectA(Connection conn, int no) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Announcement a = null;
      
      String query = prop.getProperty("selectA");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, no);
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            a = new Announcement(
                  rset.getInt("A_NO"), 
                  rset.getString("A_TITLE"), 
                  rset.getString("A_CONTENT"),
                  rset.getString("A_WRITER"),
                  rset.getInt("A_COUNT"), 
                  rset.getDate("A_AT"),
                  rset.getString("STATUS")
                  );
         }
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(rset);
         close(pstmt);
      }
      return a;
   }

   // 공지사항 수정
   public int updateA(Connection conn, Announcement a) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("updateA");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, a.getaTitle());
         pstmt.setString(2, a.getaContent());
         pstmt.setDate(3, a.getaDate());
         pstmt.setInt(4, a.getaNo());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }

   // 공지사항 작성
   public int insertA(Connection conn, Announcement a) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertA");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, a.getaTitle());
         pstmt.setString(2, a.getaContent());
         pstmt.setString(3, a.getaWriter());
         pstmt.setDate(4, a.getaDate());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 전체 게시글 개수 구해오기
   public int getListCount(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      int result = 0;
      
      String query = prop.getProperty("listCount");
      
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);
         if(rset.next()) {
            result = rset.getInt(1);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
         
      
      return result;
   }
   
   public ArrayList<Announcement> ShowListToAD(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Announcement> announceList = new ArrayList<Announcement>();
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getA_Limit() + 1;
		int endRow = startRow + pi.getA_Limit() - 1;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("ShowListToAD"));
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				announceList.add(new Announcement(rset.getInt(2),
												  rset.getString(3),
												  rset.getString(4),
												  rset.getString(5),
												  rset.getInt(6),
												  rset.getDate(7),
												  rset.getString(8)
												  )
								);
			}
			System.out.println("DAO의 announceList : " + announceList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return announceList;
	}


	public int getListCountByAD(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getListCountByAD"));
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}


	public int saveAnnounce(Connection conn, int aNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("saveAnnounce"));
			pstmt.setInt(1, aNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}