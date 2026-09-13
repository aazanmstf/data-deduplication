package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ProxyserverLogin
 */
@WebServlet("/ProxyserverLogin")
public class ProxyserverLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProxyserverLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 private static final String USERNAME = "proxyserver";
	    private static final String PASSWORD = "proxyserver";
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        // Validate username and password
	        if (username.equals(USERNAME) && password.equals(PASSWORD)) {
	            // Create a new session
	            HttpSession session = request.getSession(true);
	            session.setAttribute("username", username);

	            // Redirect to the protected page
	            response.sendRedirect("ProxyserverHome.jsp");
	        } else {
	            // Display error message
	            request.setAttribute("error", "Invalid username or password");
	            request.getRequestDispatcher("ProxyserverLogin.jsp").forward(request, response);
	        }
	    }

	    @SuppressWarnings("unused")
		private boolean isValidUsernameAndPassword(String username, String password) {
	        // TO DO: Implement your own authentication logic here
	        // For demonstration purposes, we'll just return true
	        return true;
	
		
		
	}

}
