package DrRAJ.Controller;

import java.awt.Dialog;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.IngredientBean;
import DrRAJ.DAO.IngredientDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

public class IngredientInsertServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("txtIngredientTitle");
		String subTitle = request.getParameter("txtIngredientSubTitle");
		String description = request.getParameter("txtIngredientDescription");
		String photoLink = request.getParameter("txtIngredientPhotoLink");
		String urlLink = request.getParameter("txtIngredientURLLink");

		IngredientBean bean = new IngredientBean();
		request.setAttribute("txtIngredientSubTitle", subTitle);
		boolean isError = false;
		if (ValidationUtils.isEmpty(title)) {
			isError = true;
			request.setAttribute("ingredientTitle", " <font color='red'> * Title is Required </font>");
		} else {
			request.setAttribute("txtIngredientTitle", title);
			bean.setTitle(title);
		}

		if (ValidationUtils.isEmpty(subTitle)) {
			isError = true;
			request.setAttribute("ingredientSubTitle", " <font color='red'> * Sub Title is Required </font>");
		} else {
			request.setAttribute("txtIngredientSubTitle", subTitle);
			bean.setSubTitle(subTitle);
		}

		if (ValidationUtils.isEmpty(description)) {
			isError = true;
			request.setAttribute("ingredientDescription", " <font color='red'> * Discription is Required </font>");
		} else {
			request.setAttribute("txtIngredientDescription", description);
			bean.setDescription(description);

		}
		if (ValidationUtils.isEmpty(photoLink)) {
			isError = true;
			request.setAttribute("ingredientPhotoLink", " <font color='red'> * PhotoLink is Required </font>");
		} else {
			request.setAttribute("txtIngredientPhotoLink", photoLink);
			bean.setPhotoLink(photoLink);

		}
		if (ValidationUtils.isEmpty(urlLink)) {
			isError = true;
			request.setAttribute("ingredientURLLink", " <font color='red'> * Title is Required </font>");
		} else {
			request.setAttribute("txtIngredientURLLink", urlLink);
			bean.setUrlLink(urlLink);

		}

		if (isError) {
			request.getRequestDispatcher("IngredientInsert.jsp").forward(request, response);
		} else {
			bean.setSubTitle(subTitle);
			bean.setIngredientsId(GenrateMathodsUtils.getRandomString(15));
			if (new IngredientDAO().insert(bean)) {
				response.sendRedirect("IngredientListServlet");
				// request.getRequestDispatcher("IngredientListServlet").forward(request,
				// response);

			} else {
				request.getRequestDispatcher("IngredientInsert.jsp").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
