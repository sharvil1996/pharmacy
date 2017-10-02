package DrRAJ.Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.FAQBean;
import DrRAJ.Bean.IngredientBean;
import DrRAJ.DAO.FAQDAO;
import DrRAJ.DAO.IngredientDAO;

public class FAQListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ArrayList<FAQBean> list = new FAQDAO().select();
		if (list != null) {
			request.setAttribute("faqList", list);
			request.getRequestDispatcher("FAQList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
