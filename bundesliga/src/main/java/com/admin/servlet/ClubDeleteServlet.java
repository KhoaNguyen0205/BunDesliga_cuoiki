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

@WebServlet("/delete")
public class ClubDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			int id =Integer.parseInt(req.getParameter("id"));
			ClubDAOImpl dao = new ClubDAOImpl(DBConnect.getConn());
			
			boolean f =dao.deleteClub(id);
			
			HttpSession session = req.getSession();
			
			if(f) {
				session.setAttribute("sucMsg", "");
				resp.sendRedirect("admin/all_clubs.jsp");
			}else {
				session.setAttribute("failedMsg", "");
				resp.sendRedirect("admin/all_clubs.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}


