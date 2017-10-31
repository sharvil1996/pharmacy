package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.DAO.ReviewDAO;

public class AJAXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mName = request.getParameter("method");
		String output = "";

		if (mName.equals("reviewUpdate"))
			output = new ReviewDAO().makeItValid(request.getParameter("reviewId"), request.getParameter("value"));

		response.setContentType("text");
		response.getWriter().write(output);

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

	public static void main(String[] args) {
		System.out.println(new ReviewDAO().makeItValid("w2yniynyIibNTbN", "1"));
	}

}
