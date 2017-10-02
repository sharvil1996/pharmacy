package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.ProductCategoryBean;
import DrRAJ.DAO.ProductCategoryDAO;
import DrRAJ.Utils.ValidationUtils;

public class ProductCategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String productCategoryName = request.getParameter("txtProductCategoryName");
		String productCategoryId = request.getParameter("productCategoryId");
		ProductCategoryBean productCategoryBean = new ProductCategoryBean();

		boolean isError = false;
		System.out.println(productCategoryName + " ProductCategoryName");
		if (ValidationUtils.isEmpty(productCategoryName)) {
			isError = true;
			request.setAttribute("productCategoryName", "<font color=red>* ProductCategory Name is Required</font>");
		} else if (new ProductCategoryDAO().isProductCategoryExists(productCategoryName)) {
			isError = true;
			request.setAttribute("productCategoryName", "<font color=red>* ProductCategory Name is Already Exists</font>");
		} else {
			request.setAttribute("txtProductCategoryName", productCategoryName);
			productCategoryBean.setProductCategoryName(productCategoryName);
		}

		if (isError) {
			productCategoryBean.setProductCategoryName(productCategoryName);
			request.setAttribute("productCategoryBean", productCategoryBean);
			request.getRequestDispatcher("ProductCategoryEdit.jsp").forward(request, response);
		} else {
			productCategoryBean.setProductCategoryId(productCategoryId);
			if (new ProductCategoryDAO().update(productCategoryBean)) {
				response.sendRedirect("ProductCategoryListServlet");
			} else {
				response.sendRedirect("ProductCategoryListServlet");
			}

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
