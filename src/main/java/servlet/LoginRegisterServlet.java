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
import model.entity.AuthorityBean;
import model.utirity.HashSolt;

/**
 * Servlet implementation class LoginRegisterServlet
 */
@WebServlet("/loginRegister")
public class LoginRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginRegisterServlet() {
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
			List<AuthorityBean> authorityList = loginDao.getAuthorityList();
			HttpSession session = request.getSession();
			session.setAttribute("authorityList", authorityList);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/login_regist/login_register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/login_regist/login_register.jsp";
		
		String loginId = request.getParameter("id");
		String password = request.getParameter("pass");
		String authority = request.getParameter("authority");
		System.out.println(authority);
		
		HashSolt hashSalt = new HashSolt();
		String salt = hashSalt.getSalt(); 
		String hashPass = hashSalt.getHashPass(salt, password);
		System.out.println(salt);
		System.out.println(hashPass);
		
		LoginDAO loginDao = new LoginDAO();
		try {
			int registHashCount = loginDao.registLoginUser(loginId,salt,hashPass,authority);
			if(registHashCount > 0) {
				System.out.println(registHashCount);
				url = "WEB-INF/login_regist/loginRegist_succses.jsp";
				request.setAttribute("loginId",loginId );
			}
		} catch (ClassNotFoundException | SQLException e) {
			String errorMessage = "登録に失敗しました。";
			request.setAttribute("errorMessage", errorMessage);
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}
	}


