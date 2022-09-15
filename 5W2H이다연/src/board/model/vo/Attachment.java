package board.model.vo;

import java.sql.Date;

public class Attachment {
	private int fileId;				// 파일 고유 번호
	private int boardId;			// 게시판 고유 번호
	private String originName;		// 고유 파일 명
	private String changeName;		// 변경된 파일 명
	private String filePath;		// 파일 경로
	private Date uploadDate;		// 파일 업로드 날짜
	private int fileLevel;			// 썸네일 여부 판단 
	private String status;			// 활성화 상태
	
	public Attachment( ) {}
	
	public Attachment(int fileId, int boardId, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, String status) {
		super();
		this.fileId = fileId;
		this.boardId = boardId;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public int getBoardId() {
		return boardId;
	}
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getFileLevel() {
		return fileLevel;
	}
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Attachment [fileId=" + fileId + ", boardId=" + boardId + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", status=" + status + "]";
	}
}

