package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardListServelt
 */
@WebServlet("/list.bo") 									/* 연결완료  : 문제있음 */
public class BoardListServelt extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardListServelt() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
	   
	   
	   // 레퍼런스 변수로 여러번 왔다갔다 해야함
	   BoardService service = new BoardService();
	   int listCount; 		// 게시물 총 개수
	   
	   // 전체 게시글 개수 구해오기
		listCount = service.getListCount();
	   
	   ArrayList<Board> Blist = service.selectFlist(1);
	   ArrayList<Attachment> Flist = service.selectFlist(2);
	   
	   String page = null;
	   
	   if(Blist != null && Flist != null) {
		   request.setAttribute("Blist", Blist);
		   request.setAttribute("Flist", Flist);
		   page = "WEB-INF/views/board/boardList.jsp";
	   } else {
		   request.setAttribute("msg", "뭐가 문제냐");
		   page = "WEB-INF/views/common/errorPage.jsp";
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