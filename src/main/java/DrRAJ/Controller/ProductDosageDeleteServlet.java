package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ProductDosageDAO;

/**
 * Servlet implementation class ProductDosageDeleteServlet
 */
public class ProductDosageDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productDosageId = request.getParameter("productDosageId");
		if (new ProductDosageDAO().delete(productDosageId)) {
			response.sendRedirect("ProductDosageListServlet");
		} else {
			response.sendRedirect("ProductDosageListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
