package com.servlets;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DBConnect.Dataduplicate.DbConnection;

/**
 * Servlet implementation class FileAttacker
 */
@WebServlet("/FileAttacker")
public class FileAttacker extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileAttacker() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter o = response.getWriter();
		String fid = request.getParameter("fid");
		HttpSession session = request.getSession(false);
		String email = (String) session.getAttribute("uid");
		String sql = "select uid from upload where fid='" + fid + "'";
		String own = DbConnection.FileAttacker(sql);
		Date d = new Date();
		String da = "" + d;
		sql = "select * from keyreq where fid='" + fid + "' and userid='"
				+ email + "'";
		if (DbConnection.DataAttack(sql) == true) {
			o.println("<script type=\"text/javascript\">");
			o.println("alert(' File Has Attacked');");
			o.println("window.location='AttackerSearch.jsp';</script>");
		} else {
			com.beans.KeyReqBean kb = new com.beans.KeyReqBean();
			kb.setFid(fid);
			kb.setOwn(own);
			kb.setEmail(email);
			kb.setDa(da);
			sql = "insert into keyreq values(?,?,?,?,?)";
			int i = DbConnection.FileAttacked(sql, kb);
			if(i > 0){
				o.println("<script type=\"text/javascript\">");
				o.println("alert('FILE HAS BEEN MALICIOUS USER HAS ATTACKED');");
				o.println("window.location='AttackerSearch.jsp';</script>");
			}else{
				o.println("<script type=\"text/javascript\">");
				o.println("alert('FILE HAS BEEN MALICIOUS USER HAS  ATTACKED');");
				o.println("window.location='AttackerSearch.jsp';</script>");
			}
		}
	}
	
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
