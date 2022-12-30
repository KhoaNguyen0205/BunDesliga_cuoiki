package com.admin.servlet;

import java.io.IOException;
  
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;


import com.DAO.ClubDAOImpl;
import com.DB.DBConnect;
import com.entity.ClubDtls;

@WebServlet("/add_clubs")
@MultipartConfig
public class ClubAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Part part = req.getPart("logo");
			String fileName = part.getSubmittedFileName();
			String name=req.getParameter("cname");
			String w=req.getParameter("w");
			String d=req.getParameter("d");
			String l=req.getParameter("l");
			String score=req.getParameter("score");
			String conceded=req.getParameter("conceded");
			
			ClubDtls b = new ClubDtls(fileName, name,w,d,l,score,conceded);
			
			ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());

			boolean f = dao.addClubs(b);

			HttpSession session = req.getSession();
			if (f) {
				String path = getServletContext().getRealPath("") + "AllClubs";

				java.io.File file =new java.io.File(path);
				part.write(path+java.io.File.separator+fileName);
				
				session.setAttribute("succMsg", "CLUB Add Successfully");
				resp.sendRedirect("admin/add_clubs.jsp");
			} else {
				session.setAttribute("failedMsg", "Sothing wrong on Server");
				resp.sendRedirect("admin/add_clubs.jsp");
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
