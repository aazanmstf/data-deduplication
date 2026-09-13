package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnect.Dataduplicate.DbConnection;
import com.beans.OwnerBean;

/**
 * Servlet implementation class OwnerReg
 */
@WebServlet("/OwnerReg")
public class OwnerReg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OwnerReg() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		String name = request.getParameter("name");
		String email = request.getParameter("uid");
		String age = request.getParameter("age");
		String gen = request.getParameter("gen");
		String pass = request.getParameter("pwd");
		 // validate the form data
        if(name == null || name.trim().equals("")) {
            request.setAttribute("error", "Please enter a valid name.");
          
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }
        else if(email == null || email.trim().equals("")) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }
            else if (!email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            	  o.println("<p style='color: red;'>Please enter a valid email address.</p>");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }
            else if(age == null || age.trim().equals("") || Integer.parseInt(age)<18) {
            request.setAttribute("error", "Please enter a valid age.");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }
       /* int ageInt = 0;
        try {
            ageInt = Integer.parseInt(age);
            if(ageInt < 18 || ageInt > 100) {
                throw new NumberFormatException();
            }
        } catch(NumberFormatException e) {
            request.setAttribute("error", "Please enter a valid age (between 18 and 100).");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }*/
            else if(gen == null || (!gen.equalsIgnoreCase("male") && !gen.equalsIgnoreCase("female"))) {
            request.setAttribute("error", "Please select a valid gender.");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }
            else  if(pass == null || pass.trim().equals("")) {
            request.setAttribute("error", "Please enter a valid password.");
            request.getRequestDispatcher("owner.jsp").forward(request, response);
            return;
        }else {
        	
        	String sql = "insert into owner values(?,?,?,?,?,?)";
    		System.out.println("print the above sql statmet");
    		System.out.print(sql);
    		int i = 0;
    		try {
    			i=DbConnection.setOwner(sql, name, email, age, gen, pass, 0);
    			//i = DbConnection.setOwner(sql, name,email,age,gen,pass,0);
    		} catch (ClassNotFoundException | SQLException e) {
    			// TODO Auto-generated catch block
    			e.printStackTrace();
    		}
    		if(i > 0){
    			o.println("<script type=\"text/javascript\">");
    			o.println("alert('Owner Register Successfully...');");
    			o.println("window.location='owner.jsp';</script>");
    		}else{
    			o.println("<script type=\"text/javascript\">");
    			o.println("alert('Please enter valid Details/Already Exist');");
    			o.println("window.location='owner.jsp';</script>");
    		}
        	
        }
		
	}
	
	public static Connection getConn() throws ClassNotFoundException, SQLException {
		Connection con=null;
		Class.forName("com.mysql.jdbc.Driver");
		return con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Datadeduplication-2024", "root", "root");
		
	}
	
	public static int setOwner(String sql, String name,String email,String age,String gen,String pass) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		int i = 0;
		Connection con = OwnerReg.getConn();
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, age);
			ps.setString(4, gen);
			ps.setString(5, pass);
			i = ps.executeUpdate();
			ps.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}
