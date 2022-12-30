package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import com.entity.ClubDtls;
import com.mysql.cj.xdevapi.Result;

public class ClubDAOImpl implements ClubDAO{

	private Connection conn;
	
	
	public ClubDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	@Override
	public boolean addClubs(ClubDtls b) {
	  boolean f=false;
		try {
			String sql = "INSERT INTO club_dtls(logo,name) values(?,?) ";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, b.getLogo());
			ps.setString(2, b.getName());
			
			int i = ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	
	
     @Override	
     public List<ClubDtls> getAllClubs() {
 		List<ClubDtls> list = new ArrayList<ClubDtls>();
 		ClubDtls b = null;
 		
 		try {
			String sql= "select *from club_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				b = new ClubDtls();
				b.setId(rs.getInt(1));
				b.setLogo(rs.getString(2));
				b.setName(rs.getString(3));
				list.add(b);
			}
 			
 			
		} catch (Exception e) {
			e.printStackTrace();
		}
 		return list;
     }
     
 	


	@Override
	public ClubDtls getClubById(int id) {
		ClubDtls b = null;
			
 		try {
		String sql ="select * from club_dtls where id=?";
		PreparedStatement ps = conn.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
				b = new ClubDtls();
				b.setId(rs.getInt(1));
				b.setLogo(rs.getString(2));
				b.setName(rs.getString(3));
				b.setW(rs.getString(4));
				b.setD(rs.getString(5));
				b.setL(rs.getString(6));
				b.setScore(rs.getString(7));
				b.setConceded(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
 			
       return b;
	}


	@Override
	public boolean updateClubs(ClubDtls b) {
		boolean f=false;
		try {
			String sql= "update club_dtls set w=?, d=?, l=?, score=?, conceded=?, matches=w+d+l, p=w+w+w+d , nuof=score-conceded where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getW());
			ps.setString(2, b.getD());
			ps.setString(3, b.getL());
			ps.setString(4, b.getScore());
			ps.setString(5, b.getConceded());
			ps.setInt(6, b.getId());
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	@Override
	public List<ClubDtls> getTable() {
		List<ClubDtls> list= new ArrayList<ClubDtls>();
		
		ClubDtls b = null;
		
		try {
			String sql ="select * from club_dtls order by p desc, nuof desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				b=new ClubDtls();
				b.setId(rs.getInt(1));
				b.setLogo(rs.getString(2));
				b.setName(rs.getString(3));
				b.setW(rs.getString(4));
				b.setD(rs.getString(5));
				b.setL(rs.getString(6));
				b.setScore(rs.getString(7));
				b.setConceded(rs.getString(8));
				b.setMatches(rs.getString(9));
				b.setP(rs.getInt(10));
				b.setNuof(rs.getString(11));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public boolean deleteClub(int id) {
		boolean f =false;
		
		try {
			String sql = "delete from club_dtls where id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	

}
