package announcement.model.vo;

public class PageInfo {
	private int currentPage;
	private int listCount;
	private int pageLimit;
	private int a_Limit;
	private int maxPage;
	private int startPage;
	private int endPage;
	
	public PageInfo() {}

	public PageInfo(int currentPage, int listCount, int pageLimit, int a_Limit, int maxPage, int startPage,
			int endPage) {
		super();
		this.currentPage = currentPage;
		this.listCount = listCount;
		this.pageLimit = pageLimit;
		this.a_Limit = a_Limit;
		this.maxPage = maxPage;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getListCount() {
		return listCount;
	}

	public void setListCount(int listCount) {
		this.listCount = listCount;
	}

	public int getPageLimit() {
		return pageLimit;
	}

	public void setPageLimit(int pageLimit) {
		this.pageLimit = pageLimit;
	}

	public int getA_Limit() {
		return a_Limit;
	}

	public void setA_Limit(int a_Limit) {
		this.a_Limit = a_Limit;
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
		return "PageInfo [currentPage=" + currentPage + ", listCount=" + listCount + ", pageLimit=" + pageLimit
				+ ", a_Limit=" + a_Limit + ", maxPage=" + maxPage + ", startPage=" + startPage + ", endPage=" + endPage
				+ "]";
	}
	
	
}
