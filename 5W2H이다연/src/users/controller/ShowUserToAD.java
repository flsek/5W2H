package users.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;
import users.model.vo.PageInfo;
import users.model.vo.Users;

/**
 * Servlet implementation class ShowUserToAD
 */
@WebServlet("/admins.page")
public class ShowUserToAD extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShowUserToAD() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서 userId를 받아와서 db의 admin_ck가 1인지 확인. (혹시 모르니 확인 차원)
		UsersService service = new UsersService();

		String userId = ((Users) (request.getSession().getAttribute("loginUser"))).getUserId();
		System.out.println("userId : " + userId);
		int adminCk = service.getAdminCk(userId);
		System.out.println("adminCk : " + adminCk);

		if (adminCk == 1) {
			// 1이면 어드민임이 인증이 되었으므로, 리스트를 가져온다.
			// ArrayList<User> userList = new UserService().selectUserList();
			// ArrayList<Admin> admins = new AdminService().selectAdmins(); //어드민 아이디만 가져오늘
			// 줄;;

			int listCount; // 게시물 총 개수
			int currentPage; // 현재 페이지 표시
			int pageLimit; // 한 페이지에 표시될 페이징 수
			int UserLimit; // 한 페이지에 보일 게시글 최대 개수
			int maxPage; // 전체 페이지 중 가장 마지막 페이지
			int startPage; // 페이징 된 페이지 중 시작 페이지
			int endPage; // 페이징 된 페이지 중 마지막 페이지

			listCount = service.getListCount();
			System.out.println("listCount : " + listCount);
			currentPage = 1;
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}

			pageLimit = 10;
			UserLimit = 10;

			maxPage = (int) ((double) listCount / UserLimit + 0.9);
			System.out.println("maxPage : " + maxPage);

			startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

			endPage = startPage + pageLimit - 1;
			if (maxPage < endPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, UserLimit, maxPage, startPage, endPage);
			System.out.println("pi.getMaxpage : " + pi.getMaxPage());

			ArrayList<Users> userList = service.selectUserList(pi);

			String page = null;
			if (userList != null) {
				request.setAttribute("userList", userList);
				request.setAttribute("pi", pi);
				page = "WEB-INF/views/admin/index.jsp";
			} else {
				page = "WEB-INF/views/common/errorPage.jsp";
				request.setAttribute("msg", "사용자 목록을 불러오는 데 실패했습니다.");
			}

			request.getRequestDispatcher(page).forward(request, response);
		} else { // 1이 아니면 어드민이 아니므로, 메인 화면으로 돌아간다.
			response.sendRedirect(request.getContextPath());
		}
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
