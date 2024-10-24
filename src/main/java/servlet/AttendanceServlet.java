package servlet;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.dao.EmployeeDAO;
import model.entity.LoginUserBean;

/**
 * Servlet implementation class AttendanceServlet
 */
@WebServlet("/attendance")
public class AttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginId");
		EmployeeDAO employeeDao = new EmployeeDAO();
		try {
			LoginUserBean loginUser = employeeDao.getLoginEnployeeName(loginId);
			if(loginUser != null) {
				session.setAttribute("loginUser", loginUser);
			}else {
				String errorMessage = "従業員名が見つかりませんでした。";
				session.setAttribute("errorMessage", errorMessage);
			}
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/employee/attendance/attendance_input.jsp");
		rd.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String attedanceBtn = request.getParameter("attedanceBtn");
		String strEmployeeId = request.getParameter("employeeId");
		LocalDate localDate = LocalDate.now();
		Date currentDate = Date.valueOf(localDate);//workingDayに登録
	}

}
