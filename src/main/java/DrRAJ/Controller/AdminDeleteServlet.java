package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.AdminDAO;
import DrRAJ.DAO.FAQDAO;

public class AdminDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String adminId = request.getParameter("adminId");
		if (new AdminDAO().delete(adminId)) {
			response.sendRedirect("AdminListServlet");
		} else {
			response.sendRedirect("AdminListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
