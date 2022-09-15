package announcement.model.vo;

import java.sql.Date;

public class Announcement {
	private int aNo;
	private String aTitle;
	private String aContent;
	private String aWriter;
	private int aCount;
	private Date aDate;
	private String status;
	
	public Announcement() {}

	public Announcement(int aNo, String aTitle, String aContent, String aWriter, int aCount, Date aDate,
			String status) {
		super();
		this.aNo = aNo;
		this.aTitle = aTitle;
		this.aContent = aContent;
		this.aWriter = aWriter;
		this.aCount = aCount;
		this.aDate = aDate;
		this.status = status;
	}

	public int getaNo() {
		return aNo;
	}

	public void setaNo(int aNo) {
		this.aNo = aNo;
	}

	public String getaTitle() {
		return aTitle;
	}

	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}

	public String getaContent() {
		return aContent;
	}

	public void setaContent(String aContent) {
		this.aContent = aContent;
	}

	public String getaWriter() {
		return aWriter;
	}

	public void setaWriter(String aWriter) {
		this.aWriter = aWriter;
	}

	public int getaCount() {
		return aCount;
	}

	public void setaCount(int aCount) {
		this.aCount = aCount;
	}

	public Date getaDate() {
		return aDate;
	}

	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Announcement [aNo=" + aNo + ", aTitle=" + aTitle + ", aContent=" + aContent + ", aWriter=" + aWriter
				+ ", aCount=" + aCount + ", aDate=" + aDate + ", status=" + status + "]";
	}

	

	
	
}
