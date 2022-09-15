package announcement.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import announcement.model.service.AnnouncementService;
import announcement.model.vo.Announcement;

/**
 * Servlet implementation class A_SelectServlet
 */
@WebServlet("/detail.a")
public class A_SelectServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A_SelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      int no = Integer.parseInt(request.getParameter("no"));
      
      Announcement a = new AnnouncementService().selectA(no);
      
      String page = null;
      
      if(a != null) {
         page = "WEB-INF/views/notice/noticeDetail.jsp";
         request.setAttribute("a", a);
      } else {
         page = "WEB-INF/views/common/errorPage.jsp";
         request.setAttribute("msg", "공지사항 조회에 실패했습니다.");
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