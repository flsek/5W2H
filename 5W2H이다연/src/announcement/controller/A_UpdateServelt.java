package announcement.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import announcement.model.service.AnnouncementService;
import announcement.model.vo.Announcement;

/**
 * Servlet implementation class A_UpdateServelt
 */
@WebServlet("/update.a")
public class A_UpdateServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A_UpdateServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String date = request.getParameter("date");
		String content = request.getParameter("content");
		
		Date dat = new Date(new GregorianCalendar().getTimeInMillis());
		
		Announcement a = new Announcement();
		a.setaNo(no);
		a.setaContent(content);
		a.setaDate(dat);
		a.setaTitle(title);
				
		int result = new AnnouncementService().updateA(a);
		
		if(result > 0) {
			response.sendRedirect("detail.a?no=" + no);
		} else {
			request.setAttribute("msg", "공지사항 수정에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
