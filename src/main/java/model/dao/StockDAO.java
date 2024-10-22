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
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
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

	public int updateStock(int stock, int price, int ranking,
			String itemCode) throws SQLException, ClassNotFoundException {
		String sql = "UPDATE t_stock SET stock = ?,price = ?,ranking = ? WHERE item_code = ?";
		int updateCount = 0;
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {
			pstmt.setInt(1, stock);
			pstmt.setInt(2, price);
			pstmt.setInt(3, ranking);
			pstmt.setString(4, itemCode);
			updateCount = pstmt.executeUpdate();
			System.out.println(updateCount);
		}
		return updateCount;
	}

	public int registGame(GameBean addBean) throws ClassNotFoundException, SQLException {
		int registCount = 0;
		String stockSql = "INSERT INTO t_stock VALUES(?,?,?,?)";
		String gameSql = "INSERT INTO m_game(game_name,maker,release_date,item_code) VALUES(?,?,?,?)";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement stockPstmt = con.prepareStatement(stockSql);
				PreparedStatement gamePstmt = con.prepareStatement(gameSql)) {
			try {
				con.setAutoCommit(false);
				//t_stockのインサート作業
				stockPstmt.setString(1, addBean.getItemCode());
				stockPstmt.setInt(2, addBean.getStock());
				stockPstmt.setInt(3, addBean.getPrice());
				stockPstmt.setInt(4, addBean.getRanking());
				stockPstmt.executeUpdate();

				//m_gameのインサート
				gamePstmt.setString(1, addBean.getGameName());
				gamePstmt.setString(2, addBean.getMaker());
				gamePstmt.setDate(3, addBean.getReleseDate());
				gamePstmt.setString(4, addBean.getItemCode());
				registCount = gamePstmt.executeUpdate();

				con.commit();
			} catch (SQLException e) {
				con.rollback();
				e.printStackTrace();
			}
			return registCount;
		}
	}

	public int deleteGame(String itemCode) throws SQLException, ClassNotFoundException {
		int deleteCount = 0;
		String gameSql = "DELETE FROM m_game WHERE item_code = ?";
		String stockSql = "DELETE FROM t_stock WHERE item_code = ?";
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement stockPstmt = con.prepareStatement(stockSql);
				PreparedStatement gamePstmt = con.prepareStatement(gameSql)) {
			try {
				con.setAutoCommit(false);
				gamePstmt.setString(1, itemCode);
				gamePstmt.executeUpdate();

				stockPstmt.setString(1, itemCode);
				deleteCount = stockPstmt.executeUpdate();
				System.out.println(deleteCount);
				con.commit();
			} catch (SQLException e) {
				con.rollback();
				e.printStackTrace();
			}
		}
		return deleteCount;
	}

	public List<GameBean> getGameSearch(String gameName, String maker, int stock)
			throws ClassNotFoundException, SQLException {
		List<GameBean> searchResultList = new ArrayList<GameBean>();
		String sql = "SELECT t1.game_id,t1.game_name,t1.maker,t1.release_date,t2.stock,t2.price,t2.ranking,t2.item_code "
				+ "FROM m_game t1 JOIN t_stock t2 "
				+ "ON t1.item_code = t2.item_code "
				+ "WHERE stock = ? ";
		if (!gameName.isEmpty() && !maker.isEmpty()) {
			sql += "OR game_name LIKE ? OR maker LIKE ?";

		} else if (!gameName.isEmpty()) {
			sql += "OR game_name LIKE ?";

		} else if (!maker.isEmpty()) {
			sql += "OR maker LIKE ?";
		}
		try (Connection con = ConnectionManager.getConnection();
				PreparedStatement pstmt = con.prepareStatement(sql)) {

			//pstmt.setString(1, "%" + gameName + "%");
			//pstmt.setString(2, "%" + maker + "%");
			pstmt.setInt(1, stock);
			if (!gameName.isEmpty() && !maker.isEmpty()) {
				pstmt.setString(2, "%" + gameName + "%");
				pstmt.setString(3, "%" + maker + "%");
			} else if (!gameName.isEmpty()) {
				pstmt.setString(2, "%" + gameName + "%");

			} else if (!maker.isEmpty()) {
				pstmt.setString(2, "%" + maker + "%");
			}
			ResultSet res = pstmt.executeQuery();

			while (res.next()) {
				GameBean game = new GameBean();
				game.setGameId(res.getInt("game_id"));
				game.setGameName(res.getString("game_name"));
				game.setMaker(res.getString("maker"));
				game.setReleseDate(res.getDate("release_date"));
				game.setStock(res.getInt("stock"));
				game.setPrice(res.getInt("price"));
				game.setRanking(res.getInt("ranking"));
				game.setItemCode(res.getString("item_code"));
				searchResultList.add(game);

			}

			return searchResultList;
		}
	}
}
