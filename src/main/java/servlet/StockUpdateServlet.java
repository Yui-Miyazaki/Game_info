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

import model.dao.TestDAO;

/**
 * Servlet implementation class StockUpdateServlet
 */
@WebServlet("/stockUpdate")
public class StockUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String gameName = request.getParameter("gameName");
		String itemCode = request.getParameter("itemCode");
		System.out.println(gameName);
		HttpSession session = request.getSession();
		session.setAttribute("gameName", gameName);
		session.setAttribute("itemCode", itemCode);
		RequestDispatcher rd = request.getRequestDispatcher("stock_update.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "update_failure.jsp";
		String strStock = request.getParameter("stock");
		String strPrice = request.getParameter("price");
		String strRanking = request.getParameter("ranking");
		String itemCode = request.getParameter("itemCode");
		
		int stock = Integer.parseInt(strStock);
		int ranking = Integer.parseInt(strRanking);
		
		TestDAO dao = new TestDAO();
		try {
			int price = Integer.parseInt(strPrice);
			int updateCount = dao.updateStock(stock,price,ranking,itemCode);
			System.out.println(updateCount);
			if(updateCount >= 1) {
				url = "update_success.jsp";
			}
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {

			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}


}