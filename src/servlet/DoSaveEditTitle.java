package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Title;
import bean.TitleDao;
import bean.TitleDaoImpl;


public class DoSaveEditTitle extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DoSaveEditTitle() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		//获取表单传来的图书编辑信息
		String isbn=request.getParameter("isbn");//ISBN
		String title=request.getParameter("title");//书名
		String copyright=request.getParameter("copyright");//版权
		String imageFile=request.getParameter("imageFile");//封面图像文件
		int editionNumber=Integer.parseInt(request.getParameter("editionNumber"));//版本号
		int pulisherId=Integer.parseInt(request.getParameter("pulisherId"));
		float price=Float.parseFloat(request.getParameter("price"));//价格
		//将数据添加进封装类中
		Title titlebean=new Title();
		titlebean.setIsbn(isbn);
		titlebean.setCopyright(copyright);
		titlebean.setEditonNumber(editionNumber);
		titlebean.setImageFile(imageFile);
		titlebean.setPrice(price);
		titlebean.setPublisherId(pulisherId);
		titlebean.setTitle(title);
		//调用数据库操作类执行更新操作
		TitleDao titleDao=new TitleDaoImpl();
		int n=titleDao.update(titlebean);
		if(n>0)
		  response.sendRedirect("../JSP/listBook.jsp");
		else
		   response.sendRedirect("../JSP/error.jsp"); 		
	}

}
