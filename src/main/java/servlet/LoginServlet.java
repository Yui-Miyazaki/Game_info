package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.dao.HashDAO;
import model.dao.LoginDAO;
import model.utirity.HashSolt;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/menu/menu.jsp";
		String loginId = request.getParameter("loginId");
		String password = request.getParameter("password");
		
		HashDAO dao = new HashDAO();
		try {
			String salt = dao.getSalt(loginId);
			if(salt != null) {
				
				HashSolt hashSalt = new HashSolt();
				String hashPass = hashSalt.getHashPass(salt, password);
				
				LoginDAO loginDao = new LoginDAO();
				int loginCheckCount = loginDao.loginCheck(loginId, hashPass);
				System.out.println(loginCheckCount);
				
				if(loginCheckCount < 1) {
					url = "login.jsp";
					String errorMessage = "ログイン認証に失敗しました。";
					request.setAttribute("errorMessage", errorMessage);
				}
				
			}else {
				url ="login.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
