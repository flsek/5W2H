package users.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class DeleteUserOM
 */
@WebServlet("/deleteUser.om")
public class DeleteUserOM extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUserOM() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = ((Users) (request.getSession().getAttribute("loginUser"))).getUserId();

		Users user = new UsersService().selectUser(userId);

		String page = null;
		if (user != null) {
			page = "WEB-INF/views/mypage/delete.jsp";
			request.setAttribute("pwd", user.getUserPwd());
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "회원 탈퇴 페이지를 불러올 수 없습니다.");
		}
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
