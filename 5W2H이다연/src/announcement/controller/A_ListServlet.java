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
 * Servlet implementation class A_ListServlet
 */
@WebServlet("/a_list.om")
public class A_ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public A_ListServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 페이징 처리가 들어가면 Service를 두 번 요청하기 때문에 레퍼런스 변수로 생성
		// - 게시글 전체 개수 가져올 때 : 페이징 처리 계산에 사용
		// - 게시글 가져올 때
		AnnouncementService service = new AnnouncementService();

		// 페이징 처리에 사용할 변수 선언
		int listCount; // 게시물 총 개수
		int currentPage; // 현재 페이지 표시
		int pageLimit; // 한 페이지에 표시될 페이징 수
		int a_Limit; // 한 페이지에 보일 게시글 최대 개수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage; // 페이징 된 페이지 중 마지막 페이지

		// 전체 게시글 개수 구해오기
		listCount = service.getListCount();
//      System.out.println(listCount);
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		}

		pageLimit = 10;
		a_Limit = 10;

//      maxPage = (int) Math.ceil((double) listCount / a_Limit);
		maxPage = (int) ((double) listCount / a_Limit + 0.9);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, a_Limit, maxPage, startPage, endPage);

		// ANNOUNCEMENT에 대한 LIST 가져오기
		ArrayList<Announcement> list = new AnnouncementService().selectList(pi);

		String page = null;

		if (list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			page = "WEB-INF/views/notice/noticeList.jsp";
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");
		}

		// WEB-INF는 서버를 통해서 들어가야하기 때문에 단순 이동 불가
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}