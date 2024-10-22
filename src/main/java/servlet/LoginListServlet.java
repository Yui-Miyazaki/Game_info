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

import model.dao.LoginDAO;
import model.entity.LoginBean;

/**
 * Servlet implementation class LoginListServlet
 */
@WebServlet("/loginUserList")
public class LoginListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		LoginDAO loginDao = new LoginDAO();
		try {
			List<LoginBean> loginUserList = loginDao.getLoginUserList();
			HttpSession session = request.getSession();
			session.setAttribute("loginUserList", loginUserList);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/loginUser_list/loginUser_list.jsp");
		rd.forward(request, response);
	}
}
