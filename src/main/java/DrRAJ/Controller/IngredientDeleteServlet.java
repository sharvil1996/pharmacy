package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.IngredientDAO;

public class IngredientDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ingredientId = request.getParameter("ingredientId");
		if (new IngredientDAO().delete(ingredientId)) {
			response.sendRedirect("IngredientListServlet");
		} else {
			response.sendRedirect("IngredientListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
