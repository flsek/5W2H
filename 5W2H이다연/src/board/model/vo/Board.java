package board.model.vo;


import java.sql.Date;

public class Board {
	private int boardId;			// 게시판 고유 번호
	private String boardTitle;		// 게시판 제목(가게명)
	private String boardOpen;		// 게시판 content(영업 날짜)
	private String boardTel;		// 게시판 content(전화번호)
	private String boardAddress;	// 게시판 content(주소)
	private String boardMenu;		// 게시판 content(메뉴)
	private String boardPrice;		// 게시판 content(가격)
	private String boardComment;	// 게시판 content(한줄평)
	private String boardWriter;		// 게시글 작성자 = 회원아이디? 닉네임?
	private int boardCount;		// 게시글 조회수
	private Date createDate;		// 등록일자
	private Date modifyDate;		// 수정일자
	private String status;			// 활성화 상태
	
	public Board() {}

	public Board(int boardId, String boardTitle, String boardOpen, String boardTel, String boardAddress,
			String boardMenu, String boardPrice, String boardComment, String boardWriter, int boardCount,
			Date createDate, Date modifyDate, String status) {
		super();
		this.boardId = boardId;
		this.boardTitle = boardTitle;
		this.boardOpen = boardOpen;
		this.boardTel = boardTel;
		this.boardAddress = boardAddress;
		this.boardMenu = boardMenu;
		this.boardPrice = boardPrice;
		this.boardComment = boardComment;
		this.boardWriter = boardWriter;
		this.boardCount = boardCount;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardOpen() {
		return boardOpen;
	}

	public void setBoardOpen(String boardOpen) {
		this.boardOpen = boardOpen;
	}

	public String getBoardTel() {
		return boardTel;
	}

	public void setBoardTel(String boardTel) {
		this.boardTel = boardTel;
	}

	public String getBoardAddress() {
		return boardAddress;
	}

	public void setBoardAddress(String boardAddress) {
		this.boardAddress = boardAddress;
	}

	public String getBoardMenu() {
		return boardMenu;
	}

	public void setBoardMenu(String boardMenu) {
		this.boardMenu = boardMenu;
	}

	public String getBoardPrice() {
		return boardPrice;
	}

	public void setBoardPrice(String boardPrice) {
		this.boardPrice = boardPrice;
	}

	public String getBoardComment() {
		return boardComment;
	}

	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getBoardCount() {
		return boardCount;
	}

	public void setBoardCount(int boardCount) {
		this.boardCount = boardCount;
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
		return "Board [boardId=" + boardId + ", boardTitle=" + boardTitle + ", boardOpen=" + boardOpen + ", boardTel="
				+ boardTel + ", boardAddress=" + boardAddress + ", boardMenu=" + boardMenu + ", boardPrice="
				+ boardPrice + ", boardComment=" + boardComment + ", boardWriter=" + boardWriter + ", boardCount="
				+ boardCount + ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + "]";
	}
}
