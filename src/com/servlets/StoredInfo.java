package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DBConnect.Dataduplicate.DbConnection;

@WebServlet("/StoredInfo")
public class StoredInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<!DOCTYPE html><html><head><title>Stored File Information</title>"
                + "<link href='assets/vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'></head>"
                + "<body class='container py-5'><p><a href='Attackers.jsp'>&larr; Back to monitoring</a></p>"
                + "<h1>Stored File Information</h1><p>File contents and access keys are intentionally hidden.</p>"
                + "<table class='table table-bordered'><thead><tr><th>File ID</th><th>Owner</th><th>File name</th><th>Type</th><th>Description</th></tr></thead><tbody>");
        try (Connection con = DbConnection.connect(); Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT fid, uid, fname, type, fdes FROM upload")) {
            while (rs.next()) {
                out.println("<tr><td>" + escape(rs.getString("fid")) + "</td><td>" + escape(rs.getString("uid"))
                        + "</td><td>" + escape(rs.getString("fname")) + "</td><td>" + escape(rs.getString("type"))
                        + "</td><td>" + escape(rs.getString("fdes")) + "</td></tr>");
            }
        } catch (Exception e) {
            out.println("<tr><td colspan='5'>Unable to load file records. Check the local database setup.</td></tr>");
        }
        out.println("</tbody></table></body></html>");
    }

    private String escape(String value) {
        if (value == null) return "";
        return value.replace("&", "&amp;").replace("<", "&lt;").replace(">", "&gt;").replace("\"", "&quot;");
    }
}
