package users.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/deleteUser.me")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * Session에서 id를 가져와, 유저 활성화 상태를 N으로 바꾸는 쿼리 실행 후 int 반환.
		 */
		String userId = ((Users) (request.getSession().getAttribute("loginUser"))).getUserId();

		int result = new UsersService().deleteUser(userId);

		if (result > 0) {
			HttpSession session = request.getSession();
			session.invalidate(); // 세션 무효화
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원 탈퇴 실패");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
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
