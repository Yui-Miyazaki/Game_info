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

import model.dao.EmployeeDAO;
import model.entity.EmployeeBean;

/**
 * Servlet implementation class EmployeeDeleteServlet
 */
@WebServlet("/employeeDelete")
public class EmployeeDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String strEmployeeId = request.getParameter("employeeId");//更新時キャスト必要
		EmployeeDAO dao = new EmployeeDAO();
		int employeeId = Integer.parseInt(strEmployeeId);
		try {
			EmployeeBean employee = dao.getEmployeeInfo(employeeId);
			HttpSession session = request.getSession();
			if (employee != null) {
				session.setAttribute("employee", employee);
			}
			session.setAttribute("employeeId", employeeId);
		} catch (ClassNotFoundException | SQLException e) {
		}
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/employee/delete/employee-delete.jsp");
		rd.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/employee/delete/delete_failure.jsp";
		HttpSession session = request.getSession();
		int employeeId = (int) session.getAttribute("employeeId");
		EmployeeDAO dao = new EmployeeDAO();
		try {
			int deleteCount = dao.employeeDelete(employeeId);
			if (deleteCount > 0) {
				url = "WEB-INF/employee/delete/delete_succses.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
