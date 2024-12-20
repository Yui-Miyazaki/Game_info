

package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.StockDAO;

/**
 * Servlet implementation class StockDeleteServlet
 */
@WebServlet("/stockDelete")
public class StockDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/game_stock/delete/stock_delete.jsp";
		String check = request.getParameter("check");
		if(check != null) {
		String[] updateParts = check.split(",");
		String gameName = updateParts[0];
		String itemCode = updateParts[1];
		HttpSession session = request.getSession();
		session.setAttribute("gameName", gameName);
		session.setAttribute("itemCode", itemCode);
		}else {
			url ="WEB-INF/game_stock/list/stock_list.jsp";
			String errorMessage = "チェックを入れてください。";
			request.setAttribute("errorMessage", errorMessage);
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url ="WEB-INF/game_stock/delete/delete_success.jsp";
		String itemCode = request.getParameter("itemCode");
		StockDAO dao = new StockDAO();
		try {
			System.out.println(itemCode);
			int deleteCount = dao.deleteGame(itemCode);
			
			if(deleteCount == 0) {
				url = "WEB-INF/game_stock/delete/delete_failure.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
