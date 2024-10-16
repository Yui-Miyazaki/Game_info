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
import model.utirity.HashSolt;

/**
 * Servlet implementation class HashServlet
 */
@WebServlet("/hash")
public class HashServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HashServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/login_regist/loginRegist_succses.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/login_regist/loginRegist_succses.jsp";
		
		String loginId = request.getParameter("id");
		String password = request.getParameter("pass");
		System.out.println(password);
		
		HashSolt hashSalt = new HashSolt();
		String salt = hashSalt.getSalt(); 
		String hashPass = hashSalt.getHashPass(salt, password);
		System.out.println(salt);
		System.out.println(hashPass);
		
		HashDAO dao = new HashDAO();
		try {
			int registHashCount = dao.registHash(loginId, password, salt, hashPass);
			if(registHashCount < 1) {
				url = "WEB-INF/login_regist/login_register.jsp";
				String errorMessage = "登録に失敗しました。";
				request.setAttribute("errorMessage", errorMessage);
			}else {
				request.setAttribute("loginId",loginId );
			}
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
