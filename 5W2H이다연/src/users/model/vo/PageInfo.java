package users.model.vo;

public class PageInfo {
	private int currentPage;
	private int listClunt;
	private int pageLimit;
	private int UserLimit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo(int cureentPage, int listClunt, int pageLimit, int boardLimit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = cureentPage;
		this.listClunt = listClunt;
		this.pageLimit = pageLimit;
		this.UserLimit = boardLimit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int cureentPage) {
		this.currentPage = cureentPage;
	}
	public int getListClunt() {
		return listClunt;
	}
	public void setListClunt(int listClunt) {
		this.listClunt = listClunt;
	}
	public int getPageLimit() {
		return pageLimit;
	}
	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}
	public int getUserLimit() {
		return UserLimit;
	}
	public void setUserLimit(int boardLimit) {
		this.UserLimit = boardLimit;
	}
	public int getMaxPage() {
		return maxPage;
	}
	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	@Override
	public String toString() {
		return "PageInfo [cureentPage=" + currentPage + ", listClunt=" + listClunt + ", pageLimit=" + pageLimit
				+ ", boardLimit=" + UserLimit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage="
				+ endPage + "]";
	}
	
	
}
