package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PlayerDAOImpl;
import com.DB.DBConnect;
import com.entity.PlayerDtls;

@WebServlet("/editPlayer")
public class EditPlayerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id = Integer.parseInt("id");

			String name = req.getParameter("name");
			String ns = req.getParameter("ns");
			String club = req.getParameter("club");
			
			PlayerDtls b = new PlayerDtls();
			b.setId(id);
			b.setName(name);
			b.setNs(ns);
			b.setClub(club);
			
			PlayerDAOImpl dao = new PlayerDAOImpl(DBConnect.getConn());
			boolean f = dao.updatePlayer(b);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sucMsg", "");
				resp.sendRedirect("admin/all_players.jsp");
				
			}else
			{
				session.setAttribute("failedMsg", "");
				resp.sendRedirect("admin/all_players.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
