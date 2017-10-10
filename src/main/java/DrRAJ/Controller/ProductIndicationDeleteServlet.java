package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ProductDAO;
import DrRAJ.DAO.ProductIndicationDAO;

/**
 * Servlet implementation class ProductDeleteServlet
 */
public class ProductIndicationDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productIndicationId = request.getParameter("productIndicationId");
		if (new ProductIndicationDAO().delete(productIndicationId)) {
			response.sendRedirect("ProductIndicationListServlet");
		} else {
			response.sendRedirect("ProductIndicationListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
