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
		String gameName = request.getParameter("gameName");
		String itemCode = request.getParameter("itemCode");
		System.out.println(gameName);
		HttpSession session = request.getSession();
		session.setAttribute("gameName", gameName);
		session.setAttribute("itemCode", itemCode);
		RequestDispatcher rd = request.getRequestDispatcher("stock_delete.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url ="delete_success.jsp";
		String itemCode = request.getParameter("itemCode");
		TestDAO dao = new TestDAO();
		try {
			int deleteCount = dao.deleteGame(itemCode);
			
			if(deleteCount == 0) {
				url = "delete_failure.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}