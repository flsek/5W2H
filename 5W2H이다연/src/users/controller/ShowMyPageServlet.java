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
 * Servlet implementation class ShowMyPageServlet
 */
@WebServlet("/myPage.me")
public class ShowMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowMyPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 1. 세션에 로그인되어 있는 사용자를 String에 담고
		 * 2. users 객체 생성
		 * 3. selectUser service, dao 생성
		 * */
		//더미 데이터. 로그인 구현되면 없앨 거임.
		/*
		 * String userId = "nsj247"; HttpSession session = request.getSession();
		 * session.setAttribute("userId", userId);
		 */
		//session.setMaxInactiveInterval(600);
		String userId = ((Users)(request.getSession().getAttribute("loginUser"))).getUserId();
		
		Users user = new UsersService().selectUser(userId);
		
		String page = null;
		if(user != null) {
			page = "WEB-INF/views/mypage/mypage.jsp";
			request.setAttribute("user", user);
		}else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "내 정보 조회에 실패하였습니다.");
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
