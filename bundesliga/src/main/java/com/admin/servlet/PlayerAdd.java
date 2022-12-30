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
import com.DAO.PlayerDAOImpl;
import com.DB.DBConnect;
import com.entity.PlayerDtls;

@WebServlet("/add_players")
@MultipartConfig
public class PlayerAdd extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	  try {
		  Part part = req.getPart("image");
		  String fileName =part.getSubmittedFileName();
		  String name = req.getParameter("pname");
		  String ns =req.getParameter("ns");
		  String club = req.getParameter("club");
		  String position = req.getParameter("position");
		  
		  PlayerDtls b = new PlayerDtls(fileName, name,ns,club,position);
		  
		  PlayerDAOImpl dao = new PlayerDAOImpl(DBConnect.getConn());
		  
		  boolean f =dao.addPlayers(b);
		  
		  HttpSession session = req.getSession();
		  if(f) {
			  String path =getServletContext().getRealPath("") + "AllPlayers";
			  
			  java.io.File file = new java.io.File(path);
			  part.write(path+java.io.File.separator+fileName);
			  
				session.setAttribute("succMsg", "Player Add Successfully");
				resp.sendRedirect("admin/add_players.jsp");
			} else {
				session.setAttribute("failedMsg", "Sothing wrong on Server");
				resp.sendRedirect("admin/add_players.jsp");
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	}

		
}
