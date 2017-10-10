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
		ProductCompositionBean productCompositionBean = new ProductCompositionBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(productId) || productId.equals("0")) {
			isError = true;
			request.setAttribute("product", "<font color=red>* Product Name is Required</font>");
		} else {
			request.setAttribute("selProductName", productId);
			productCompositionBean.setProductId(productId);
		}

		
		if (ValidationUtils.isEmpty(ingredientsId) || ingredientsId.equals("0")) {
			isError = true;
			request.setAttribute("ingredients", "<font color=red>* Ingredients Name is Required</font>");
		} else {
			request.setAttribute("selIngredientsName", productId);
			productCompositionBean.setIngredientsId(ingredientsId);
		}

		
		if (ValidationUtils.isEmpty(content)) {
			isError = true;
			request.setAttribute("content", "<font color=red>* Content is Required</font>");
		} else {
			request.setAttribute("txtContent", content);
			productCompositionBean.setCompositionContent(content);
		}

		if (isError) {
			request.getRequestDispatcher("ProductCompositionInsert.jsp").forward(request, response);
		} else {
			productCompositionBean.setProductCompositionId(GenrateMathodsUtils.getRandomString(15));
			if (new ProductCompositionDAO().insert(productCompositionBean)) {
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
