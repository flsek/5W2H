package announcement.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import announcement.model.service.AnnouncementService;

/**
 * Servlet implementation class DeleteAnnouncementByAD
 */
@WebServlet("/deleteAnnounce.ad")
public class DeleteAnnouncementByAD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAnnouncementByAD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int aNo = Integer.parseInt(request.getParameter("noticeId"));
		
		int result = new AnnouncementService().deleteA(aNo);
		
		String page = null;
		if(result > 0) {
			response.getWriter().print(result);
		}else {
			request.setAttribute("msg", "공지사항 삭제에 실패했습니다.");
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
