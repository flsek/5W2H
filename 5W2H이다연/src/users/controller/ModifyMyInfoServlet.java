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
 * Servlet implementation class ModifyMyInfoServlet
 */
@WebServlet("/modifyMyInfo.me")
public class ModifyMyInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ModifyMyInfoServlet() {
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
		 * mypage에서 정보를 받아 myInfo로 정보를 넘겨준다.
		 */
		request.setCharacterEncoding("UTF-8");

		String userId = ((Users) (request.getSession().getAttribute("loginUser"))).getUserId();
		String nick = request.getParameter("nick");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String address = request.getParameter("address");

		Users user = new Users();
		user.setUserId(userId);
		user.setNickname(nick);
		user.setEmail(email);
		user.setAddress(address);

		int result = new UsersService().modifyUser(user);

		String page = null;
		if (result > 0) {
			response.sendRedirect("myPage.me");
		} else {
			request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
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
