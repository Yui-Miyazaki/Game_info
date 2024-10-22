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

import model.dao.LoginDAO;

/**
 * Servlet implementation class LoginDeleteServlet
 */
@WebServlet("/loginDelete")
public class LoginDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url="WEB-INF/login_delete/loginUser_delete.jsp";
		String pageId = request.getParameter("pageId");
		if("userList".equals(pageId)) {
			String loginId = request.getParameter("loginId");
			String authorityName = request.getParameter("authorityName");
			HttpSession session = request.getSession();
			session.setAttribute("loginId", loginId);
			session.setAttribute("authorityName", authorityName);
		}else if("deleteCheck".equals(pageId)) {
			String loginId = request.getParameter("loginId");
			LoginDAO loginDao = new LoginDAO();
			try {
				int deleteCount = loginDao.loginUserDelete(loginId);
				if(deleteCount > 0) {
					url = "WEB-INF/login_delete/userDelete_success.jsp";
				}else {
					url = "WEB-INF/login_delete/userDelete_failure.jsp";
				}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	
	}

}
