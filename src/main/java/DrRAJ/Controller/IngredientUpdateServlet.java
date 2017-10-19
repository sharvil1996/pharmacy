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

public class IngredientUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String title = request.getParameter("txtIngredientTitle");
		String subTitle = request.getParameter("txtIngredientSubTitle");
		String description = request.getParameter("txtIngredientDescription");
		String photoLink = request.getParameter("txtIngredientPhotoLink");
		String ingredientId = request.getParameter("ingredientId");

		IngredientBean bean = new IngredientBean();
		// bean.setIngredientsId(ingredientId);
		// bean.setSubTitle(subTitle);

		boolean isError = false;
		if (ValidationUtils.isEmpty(title)) {
			isError = true;
			request.setAttribute("ingredientTitle", "<font color='red'> * Title is Required </font>");
		} else {
			request.setAttribute("txtIngredientTitle", title);
			bean.setTitle(title);

		}

		if (ValidationUtils.isEmpty(description)) {
			isError = true;
			request.setAttribute("ingredientDescription", "<font color='red'> * Discription is Required </font>");
		} else {
			request.setAttribute("txtIngredientDescription", description);
			bean.setDescription(description);

		}
		if (ValidationUtils.isEmpty(photoLink)) {
			isError = true;
			request.setAttribute("ingredientPhotoLink", "<font color='red'> * PhotoLink is Required </font>");
		} else {
			request.setAttribute("txtIngredientPhotoLink", photoLink);
			bean.setPhotoLink(photoLink);

		}

		if (isError) {
			bean.setSubTitle(subTitle);
			bean.setTitle(title);
			bean.setPhotoLink(photoLink);
			bean.setDescription(description);
			bean.setIngredientsId(ingredientId);
			request.setAttribute("ingreadientBean", bean);
			System.out.println("Sss0");
			request.getRequestDispatcher("IngredientEdit.jsp").forward(request, response);
		} else {
			bean.setIngredientsId(ingredientId);
			bean.setSubTitle(subTitle);
			if (new IngredientDAO().update(bean)) {
				response.sendRedirect("IngredientListServlet");
			} else {
				request.getRequestDispatcher("IngredientListServlet").forward(request, response);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
