package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.ProductDosageBean;
import DrRAJ.DAO.ProductDosageDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

/**
 * Servlet implementation class ProductDosageInsertServlet
 */
public class ProductDosageInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productId = request.getParameter("selProductName");
		String content = request.getParameter("txtContent");

		ProductDosageBean productDosageBean = new ProductDosageBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(productId) || productId.equals("0")) {
			isError = true;
			request.setAttribute("product", "<font color=red>* Product Name is Required</font>");
		} else {
			request.setAttribute("selProductName", productId);
			productDosageBean.setProductId(productId);
		}

		if (ValidationUtils.isEmpty(content)) {
			isError = true;
			request.setAttribute("content", "<font color=red>* Content is Required</font>");
		} else {
			request.setAttribute("txtContent", content);
			productDosageBean.setContent(content);
		}

		if (isError) {
			request.getRequestDispatcher("ProductDosageInsert.jsp").forward(request, response);
		} else {
			if (new ProductDosageDAO().insert(productDosageBean)) {
				response.sendRedirect("ProductDosageListServlet");
			} else {
				request.getRequestDispatcher("ProductDosageInsert.jsp").forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
