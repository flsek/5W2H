package board.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import board.model.dao.BoardDAO;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Comment;
import board.model.vo.PageInfo;

public class BoardService {
	// 게시글 리스트 가져오기 -> 제네릭 잠깐 지우기
	public ArrayList selectFlist(int i) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();
		ArrayList list = null;

		// 같은 메서드이지만 받아오는 값에 따라 다르게 코딩
		if (i == 1) {
			list = dao.selectBlist(conn);
		} else {
			list = dao.selectFlist(conn);
		}
		close(conn);

		return list;
	}

	// 게시판 내용 + 이미지 파일 DB에 넘겨주기
	public int insertBoard(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();
		int result1 = dao.insertBoard(conn, b);
		int result2 = dao.insertFile(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 + result2;
	}

	public int deleteBoard(int bId) {
		Connection conn = getConnection();

		int result = new BoardDAO().deleteBoard(conn, bId);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int updateBoard(Board b) {
		Connection conn = getConnection();

		int result = new BoardDAO().updateBoard(conn, b);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new BoardDAO().getListCount(conn);

		close(conn);

		return listCount;
	}

	// 게시글 상세조회
	public Board selectBoard(int bId) {
		Connection conn = getConnection();

		// 상세보기 할 때는 count도 올라가야 함. updateCount 먼저 진행.
		int result = new BoardDAO().updateCount(conn, bId);
		Board board = null;
		if (result > 0) {
			board = new BoardDAO().selectBoard(conn, bId);
			if (board != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}
		close(conn);
		return board;
	}

	public ArrayList<Attachment> selectFiles(int bId) {
		Connection conn = getConnection();

		ArrayList<Attachment> list = new BoardDAO().selectFiles(conn, bId);

		close(conn);

		return list;
	}

	public List<Board> getBoardList(String field, String query, int i) {
		// TODO Auto-generated method stub
		return null;
	}

	public ArrayList<Comment> selectCommentlist(int bId) {
		Connection conn = getConnection();
		ArrayList<Comment> ComList = new BoardDAO().selectCommentList(conn, bId);

		close(conn);

		return ComList;
	}

	public ArrayList<Comment> insertComment(Comment c) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();

		int result = dao.insertComment(conn, c);

		ArrayList<Comment> list = null;

		if (result > 0) {
			commit(conn);
			list = dao.selectCommentList(conn, c.getBoardId());
		} else {
			rollback(conn);
		}

		close(conn);

		return list;
	}
	
	// ADMIN 부분 : BOARDLIST
	public int getListCountByAD() {
		Connection conn = getConnection();
		
		int result = new BoardDAO().getListCountByAD(conn);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectBoardList(PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<Board> boardList = new BoardDAO().selectBoardList(conn, pi);
		
		close(conn);
		
		return boardList;
	}

	public int saveReply(int replyId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().saveReply(conn, replyId);
		
		close(conn);
		
		return result;
	}

	public int saveBoard(int boardId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().saveBoard(conn, boardId);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	public int deleteReply(int replyId) {
		Connection conn = getConnection();
		
		int result = new BoardDAO().deleteReply(conn, replyId);
		
		close(conn);
		
		return result;
	}

	public ArrayList<Comment> SeletCommnetsToAD(int boardId) {
		Connection conn = getConnection();
		
		ArrayList<Comment> comments = new BoardDAO().SelectCommentsToAD(conn, boardId);
		
		close(conn);
		
		return comments;
	}
	
}