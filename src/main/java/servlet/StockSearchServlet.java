package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StockDAO;
import model.entity.GameBean;

/**
 * Servlet implementation class StockSearchServlet
 */
@WebServlet("/stockSearch")
public class StockSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public StockSearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/game_stock/search/search_result.jsp";
		String gameName = request.getParameter("gameName");
		String maker = request.getParameter("maker");
		String strStock = request.getParameter("stock");
		
		int stock = Integer.parseInt(strStock);
		
		
		StockDAO dao = new StockDAO();
		try {
			List<GameBean> searchResultList = dao.getGameSearch(gameName, maker, stock);
			HttpSession session = request.getSession();
			session.setAttribute("searchResultList", searchResultList);
			if (searchResultList.isEmpty()) {
				String error = "検索結果がありませんでした";
				request.setAttribute("error", error);
				
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
