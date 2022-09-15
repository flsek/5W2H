package users.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import users.model.service.UsersService;

/**
 * Servlet implementation class CheckIdServlet
 */
@WebServlet("/CheckNick.me")
public class CheckNickServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CheckNickServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String inputNick = request.getParameter("inputNick");

		int result = new UsersService().checkId(inputNick);
		// 없으면 사용 중인 아이디라고 뜨기 때문에 if 안쓰고 바로 result 넘겨주기
		request.setAttribute("result", result);
		
		// 중복 확인 안에 작성한 아이디를 아이디 중복 검사 폼에 보내기
		request.setAttribute("checkedNick", inputNick);
		
		// 넘겨줄 데이터가 있기 때문에 forward()
		request.getRequestDispatcher("WEB-INF/views/login/checkNickForm.jsp").forward(request, response);
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
