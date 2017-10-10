package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ProductCompositionDAO;

/**
 * Servlet implementation class ProductCompositionDeleteServlet
 */
public class ProductCompositionDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productCompositionId = request.getParameter("productCompositionId");
		if (new ProductCompositionDAO().delete(productCompositionId)) {
			response.sendRedirect("ProductCompositionListServlet");
		} else {
			response.sendRedirect("ProductCompositionListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
