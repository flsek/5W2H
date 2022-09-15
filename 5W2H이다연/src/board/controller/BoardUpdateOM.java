package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class BoardUpdateOM
 */
@WebServlet("/boardupdate.om")
public class BoardUpdateOM extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateOM() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String bTitle = request.getParameter("title");
		String[] ArrbOpen = request.getParameterValues("open");
		String bAddress = request.getParameter("address");
		String bTel = request.getParameter("tel");
		String bMenu = request.getParameter("food");
		String bPrice = request.getParameter("price");
		String bComment = request.getParameter("comment");
		String open = "";
		
		if(ArrbOpen != null) {
			for(int i = 0; i < ArrbOpen.length; i++) {
				if(i == ArrbOpen.length -1) {
					open += ArrbOpen[i];
				} else {
					open += ArrbOpen[i] + ", ";
				} 
			}
		}
		
		Board b = new Board();
		b.setBoardTitle(bTitle);
		b.setBoardOpen(open);
		b.setBoardAddress(bAddress);
		b.setBoardTel(bTel);
		b.setBoardMenu(bMenu);
		b.setBoardPrice(bPrice);
		b.setBoardComment(bComment);
		
		request.setAttribute("b", b);
		request.getRequestDispatcher("WEB-INF/views/board/boardUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
