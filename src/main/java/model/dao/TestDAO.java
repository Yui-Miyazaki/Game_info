package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import model.entity.GameBean;

public class TestDAO {
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
				System.out.println(registCount);
				//m_gameのインサート
				gamePstmt.setString(1, addBean.getGameName());
				gamePstmt.setString(2, addBean.getMaker());
				gamePstmt.setDate(3, addBean.getReleseDate());
				gamePstmt.setString(4, addBean.getItemCode());
				registCount = gamePstmt.executeUpdate();
				System.out.println(registCount);
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

}
