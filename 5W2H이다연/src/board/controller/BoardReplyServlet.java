package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Comment;

/**
 * Servlet implementation class BoardReplyServlet
 */
@WebServlet("/insertComment.bo")
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = request.getParameter("writer");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		
		Comment c = new Comment();
		c.setBoardId(bId);
		c.setCommentWriter(writer);
		c.setCommentContent(content);
		
		ArrayList<Comment> list = new BoardService().insertComment(c);
		new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
