package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import model.dao.StockDAO;
import model.entity.GameBean;

/**
 * Servlet implementation class AjaxServlet
 */
@WebServlet("/ajax")
public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 // Ajaxで渡されたテキストボックスの値を変数に格納
        String gameName = request.getParameter("gameName");
        String maker = request.getParameter("maker");
		String strStock = request.getParameter("stock");
		int stock = Integer.parseInt(strStock);
		StockDAO dao = new StockDAO();
		try {
			List<GameBean> searchResultList = dao.getGameSearch(gameName, maker, stock);
			response.setContentType("application/json");         
			response.setCharacterEncoding("UTF-8");
			 ObjectMapper mapper = new ObjectMapper();
			    String json = mapper.writeValueAsString(searchResultList);
			    response.getWriter().write(json);
			    System.out.println(json);
			if (searchResultList.isEmpty()) {
				String error = "検索結果がありませんでした";
				request.setAttribute("error", error);
				
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
		}

    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
