package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.ClubDAOImpl;
import com.DB.DBConnect;
import com.entity.ClubDtls;

@WebServlet("/editClub")
public class EditClubServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			
			String w=req.getParameter("w");
			String d=req.getParameter("d");
			String l=req.getParameter("l");
			String score=req.getParameter("score");
			String conceded=req.getParameter("conceded");
			
			ClubDtls b = new ClubDtls();
			b.setId(id);
			b.setW(w);
			b.setD(d);
			b.setL(l);
			b.setScore(score);
			b.setConceded(conceded);
			
			ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());
			boolean f =dao.updateClubs(b);
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sucMsg", "");
				resp.sendRedirect("admin/all_clubs.jsp");
				
			}else
			{
				session.setAttribute("failedMsg", "");
				resp.sendRedirect("admin/all_clubs.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
