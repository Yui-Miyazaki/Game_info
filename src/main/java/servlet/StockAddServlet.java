package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.StockDAO;
import model.entity.GameBean;

/**
 * Servlet implementation class StockAddServlet
 */
@WebServlet("/stockAdd")
public class StockAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockAddServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/game_stock/add/stock_add.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String url = "WEB-INF/add/add_failure.jsp";

		String gameName = request.getParameter("gameName");
		String maker = request.getParameter("maker");
		String strDate = request.getParameter("releaseDate");
		String strStock = request.getParameter("stock");
		String strPrice = request.getParameter("price");
		String strRanking = request.getParameter("ranking");
		String itemCode = request.getParameter("itemCode");
		

		StockDAO dao = new StockDAO();
		try {
			//String型から変換
			Date releaseDate = Date.valueOf(strDate);
			int stock = Integer.parseInt(strStock);
			int price = Integer.parseInt(strPrice);
			int ranking = Integer.parseInt(strRanking);

			//GameBean型のbeen変数にパラメータを格納
			GameBean bean = new GameBean();
			bean.setGameName(gameName);
			bean.setMaker(maker);
			bean.setReleseDate(releaseDate);
			bean.setStock(stock);
			bean.setPrice(price);
			bean.setRanking(ranking);
			bean.setItemCode(itemCode);
			int registCount = dao.registGame(bean);
			

			if (registCount > 0) {
				url = "WEB-INF/add/add_success.jsp";
			}
		} catch (IllegalArgumentException | ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
