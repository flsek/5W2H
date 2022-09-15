package users.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class InsertMemberServlet
 */
//@WebServlet("/insert.me")  // urlPatterns(default)
@WebServlet(urlPatterns ="/insert.me", name="InsertUsersServlet")  // urlPatterns(default)

public class InsertUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertUsersServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("input_Id");
		String userPwd = request.getParameter("userPwd");
		System.out.println(userPwd);
		String userName = request.getParameter("userName");
		String nickname = request.getParameter("nickname");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		Users users = new Users();
		users.setUserId(userId);
		users.setUserPwd(userPwd);
		users.setUserName(userName);
		users.setNickname(nickname);
		users.setPhone(phone);
		users.setEmail(email);
		users.setAddress(address);

		int result = new UsersService().insertUsers(users);

		if (result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원가입에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp");
			view.forward(request, response);
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