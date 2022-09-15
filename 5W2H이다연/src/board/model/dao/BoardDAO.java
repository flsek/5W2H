package board.model.dao;

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

import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Comment;
import board.model.vo.PageInfo;


public class BoardDAO {
   private Properties prop = new Properties();
   
   public BoardDAO() {
      String fileName = BoardDAO.class.getResource("/sql/board/b-query.properties").getPath();
      
      try {
         prop.load(new FileReader(fileName));
      } catch (FileNotFoundException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   public ArrayList<Board> selectBlist(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<Board> Blist = null;
      
      String query = prop.getProperty("selectBList");
      
      try {
         stmt = conn.createStatement();
         
         rset = stmt.executeQuery(query);   // 실행할 SQL 문은 비어 있거나 널일 수 없음 : DB에 데이터가 없어서 그런가..?
         Blist = new ArrayList<Board>();
         
         while(rset.next()) {
            Blist.add(new Board(rset.getInt("B_ID"),
                           rset.getString("B_TITLE"),
                           rset.getString("B_OPEN"),
                           rset.getString("B_TEL"),
                           rset.getString("B_ADDR"),
                           rset.getString("B_MENU"),
                           rset.getString("B_PRICE"),
                           rset.getString("B_COMMENT"),
                           rset.getString("B_WRITER"),
                           rset.getInt("B_COUNT"),
                           rset.getDate("CREATE_DATE"),
                           rset.getDate("MODIFY_DATE"),
                           rset.getString("STATUS")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      
      return Blist;
   }

   public ArrayList<Attachment> selectFlist(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<Attachment> Flist = null;
      
      String query = prop.getProperty("selectFList");
      
      try {
         stmt = conn.createStatement();
         rset = stmt.executeQuery(query);
         
         Flist = new ArrayList<Attachment>();
         
         while(rset.next()) {
            Attachment a = new Attachment();
            a.setBoardId(rset.getInt("B_ID"));
            a.setChangeName(rset.getString("CHANGE_NAME"));
            
            Flist.add(a);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      
      return Flist;
   }
   
      public int insertBoard(Connection conn, Board b) {
            PreparedStatement pstmt = null;
            int result = 0;

            String query = prop.getProperty("insertBoard");

            try {
               pstmt = conn.prepareStatement(query);
               pstmt.setString(1, b.getBoardTitle());
               pstmt.setString(2, b.getBoardOpen());
               pstmt.setString(3, b.getBoardTel());
               pstmt.setString(4, b.getBoardAddress());
               pstmt.setString(5, b.getBoardMenu());
               pstmt.setString(6, b.getBoardPrice());
               pstmt.setString(7, b.getBoardComment());
               pstmt.setString(8, b.getBoardWriter());
               result = pstmt.executeUpdate();

            } catch (SQLException e) {
               e.printStackTrace();
            } finally {
               close(pstmt);
            }

            return result;
      }

   public int deleteBoard(Connection conn, int bId) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("deleteBoard");
      
      try {
         pstmt = conn.prepareStatement(query);
         
         pstmt.setInt(1, bId);
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   
   public int updateBoard(Connection conn, Board b) {
      PreparedStatement pstmt = null;
      
      int result = 0;
      
      String query = prop.getProperty("updateBoard");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, b.getBoardTitle());
         pstmt.setString(2, b.getBoardOpen());
         pstmt.setString(3, b.getBoardTel());
         pstmt.setString(4, b.getBoardAddress());
         pstmt.setString(5, b.getBoardMenu());
         pstmt.setString(6, b.getBoardPrice());
         pstmt.setString(7, b.getBoardComment());
         pstmt.setInt(8, b.getBoardId());
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
   
      return result;
   }
   
   public int getListCount(Connection conn) {
      Statement stmt = null;
      ResultSet rset = null;
      int result = 0;
      
      String query = prop.getProperty("getListCount");
         
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
   
   public int updateCount(Connection conn, int bId) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("updateCount");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bId);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      return result;
   }
   // 게시글 상세조회
   public Board selectBoard(Connection conn, int bId) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      Board b = null;
      
      String query = prop.getProperty("selectBoard");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bId);
         
         rset = pstmt.executeQuery();
         if(rset.next()) {
            b = new Board(rset.getInt("B_ID"),
                     rset.getString("B_TITLE"),
                     rset.getString("B_OPEN"),
                     rset.getString("B_TEL"),
                     rset.getString("B_ADDR"),
                     rset.getString("B_MENU"),
                     rset.getString("B_PRICE"),
                     rset.getString("B_COMMENT"),
                     rset.getString("B_WRITER"),
                     rset.getInt("B_COUNT"),
                     rset.getDate("CREATE_DATE"),
                     rset.getDate("MODIFY_DATE"),
                     rset.getString("STATUS"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return b;
   }
   
   public int insertFile(Connection conn, ArrayList<Attachment> fileList) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertFile");
      
      try {
         for(int i = 0; i < fileList.size(); i++) {
            Attachment a = fileList.get(i);
         
            pstmt = conn.prepareStatement(query);
         
            pstmt.setString(1, a.getOriginName());
            pstmt.setString(2, a.getChangeName());
            pstmt.setString(3, a.getFilePath());
            pstmt.setInt(4, a.getFileLevel());
            
            result += pstmt.executeUpdate();
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(pstmt);
      }

      return result;
   }   
   
   public ArrayList<Attachment> selectFiles(Connection conn, int bId) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<Attachment> list = null;
      
      String query = prop.getProperty("selectFiles");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setInt(1, bId);
         
         rset = pstmt.executeQuery();
         list = new ArrayList<Attachment>();
         
         while(rset.next()) {
            Attachment a = new Attachment();
            a.setFileId(rset.getInt("file_id"));
            a.setOriginName(rset.getString("origin_name"));
            a.setChangeName(rset.getString("change_name"));
            a.setFilePath(rset.getString("file_path"));
            a.setUploadDate(rset.getDate("upload_at"));
            
            list.add(a);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(conn);
      }
      
      return list;
   }

public ArrayList<Comment> selectCommentList(Connection conn, int bId) {
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	ArrayList<Comment> ComList = null;
	
	String query = prop.getProperty("selectCommentList");
    
    try {
       pstmt = conn.prepareStatement(query);
       pstmt.setInt(1, bId);
       
       rset = pstmt.executeQuery();
       ComList = new ArrayList<Comment>();
       
       while(rset.next()) {
          ComList.add(new Comment(rset.getInt("C_ID"),
                         rset.getString("C_CONTENT"),
                         rset.getInt("B_ID"),
                         rset.getString("C_WRITER"),
                         rset.getDate("CREATE_DATE"),
                         rset.getDate("MODIFY_DATE"),
                         rset.getString("STATUS")));
          System.out.println(ComList);
       }
       
    } catch (SQLException e) {
       e.printStackTrace();
    } finally {
       close(rset);
       close(pstmt);
    }
	return ComList;
}
   
   public int insertComment(Connection conn, Comment c) {
      PreparedStatement pstmt = null;
      int result = 0;
      
      String query = prop.getProperty("insertComment");
      
      try {
         pstmt = conn.prepareStatement(query);
         pstmt.setString(1, c.getCommentContent());
         pstmt.setInt(2, c.getBoardId());
         pstmt.setString(3, c.getCommentWriter());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
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

	public ArrayList<Board> selectBoardList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> boardList = new ArrayList<Board>();
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getUserLimit() + 1;
		int endRow = startRow + pi.getUserLimit() - 1;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectBoardList"));
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				boardList.add(new Board(rset.getInt(2),
						                rset.getString(3),
						                rset.getString(4),
						                rset.getString(5),
						                rset.getString(6),
						                rset.getString(7),
						                rset.getString(8),
						                rset.getString(9),
						                rset.getString(10),
						                rset.getInt(11),
						                rset.getDate(12),
						                rset.getDate(13),
						                rset.getString(14)
						                )
						);
			}
			System.out.println("DAO의 boardList : " + boardList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return boardList;
	}

	public int saveReply(Connection conn, int replyId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("saveReply"));
			pstmt.setInt(1, replyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int saveBoard(Connection conn, int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("saveBoard"));
			pstmt.setInt(1, boardId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int deleteReply(Connection conn, int replyId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteReply"));
			pstmt.setInt(1, replyId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Comment> SelectCommentsToAD(Connection conn, int boardId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comment> comments = new ArrayList<Comment>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("SelectCommentsToAD"));
			pstmt.setInt(1, boardId);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				comments.add(new Comment(rset.getInt(1),
						                 rset.getString(2),
						                 rset.getInt(3),
						                 rset.getString(4),
						                 rset.getDate(5),
						                 rset.getDate(6),
						                 rset.getString(7)
						                 )
						);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return comments;
	}
}