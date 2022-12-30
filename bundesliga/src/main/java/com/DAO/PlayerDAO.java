package com.DAO;

import java.util.List;

import com.entity.PlayerDtls;

public interface PlayerDAO {
	public boolean addPlayers (PlayerDtls b);
	
	public List<PlayerDtls> getAllPlayers();
	
	public List<PlayerDtls> getPlayerBySearch (String ch);
	
	public boolean updatePlayer (PlayerDtls b);
	
	public PlayerDtls getPlayerById(int id);
	
	public boolean deletePlayer (int id);

}
