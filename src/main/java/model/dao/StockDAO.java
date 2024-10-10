package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.entity.GameBean;

public class StockDAO {
	public List<GameBean> getStockList() throws SQLException, ClassNotFoundException {
		List<GameBean> stockList = new ArrayList<GameBean>();
		String sql = "SELECT t1.game_id,t1.game_name,t1.maker,t1.release_date,t2.stock,t2.price,t2.ranking,t2.item_code "
				   + "FROM m_game t1 JOIN t_stock t2 "
				   + "ON t1.item_code = t2.item_code;";
		try(Connection con = ConnectionManager.getConnection();
			PreparedStatement pstmt = con.prepareStatement(sql)){
			ResultSet res = pstmt.executeQuery();
			
			while(res.next()) {
				GameBean game = new GameBean();
				game.setGameId(res.getInt("game_id"));
				game.setGameName(res.getString("game_name"));
				game.setMaker(res.getString("maker"));
				game.setReleseDate(res.getDate("release_date"));
				game.setStock(res.getInt("stock"));
				game.setPrice(res.getInt("price"));
				game.setRanking(res.getInt("ranking"));
				game.setItemCode(res.getString("item_code"));
				stockList.add(game);
			}
			return stockList;
		}
	}
}
