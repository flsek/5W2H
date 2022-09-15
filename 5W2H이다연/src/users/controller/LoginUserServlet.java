package users.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import users.model.service.UsersService;
import users.model.vo.Users;

/**
 * Servlet implementation class LoginUserServlet
 */
@WebServlet(urlPatterns = "/login.me", name="LoginUserServlet")
public class LoginUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginUserServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		System.out.println(userPwd);
		Users user = new Users();
		user.setUserId(userId);
		user.setUserPwd(userPwd);
		
		Users loginUser = new UsersService().loginUser(user);
		
		if(loginUser != null) { // 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(600); // session 유효 시간 설정
			
			response.sendRedirect("index.jsp");
			
		} else { // 로그인 실패
			request.setAttribute("msg", "로그인 실패");
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
