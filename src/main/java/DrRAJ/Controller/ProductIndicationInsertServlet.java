package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.ProductIndicationBean;
import DrRAJ.Bean.RelatedProductBean;
import DrRAJ.DAO.ProductIndicationDAO;
import DrRAJ.DAO.ReletedProductDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

public class ProductIndicationInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productId = request.getParameter("txtProductId");
		String productIndication = request.getParameter("txtProductIndication");

		ProductIndicationBean bean = new ProductIndicationBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(productId) || productId.equals("0")) {
			isError = true;
			request.setAttribute("product", "<font color=red>* Product is Required</font>");
		} else {
			request.setAttribute("txtProductId", productId);
			bean.setProductId(productId);
		}

		if (ValidationUtils.isEmpty(productIndication)) {
			isError = true;
			request.setAttribute("indication", "<font color=red>* Product Indication is Required</font>");
		} else {
			request.setAttribute("txtProductIndication", productIndication);
			bean.setIndication(productIndication);
		}

		if (isError) {
			request.getRequestDispatcher("ProductIndicationInsert.jsp").forward(request, response);
		} else {

			bean.setProductIndicationId(GenrateMathodsUtils.getRandomString(15));
			if (new ProductIndicationDAO().insert(bean)) {
				response.sendRedirect("ProductIndicationListServlet");
			} else {
				request.getRequestDispatcher("ProductIndicationInsert.jsp").forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
