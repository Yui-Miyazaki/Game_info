package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.GameBean;

public class SearchDAO {
	public List<GameBean> getGameSearch() throws ClassNotFoundException, SQLException{
		List<GameBean> searchResultList = new ArrayList<GameBean>();
		String sql = "SELECT t1.game_id,t1.game_name,t1.maker,t1.release_date,t2.stock,t2.price,t2.ranking,t2.item_code "
				+ "FROM m_game t1 JOIN t_stock t2 "
				+ "ON t1.item_code = t2.item_code;"
				+ "WHERE game_name LIKE %?% OR maker LIKE %?% OR stock LIKE %?%";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)){
			ResultSet res = pstmt.executeQuery();
			
			while (res.next()) {
				GameBean game = new GameBean();
				game.setGameName(res.getString("game_name"));
				game.setMaker(res.getString("maker"));
				game.setStock(res.getInt("stock"));
				searchResultList.add(game);
				System.out.println(searchResultList);
			}
		}
		return searchResultList;
	}
}
