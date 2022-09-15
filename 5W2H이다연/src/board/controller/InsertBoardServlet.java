package board.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import users.model.vo.Users;


/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public InsertBoardServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
    *      response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String encoding = "UTF-8";
      String savePath = request.getSession().getServletContext().getRealPath("/") + "image_uploadFiles"; // 나중에 / 없애 볼 것
      
      File f = new File(savePath);
      if(!f.exists()) {
         f.mkdirs();
         System.out.println("파일 만들었당!");
      }
      
      DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
      fileItemFactory.setRepository(f);
      fileItemFactory.setSizeThreshold(1024 * 1024 * 10); //10 mb
      ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory);
      
      ArrayList<String> saveFiles = new ArrayList<String>();
      ArrayList<String> originFiles = new ArrayList<String>();
      ArrayList<String> openList = new ArrayList<String>();
      
      String bTitle = null;
      String bAddress = null;
      String bTel = null;
      String bMenu = null;
      String bPrice = null;
      String bComment = null;
      String openStr = "";
      String userId = ((Users)(request.getSession().getAttribute("loginUser"))).getUserId();
      
      try {
         List<FileItem> items = fileUpload.parseRequest(request);
         
         for(FileItem item : items) {
            
            if(!item.isFormField()) {
               if(item.getSize() > 0) {
                  String separator = File.separator;
                  String changeName = changeName(item.getName());
                  String originName = item.getName();
                  
                  saveFiles.add(changeName);
                  originFiles.add(originName);
                  
                  File uploadFile = new File(savePath + separator + changeName);
                  System.out.println("savePath + separator + changeName : " + savePath + separator + changeName);
                  
                  item.write(uploadFile);
               }
            }else {
               switch(item.getFieldName()) {
               case "title" : 
                  bTitle = item.getString(encoding);
                  break;
               case "open" :
                  openList.add(item.getString(encoding));
                  break;
               case "address" :
                  bAddress = item.getString(encoding);
                  break;
               case "tel" :
                  bTel = item.getString(encoding);
                  break;
               case "food" :
                  bMenu = item.getString(encoding);
                  break;
               case "price" :
                  bPrice = item.getString(encoding);
                  break;
               case "comment" : 
                  bComment = item.getString(encoding);
                  break;
               }
            }
         }
         
         if(openList.size() != 0) {
            for(int i=0;i<openList.size();i++) {
               if(i != openList.size()-1) {
                  openStr = openStr + openList.get(i) + ", ";
               }else {
                  openStr = openStr + openList.get(i);
               }
            }
         }
         System.out.println("openStr : " + openStr);
         
         Board b = new Board();
         
         b.setBoardTitle(bTitle);
         b.setBoardOpen(openStr);
         b.setBoardAddress(bAddress);
         b.setBoardTel(bTel);
         b.setBoardMenu(bMenu);
         b.setBoardPrice(bPrice);
         b.setBoardComment(bComment);
         b.setBoardWriter(userId);
         
         ArrayList<Attachment> fileList = new ArrayList<>();
         
         for(int i=0;i<originFiles.size();i++) {
            Attachment a = new Attachment();
            a.setFilePath(savePath);
            a.setOriginName(originFiles.get(i));
            a.setChangeName(saveFiles.get(i));
            
            if(i == 0) { //전송이 역순이 아니기 때문.
               a.setFileLevel(0);
            }else {
               a.setFileLevel(1);
            }
            
            fileList.add(a);
         }
         
         int result = new BoardService().insertBoard(b, fileList);
         
         if (result == fileList.size() + 1) {
            response.sendRedirect("list.bo");
         }else {
            request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
            request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
             
            /*
             * for (int i = 0; i < saveFiles.size(); i++) { File failFile = new
             * File(savePath + saveFiles.get(i)); failFile.delete(); }
             */
         }
      } catch (FileUploadException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
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
   
   private String changeName(String originName) {
      long currentTime = System.currentTimeMillis();
      int ranNum = (int)(Math.random() * 1000000);
      
      String ext = null;
      
      int dot = originName.lastIndexOf(".");
      if(dot == -1) {
         ext = "";
      }else {
         ext = originName.substring(dot);
      }
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
      String fileName = sdf.format(new Date(currentTime)) + ranNum + ext;
      
      return fileName;
   }

}