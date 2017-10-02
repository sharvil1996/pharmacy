package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ProductCategoryDAO;

/**
 * Servlet implementation class ProductCategoryDeleteServlet
 */
public class ProductCategoryDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productCategoryId = request.getParameter("productCategoryId");

		if (new ProductCategoryDAO().delete(productCategoryId)) {
			response.sendRedirect("ProductCategoryListServlet");
		} else {
			response.sendRedirect("ProductCategoryListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
