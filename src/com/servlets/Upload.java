package com.servlets;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DBConnect.Dataduplicate.DbConnection;
import com.DBConnect.Dataduplicate.FileDuplicate;
import com.DBConnect.Dataduplicate.RandomeString;
import com.dao.Test;

import utils.OutToString;

/**
 * Servlet implementation class Upload
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet("/Upload")
public class Upload extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Upload() {
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
	Part filepart=request.getPart("file");
    	String fname=request.getParameter("fname");
    	String fdes=request.getParameter("fdes");
    	HttpSession ses=request.getSession(false);
    	String gid=(String)ses.getAttribute("uid");
    	Part filepart1=request.getPart("file");
    	//String gname=Da .getGroupName(gid);
    	OutToString out=new OutToString();
    	String content=out.readInputStream(filepart.getInputStream());
    	content.replaceAll("(\\r|\\n)", "");
    
    	try {
			List<FileDuplicate> files= DbConnection.getDataforDuplicate();
			
			for(FileDuplicate fd: files) {
				System.out.println("file content"+fd.getFileContent());
				fd.getFileContent().replaceAll("(\\r|\\n)", "");
				
				if(fname.equalsIgnoreCase(fd.getFileName())) {
					request.setAttribute("error", "File Name Is Duplicate");
					 request.getRequestDispatcher("upload.jsp").forward(request, response);
			            return;
					
				}else if(content.trim().equalsIgnoreCase(fd.getFileContent().trim())) {
					request.setAttribute("error", "File Data Content Is Duplicate");
					 request.getRequestDispatcher("upload.jsp").forward(request, response);
			            return;
				}
			}
			
			
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		InputStream inputStream, input;
		FileOutputStream filePart;
		String file=filepart1.getName();
		int fileSize = (int) filepart1.getSize();
		System.out.println(fileSize);
		int PART_SIZE = (int)fileSize/2;
		int nChunks = 0, read = 0, readLength = PART_SIZE;
		String num=RandomeString.getFid();
		byte[] byteChunkPart, byteChunkPart1;
		String key=RandomeString.getSaltString();
		try {
		Connection con=DbConnection.connect();
		Statement st=con.createStatement();
		input = filepart.getInputStream();
		String type=filepart.getContentType();
		System.out.println(num);
		int i=st.executeUpdate("insert into upload value('"+num+"','"+gid+"','"+fname+"',0,0,'"+type+"','"+fdes+"','"+key+"','"+key+"')");
		String sql ="insert into upload1(fid,uid, fname, Part, type, fdes, f1key, f2key) value(?,?,?,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, num);
		ps.setString(2, gid);
		ps.setString(3, fname);
		ps.setBinaryStream(4, input);
		ps.setString(5, type);
		ps.setString(6, fdes);
		ps.setString(7, key);
		ps.setString(8, key);
		i = ps.executeUpdate();
		System.out.println(i+" "+file);
			inputStream = filepart1.getInputStream();
			int ji=0;
			while (fileSize > 0) {
				ji++;
				if (fileSize <= 5) {
					readLength = fileSize;
				}
				try {
				byteChunkPart = new byte[readLength];
				read = inputStream.read(byteChunkPart, 0, readLength);
				fileSize -= read;
				String text = new String(byteChunkPart);
				String key1 = RandomeString.getSaltString();
				String enc = Test.encryption(text, key1);
				byteChunkPart1 = enc.getBytes();
				String tx = new String(byteChunkPart1);
				System.out.println(tx);
				PreparedStatement ps2=con.prepareStatement("update upload set part"+ji+"=?, f"+ji+"key=? where fid=?");	
				PreparedStatement ps1=con.prepareStatement("update upload1 set f"+ji+"key=? where fid=?");
				assert (read == byteChunkPart.length);
				nChunks++;
				File nf=new File("temp.txt");
				filePart = new FileOutputStream(nf);
				filePart.write(byteChunkPart1);
				ps2.setBinaryStream(1, new FileInputStream(nf), fileSize);
				ps2.setString(2, key1);
				ps2.setString(3, num);
				ps1.setString(1, key1);
				ps1.setString(2, num);
				int i2=ps2.executeUpdate();
				i2 = ps1.executeUpdate();
				filePart.flush();
				filePart.close();
				byteChunkPart = null;
				filePart = null;
				byteChunkPart1 = null;
				System.out.println(nChunks+" "+i2);
				}catch (Exception e) {
					// TODO: handle exception
					
				}
			}
			inputStream.close();
			//response.sendRedirect("upload.jsp?Uploaded_Successfully");
			PrintWriter o= response.getWriter();
			o.println("<script type=\"text/javascript\">");
			o.println("alert('Uploaded_Successfully...');");
			o.println("window.location='upload.jsp';</script>");
			System.out.println("completed");
		} catch (IOException | SQLException exception) {
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	
	}
	  // Helper Method to Check for Duplicate Files
	    private boolean isDuplicateFile(String fname, String content) throws SQLException {
	        String sql = "SELECT * FROM upload WHERE fname = ? OR part = ?";
	        try (Connection con = DbConnection.connect();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, fname);
	            ps.setString(2, content);
	            try (ResultSet rs = ps.executeQuery()) {
	                return rs.next() && rs.getInt(1) > 0;
	            }
	        }
	    }

	    // Helper Method to Process File in Chunks
	    private void processFileInChunks(Part filePart, String fileId, String fileType, String key, String content) throws SQLException, IOException {
	        int fileSize = (int) filePart.getSize();
	        InputStream inputStream = filePart.getInputStream();
	        int partSize = fileSize / 2;  // Split into two parts
	        int nChunks = 0;
	        byte[] chunk = new byte[partSize];
	        int readLength;
	        String key1;

	        while (fileSize > 0) {
	            if (fileSize <= partSize) {
	                readLength = fileSize;
	            } else {
	                readLength = partSize;
	            }
	            inputStream.read(chunk, 0, readLength);
	            fileSize -= readLength;

	            key1 = RandomeString.getSaltString();
	            String encryptedContent = Test.encryption(new String(chunk), key1);

	            try (Connection con = DbConnection.connect()) {
	                String updateSql = "UPDATE upload SET part" + (nChunks + 1) + " = ?, f" + (nChunks + 1) + "key = ? WHERE fid = ?";
	                try (PreparedStatement ps = con.prepareStatement(updateSql)) {
	                    ps.setBinaryStream(1, new ByteArrayInputStream(encryptedContent.getBytes()));
	                    ps.setString(2, key1);
	                    ps.setString(3, fileId);
	                    ps.executeUpdate();
	                }
	            }
	            nChunks++;
	        }
	    }
	
	
	
	
	
	
	
	
	}
	
	
	




		
		/* Part filePart = request.getPart("file");
	        String fname = request.getParameter("fname");
	        String fdes = request.getParameter("fdes");
	        HttpSession session = request.getSession(false);
	        String userId = (String) session.getAttribute("uid");

	        // Convert file content to string
	        OutToString out = new OutToString();
	        String content = out.readInputStream(filePart.getInputStream());
	        content = content.replaceAll("(\\r|\\n)", "");

	        try {
	        	List<FileDuplicate> files= DbConnection.getDataforDuplicate();
				
				for(FileDuplicate fd: files) {
					System.out.println("file content"+fd.getFileContent());
					fd.getFileContent().replaceAll("(\\r|\\n)", "");
					
					if(fname.equalsIgnoreCase(fd.getFileName())) {
						request.setAttribute("error", "File Name Is Duplicate");
						 request.getRequestDispatcher("upload.jsp").forward(request, response);
				            return;
						
					}else if(content.trim().equalsIgnoreCase(fd.getFileContent().trim())) {
						request.setAttribute("error", "File Data Content Is Duplicate");
						 request.getRequestDispatcher("upload.jsp").forward(request, response);
				            return;
	            // Check for duplicate files
	            if (isDuplicateFile(fname, fd.getFileContent())) {
	                request.setAttribute("error", "File Name or File Content Is Duplicate");
	                request.getRequestDispatcher("upload.jsp").forward(request, response);
	                return;
	            }

	            // Generate unique file ID and key
	            String fileId = RandomeString.getFid();
	            String key = RandomeString.getSaltString();
	            String fileType = filePart.getContentType();

	            // Insert the file into the 'upload' table
	            String insertFileSql = "INSERT INTO upload (fid, uid, fname, status, partCount, type, fdes, f1key, f2key) VALUES (?, ?, ?, 0, 0, ?, ?, ?, ?)";
	            try (Connection con = DbConnection.connect();
	                 PreparedStatement ps = con.prepareStatement(insertFileSql)) {
	                ps.setString(1, fileId);
	                ps.setString(2, userId);
	                ps.setString(3, fname);
	                ps.setString(4, fileType);
	                ps.setString(5, fdes);
	                ps.setString(6, key);
	                ps.setString(7, key);
	                ps.executeUpdate();
	            }

	            // Now process the file in chunks
	            processFileInChunks(filePart, fileId, fileType, key, content);

	            // Notify user of successful upload
	            PrintWriter outResponse = response.getWriter();
	            outResponse.println("<script type=\"text/javascript\">");
	            outResponse.println("alert('Uploaded Successfully!');");
	            outResponse.println("window.location='upload.jsp';</script>");
					}
					

					}catch (Exception e) {
						// TODO: handle exception
						
					}
				}

	    // Helper Method to Check for Duplicate Files
	    private boolean isDuplicateFile(String fname, String content) throws SQLException {
	        String sql = "SELECT COUNT(*) FROM upload WHERE fname = ? OR fileContent = ?";
	        try (Connection con = DbConnection.connect();
	             PreparedStatement ps = con.prepareStatement(sql)) {
	            ps.setString(1, fname);
	            ps.setString(2, content);
	            try (ResultSet rs = ps.executeQuery()) {
	                return rs.next() && rs.getInt(1) > 0;
	            }
	        }
	    }

	    // Helper Method to Process File in Chunks
	    private void processFileInChunks(Part filePart, String fileId, String fileType, String key, String content) throws SQLException, IOException {
	        int fileSize = (int) filePart.getSize();
	        InputStream inputStream = filePart.getInputStream();
	        int partSize = fileSize / 2;  // Split into two parts
	        int nChunks = 0;
	        byte[] chunk = new byte[partSize];
	        int readLength;
	        String key1;

	        while (fileSize > 0) {
	            if (fileSize <= partSize) {
	                readLength = fileSize;
	            } else {
	                readLength = partSize;
	            }
	            inputStream.read(chunk, 0, readLength);
	            fileSize -= readLength;

	            key1 = RandomeString.getSaltString();
	            String encryptedContent = Test.encryption(new String(chunk), key1);

	            try (Connection con = DbConnection.connect()) {
	                String updateSql = "UPDATE upload SET part" + (nChunks + 1) + " = ?, f" + (nChunks + 1) + "key = ? WHERE fid = ?";
	                try (PreparedStatement ps = con.prepareStatement(updateSql)) {
	                    ps.setBinaryStream(1, new ByteArrayInputStream(encryptedContent.getBytes()));
	                    ps.setString(2, key1);
	                    ps.setString(3, fileId);
	                    ps.executeUpdate();
	                }
	            }
	            nChunks++;
	        }
	    }
*/	