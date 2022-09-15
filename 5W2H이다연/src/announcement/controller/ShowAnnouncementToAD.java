package announcement.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import announcement.model.service.AnnouncementService;
import announcement.model.vo.Announcement;
import announcement.model.vo.PageInfo;

/**
 * Servlet implementation class ManageNoticeByAD
 */
@WebServlet("/notice.page")
public class ShowAnnouncementToAD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAnnouncementToAD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  AnnouncementService service = new AnnouncementService();
	      
	      int listCount;		//게시물 총 개수
		  int currentPage;	//현재 페이지 표시
		  int pageLimit;		//한 페이지에 표시될 페이징 수
		  int AnnouncementLimit;		//한 페이지에 보일 게시글 최대 개수
		  int maxPage;		//전체 페이지 중 가장 마지막 페이지
		  int startPage;		//페이징 된 페이지 중 시작 페이지
		  int endPage;		//페이징 된 페이지 중 마지막 페이지
			
		  listCount = service.getListCountByAD();
		  currentPage = 1;
		  if(request.getParameter("currentPage") != null) {
			  currentPage = Integer.parseInt(request.getParameter("currentPage"));
		  }
		   
		  pageLimit = 10;
		  AnnouncementLimit = 10;
		   
		  maxPage = (int)((double)listCount/AnnouncementLimit + 0.9);
		  System.out.println("maxPage : " + maxPage);

		  startPage = (currentPage-1) / pageLimit * pageLimit  + 1;
		   
		  endPage = startPage + pageLimit - 1;
		  if(maxPage <  endPage) {
			  endPage = maxPage;
		  }
		   
		  PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, AnnouncementLimit, maxPage, startPage, endPage);
		  
		  ArrayList<Announcement> announceList = service.showListToAD(pi);
		  System.out.println("controller의 announceList : " + announceList);
		  String page = null;
		  if(announceList != null) {
			  request.setAttribute("pi", pi);
			  request.setAttribute("announceList", announceList);
			  page = "WEB-INF/views/admin/noticeAdmin.jsp";
		  }else {
			  request.setAttribute("msg", "공지사항 조회에 실패했습니다.");
			  page = "WEB-INF/views/common/errorPage.jsp";
		  }
		  
		  request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
