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

import model.dao.TestDAO;
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
		RequestDispatcher rd = request.getRequestDispatcher("stock_add.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String url = "add_success.jsp";

		String gameName = request.getParameter("itemName");
		String maker = request.getParameter("maker");
		String strDate = request.getParameter("releaseDate");
		String strStock = request.getParameter("stock");
		String strPrice = request.getParameter("price");
		String strRanking = request.getParameter("ranking");
		String itemCode = request.getParameter("itemCode");
		//String型から変換
		Date releaseDate = Date.valueOf(strDate);
		int stock = Integer.parseInt(strStock);
		int price = Integer.parseInt(strPrice);
		int ranking = Integer.parseInt(strRanking);

		//GameBean型のbeen変数にパラメータを格納
		GameBean been = new GameBean();
		been.setGameName(gameName);
		been.setMaker(maker);
		been.setReleseDate(releaseDate);
		been.setStock(stock);
		been.setPrice(price);
		been.setRanking(ranking);
		been.setItemCode(itemCode);

		TestDAO dao = new TestDAO();
		try {
			int registCount = dao.registGame(been);
			System.out.println(registCount);

			if (registCount == 0) {
				url = "add_failure.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);

	}

}
