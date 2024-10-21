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

import org.apache.commons.lang.StringEscapeUtils;

import model.dao.EmployeeDAO;
import model.entity.EmployeeBean;
import model.entity.PostBean;

/**
 * Servlet implementation class EmployeeUpdateServlet
 */
@WebServlet("/employeeUpdate")
public class EmployeeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EmployeeUpdateServlet() {
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
		try {
			int employeeId = Integer.parseInt(strEmployeeId);
			EmployeeBean employee = dao.getEmployeeInfo(employeeId);
			List<PostBean> postList = dao.getPostList();
			HttpSession session = request.getSession();
			if (employee != null) {
				session.setAttribute("employee", employee);
			}
			session.setAttribute("employeeId", employeeId);
			session.setAttribute("postList", postList);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/employee/update/employee_update.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/employee/update/employeeUpdate_failure.jsp";
		HttpSession session = request.getSession();
		int employeeId = (int) session.getAttribute("employeeId");
		String name = StringEscapeUtils.escapeHtml(request.getParameter("name"));
		String strAge = request.getParameter("age");
		String postCode = request.getParameter("postCode");
		EmployeeDAO dao = new EmployeeDAO();
		try {
			int age = Integer.parseInt(strAge);
			int updateCount = dao.employeeUpdate(name, age, postCode, employeeId);
			if (updateCount > 0) {
				url = "WEB-INF/employee/update/employeeUpdate_success.jsp";
			}
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
