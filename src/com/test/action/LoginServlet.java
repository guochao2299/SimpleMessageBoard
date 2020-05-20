package com.test.action;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.test.bean.User;
import com.test.bean.OperateJDBC;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		ServletContext application = this.getServletContext();
		OperateJDBC userBuffer=(OperateJDBC)application.getAttribute("users");
		if(userBuffer==null)
		{
			userBuffer=new OperateJDBC();
			application.setAttribute("users", userBuffer);
		}
		
		User user=new User();
		user.setName(request.getParameter("name"));
		user.setPassword(request.getParameter("password"));
			
		if(userBuffer.ValidateUser(user))
		{
			application.setAttribute("currentUser", user);
			request.getRequestDispatcher("messageboard.jsp").forward(request,response);
		}
		else
		{
			response.sendRedirect("error.jsp");
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
