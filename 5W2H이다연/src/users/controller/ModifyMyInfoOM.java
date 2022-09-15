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
 * Servlet implementation class ModifyMyInfoOM
 */
@WebServlet("/modifyMyInfo.om")
public class ModifyMyInfoOM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyMyInfoOM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = ((Users)(request.getSession().getAttribute("loginUser"))).getUserId();
		System.out.println("userId : " + userId);
		
		Users user = new UsersService().selectUser(userId); 
		
		String page = null;
		if(user != null) {
			page = "WEB-INF/views/mypage/myInfo.jsp";
			request.setAttribute("user", user);
		}else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "페이지를 불러오는 것을 실패했습니다.");
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
