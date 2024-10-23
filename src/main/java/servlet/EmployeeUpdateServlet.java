package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.text.StringEscapeUtils;

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
		String url = "WEB-INF/employee/update/employee_update.jsp";
		//チェックボックスから配列で取得
		String[] strEmployeeIds = request.getParameterValues("employeeId");//更新時キャスト必要
		HttpSession session = request.getSession();
		List<EmployeeBean> updateEmployeeList = new ArrayList<EmployeeBean>();
		EmployeeDAO dao = new EmployeeDAO();
		try {
			if (strEmployeeIds != null && strEmployeeIds.length > 0) {
				//更新する従業員情報をループで取得
				for (String strEmployeeId : strEmployeeIds) {
					int employeeId = Integer.parseInt(strEmployeeId);
					EmployeeBean employee = dao.getEmployeeInfo(employeeId);
					updateEmployeeList.add(employee);
				}
				session.setAttribute("updateEmployeeList", updateEmployeeList);
				List<PostBean> postList = dao.getPostList();
				session.setAttribute("postList", postList);
			} else {
				String errorMessage = "チェックを入れてください。";
				request.setAttribute("errorMessage", errorMessage);
				url = "WEB-INF/employee/list/employee_list.jsp";
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String url = "WEB-INF/employee/update/employee_update.jsp";
		HttpSession session = request.getSession();
		String[] nameList = request.getParameterValues("name");
		int employeeId = (int) session.getAttribute("employeeId");
		String name = StringEscapeUtils.escapeHtml4(request.getParameter("name"));
		String strAge = request.getParameter("age");
		String postCode = request.getParameter("postCode");
		String errorMessage = null;
		EmployeeDAO dao = new EmployeeDAO();
		try {
			int age = Integer.parseInt(strAge);
			if (name.isEmpty()) {
				errorMessage = "文字を入力してください。";
			} else if (name.length() > 32) {
				errorMessage = "1文字以上32文字以内で入力してください。";
				//正常処理
			} else {
				int updateCount = dao.employeeUpdate(name, age, postCode, employeeId);
				if (updateCount > 0) {
					url = "WEB-INF/employee/update/employeeUpdate_success.jsp";
				} else {
					url = "WEB-INF/employee/update/employeeUpdate_failure.jsp";
				}
			}
			request.setAttribute("errorMessage", errorMessage);
		} catch (ClassNotFoundException | SQLException | NumberFormatException e) {
			e.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
