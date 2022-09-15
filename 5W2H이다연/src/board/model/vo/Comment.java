package board.model.vo;

import java.sql.Date;

public class Comment {
	private int commentId;				// 댓글 고유 번호
	private String commentContent;		// 댓글 content
	private int boardId;				// 게시판 번호
	private String commentWriter;		// 댓글 작성자 = 회원 아이디? 닉네임?
	private Date createDate;			// 등록일자
	private Date modifyDate;			// 수정일자
	private String status;				// 활성화 상태
	
	public Comment () {}

	public Comment(int commentId, String commentContent, int boardId, String commentWriter, Date createDate,
			Date modifyDate, String status) {
		super();
		this.commentId = commentId;
		this.commentContent = commentContent;
		this.boardId = boardId;
		this.commentWriter = commentWriter;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getCommentId() {
		return commentId;
	}

	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", commentContent=" + commentContent + ", boardId=" + boardId
				+ ", commentWriter=" + commentWriter + ", createDate=" + createDate + ", modifyDate=" + modifyDate
				+ ", status=" + status + "]";
	}

	
}
