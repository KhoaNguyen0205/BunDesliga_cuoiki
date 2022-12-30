package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.PlayerDtls;

public class PlayerDAOImpl implements PlayerDAO{
 
	private Connection conn;

	public PlayerDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addPlayers(PlayerDtls b) {
		boolean f=false;
		try {
			String sql="INSERT INTO player_dtls(image,name,ns,club,position) values(?,?,?,?,?)";
			PreparedStatement ps =conn.prepareStatement(sql);
			
			ps.setString(1, b.getImage());
			ps.setString(2, b.getName());
			ps.setString(3, b.getNs());
			ps.setString(4, b.getClub());
			ps.setString(5, b.getPositon());
			
			int i =ps.executeUpdate();
			
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<PlayerDtls> getAllPlayers() {
	
	List<PlayerDtls> list = new ArrayList<PlayerDtls>();
	  
	  PlayerDtls b =null;
	  
	  try {
		  String sql ="select * from player_dtls";
		  PreparedStatement ps = conn.prepareStatement(sql);
		  ResultSet rs = ps.executeQuery();
		  while(rs.next()) {
			  b = new PlayerDtls();
			  b.setId(rs.getInt(1));
			  b.setImage(rs.getString(2));
			  b.setName(rs.getString(3));
			  b.setNs(rs.getString(4));
			  b.setClub(rs.getString(5));
			  b.setPositon(rs.getString(6));
			  list.add(b);
		  }
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	  return list;
	}

	@Override
	public List<PlayerDtls> getPlayerBySearch(String ch) {
		
		List<PlayerDtls> list = new ArrayList<PlayerDtls>();
		PlayerDtls b = null;
		
		try {
			String sql = "select * from player_dtls where club like ?" ;
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				b = new PlayerDtls();
				b.setId(rs.getInt(1));
				b.setImage(rs.getString(2));
				b.setName(rs.getString(3));
				b.setNs(rs.getString(4));
				b.setClub(rs.getString(5));
				b.setPositon(rs.getString(6));
				list.add(b);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean updatePlayer(PlayerDtls b) {
		boolean f = false;
		try {
			String sql = "update player_dtls set name=? , ns=?, club=? where pId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ps.setString(1, b.getName());
			ps.setString(2, b.getNs());
			ps.setString(3, b.getClub());
			ps.setInt(4, b.getId());
			
			int i = ps.executeUpdate();
			if(i==1) {
				f= true;
			}
		} catch (Exception e) {
			e.printStackTrace();		
		}
		return f;
	}

	@Override
	public PlayerDtls getPlayerById(int id) {
		PlayerDtls b = null; 
		
		try {
			String sql="select * from player_dtls where pId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				b = new PlayerDtls();
				b.setId(rs.getInt(1));
				b.setImage(rs.getString(2));
				b.setName(rs.getString(3));
				b.setNs(rs.getString(4));
				b.setClub(rs.getString(5));
				b.setPositon(rs.getString(6));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}

	@Override
	public boolean deletePlayer(int id) {
		boolean f=false;
		
		try {
			String sql ="delete from player_dtls where pId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
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
