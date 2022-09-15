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
import users.model.vo.Users;

/**
 * Servlet implementation class A_InsertServlet
 */
@WebServlet("/insert.a")
public class A_InsertServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public A_InsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      String title = request.getParameter("title");
      String date = request.getParameter("date");
      String content = request.getParameter("content");   
      String userId = ((Users)request.getSession().getAttribute("loginUser")).getUserId();
   
      Date dat = new Date(new GregorianCalendar().getTimeInMillis());
//      System.out.println(date); // 아무것도 입력하지 않으면 ""로 들어옴
      
      
      Announcement a = new Announcement();
      a.setaContent(content);
      a.setaDate(dat);
      a.setaTitle(title);
      a.setaWriter(userId);
      
      int result = new AnnouncementService().insertA(a);
      
      if(result > 0) {
         response.sendRedirect("a_list.om");
      } else {
         request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
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