package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session  =request.getSession();
	List<GameBean> stockList = (List<GameBean>)session.getAttribute("stockList");
 	List<GameBean> searchResultList = new ArrayList<GameBean>();
	String gameName = request.getParameter("gameName");
	String maker = request.getParameter("maker");
	String strStock = request.getParameter("stock");
	try {
		int stock = Integer.parseInt(strStock);
		for(GameBean game : stockList) {
			if(!"".equals(gameName) || !"".equals(maker)) {
			if(game.getGameName().contains(gameName) || game.getMaker().contains(maker) || game.getStock() == stock){
				searchResultList.add(game);
			}
			}
		}System.out.println(searchResultList.size());
//		for(GameBean searchReesult : searchResultList) {
//		System.out.println(searchReesult.getGameName() + " " + searchReesult.getMaker() + " " + searchReesult.getStock());
//		}
	}catch (NumberFormatException e) {
		e.printStackTrace();
	}
	}

}
