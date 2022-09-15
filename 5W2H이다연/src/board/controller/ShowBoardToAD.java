package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class ShowBoardToAD
 */
@WebServlet("/board.page")
public class ShowBoardToAD extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowBoardToAD() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService service = new BoardService();
	      
	      int listCount;		//게시물 총 개수
		  int currentPage;	//현재 페이지 표시
		  int pageLimit;		//한 페이지에 표시될 페이징 수
		  int BoardLimit;		//한 페이지에 보일 게시글 최대 개수
		  int maxPage;		//전체 페이지 중 가장 마지막 페이지
		  int startPage;		//페이징 된 페이지 중 시작 페이지
		  int endPage;		//페이징 된 페이지 중 마지막 페이지
		  listCount = service.getListCountByAD();
		  currentPage = 1;
		  if(request.getParameter("currentPage") != null) {
			  currentPage = Integer.parseInt(request.getParameter("currentPage"));
		  }
		   
		  pageLimit = 10;
		  BoardLimit = 10;
		   
		  maxPage = (int)((double)listCount/BoardLimit + 0.9);
		  System.out.println("maxPage : " + maxPage);

		  startPage = (currentPage-1) / pageLimit * pageLimit  + 1;
		   
		  endPage = startPage + pageLimit - 1;
		  if(maxPage <  endPage) {
			  endPage = maxPage;
		  }
		   
		  PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, BoardLimit, maxPage, startPage, endPage);
		  
		  ArrayList<Board> boardList = service.selectBoardList(pi);
		  System.out.println("back의 boardList : " + boardList);
		  
		  String page = null;
		  if(boardList != null) {
			  request.setAttribute("pi", pi);
			  request.setAttribute("boardList", boardList);
			  page = "WEB-INF/views/admin/boardAdmin.jsp";
		  }else {
			  request.setAttribute("msg", "게시판 조회에 실패했습니다.");
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
