package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.FAQBean;
import DrRAJ.Bean.IngredientBean;
import DrRAJ.DAO.FAQDAO;
import DrRAJ.DAO.IngredientDAO;

public class FAQEditServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String faqId = request.getParameter("faqId");
		FAQBean bean = new FAQDAO().getByPK(faqId);
		if (bean != null) {
			request.setAttribute("faqBean", bean);
			request.getRequestDispatcher("FAQEdit.jsp").forward(request, response);
		} else {
			response.sendRedirect("FAQListServlet");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
