package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.ProductCompositionBean;
import DrRAJ.DAO.ProductCompositionDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

/**
 * Servlet implementation class ProductCompositionInsertServlet
 */
public class ProductCompositionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productId = request.getParameter("selProductName");
		String content = request.getParameter("txtContent");
		String ingredientsId = request.getParameter("selIngredientsName");
		
		String contents[] = request.getParameter("contentArr").split("=");
		String ingredientsArr[] = request.getParameter("ingredientsArr").split("=");
		
		ProductCompositionBean productCompositionBean = new ProductCompositionBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(productId) || productId.equals("0")) {
			isError = true;
			request.setAttribute("product", "<font color=red>* Product Name is Required</font>");
		} else {
			request.setAttribute("selProductName", productId);
			productCompositionBean.setProductId(productId);
		}

		if (isError) {
			request.getRequestDispatcher("ProductCompositionInsert.jsp").forward(request, response);
		} else {
			if (new ProductCompositionDAO().insert(productCompositionBean,contents,ingredientsArr)) {
				response.sendRedirect("ProductCompositionListServlet");
			} else {
				request.getRequestDispatcher("ProductCompositionInsert.jsp").forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
