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

import model.dao.EmployeeDAO;
import model.entity.PostBean;

/**
 * Servlet implementation class EmployeeAddServlet
 */
@WebServlet("/employeeAdd")
public class EmployeeAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeAddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        EmployeeDAO dao = new EmployeeDAO();

        try {
            List<PostBean> postList = dao.getPostList();
            HttpSession session = request.getSession();
            session.setAttribute("postList", postList);
        } catch (ClassNotFoundException | SQLException e) {

            e.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/add_employee/employee_add.jsp");
        rd.forward(request, response);

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String url = "WEB-INF/add_employee/employeeAdd_failure.jsp";
        String name = request.getParameter("name");
        String strAge = request.getParameter("age");
        String postCode = request.getParameter("postCode");
        System.out.println(name + strAge + postCode);
        EmployeeDAO dao = new EmployeeDAO();

        int age = Integer.parseInt(strAge);
        try {
            int addEmployeeCount = dao.addEmployee(name, age, postCode);
            if (addEmployeeCount > 0) {
                url = "WEB-INF/add_employee/employeeAdd_success.jsp";
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher rd = request.getRequestDispatcher(url);
        rd.forward(request, response);

    }

}
