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
import board.model.vo.Comment;

/**
 * Servlet implementation class SelectBoardServlet
 */
@WebServlet("/detail.bo")
public class SelectBoardServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public SelectBoardServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      // int로 받아야 하기 때문에 파싱해주기
      int bId = Integer.parseInt(request.getParameter("bId"));
      
      // 게시글 목록과 사진 목록을 둘 다 가져와야 하기 때문에 레퍼런스 변수로 만들어주기.
      BoardService service = new BoardService();
      Board board = service.selectBoard(bId);
      
      // 한 게시글에 파일이 여러 개 들어가 있을 수 있기 때문에 ArrayList 사용
      ArrayList<Attachment> fileList = service.selectFiles(bId);
      ArrayList<Comment> ComList = service.selectCommentlist(bId);
      // 에러가 나던 정상적인 페이지를 가지고 오던 간에 데이터를 가지고 돌아옴.
      // 나눠줄 수 있는 페이지
      String page = null;
      if (board != null && fileList != null && ComList != null) {
         request.setAttribute("board", board);
         request.setAttribute("fileList", fileList);
         request.setAttribute("ComList", ComList);
         System.out.println(ComList);
         page = "WEB-INF/views/board/boardDetail.jsp";
      } else {
         request.setAttribute("msg", "게시글 상세조회에 실패하였습니다.");
         page = "WEB-INF/views/common/errorPage.jsp";
         
      }

      request.getRequestDispatcher(page).forward(request, response);
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