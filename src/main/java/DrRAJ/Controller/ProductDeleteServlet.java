package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ProductDAO;

/**
 * Servlet implementation class ProductDeleteServlet
 */
public class ProductDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productId = request.getParameter("productId");
		if (new ProductDAO().delete(productId)) {
			response.sendRedirect("ProductListServlet");
		} else {
			response.sendRedirect("ProductListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
