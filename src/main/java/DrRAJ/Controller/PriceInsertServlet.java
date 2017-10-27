package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.PriceBean;
import DrRAJ.Bean.ProductIndicationBean;
import DrRAJ.Bean.RelatedProductBean;
import DrRAJ.DAO.PriceDAO;
import DrRAJ.DAO.ProductIndicationDAO;
import DrRAJ.DAO.ReletedProductDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

public class PriceInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String productId = request.getParameter("txtProductId");
		String packageSize = request.getParameter("txtPackageSize");
		String price = request.getParameter("txtPackagePrice");

		PriceBean bean = new PriceBean();

		boolean isError = false;

		if (ValidationUtils.isEmpty(productId) || productId.equals("0")) {
			isError = true;
			request.setAttribute("product", "<font color=red>* Product is Required</font>");
		} else {
			request.setAttribute("txtProductId", productId);
			bean.setProductId(productId);
		}

		if (ValidationUtils.isEmpty(packageSize)) {
			isError = true;
			request.setAttribute("packageName", "<font color=red>* Package Size is Required</font>");
		} else {
			request.setAttribute("txtPackageSize", packageSize);
			bean.setPackageSize(packageSize);
		}

		if (ValidationUtils.isEmpty(price)) {
			isError = true;
			request.setAttribute("price", "<font color=red>* Price is Required</font>");
		} else {
			request.setAttribute("txtPackagePrice", price);
			bean.setPrice(price);
		}

		if (isError) {
			request.getRequestDispatcher("PriceInsert.jsp").forward(request, response);
		} else {
			System.out.println("JI");
			bean.setPriceId(GenrateMathodsUtils.getRandomString(15));
			if (new PriceDAO().insert(bean)) {
				System.out.println("J...I");
				response.sendRedirect("PriceListServlet");
			} else {
				request.getRequestDispatcher("PriceInsert.jsp").forward(request, response);
			}

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
