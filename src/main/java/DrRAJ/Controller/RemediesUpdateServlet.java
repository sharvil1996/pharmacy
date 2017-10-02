package DrRAJ.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DrRAJ.Bean.RemediesBean;
import DrRAJ.Bean.TestimonialBean;
import DrRAJ.DAO.RemediesDAO;
import DrRAJ.DAO.TestimonialDAO;
import DrRAJ.Utils.GenrateMathodsUtils;
import DrRAJ.Utils.ValidationUtils;

public class RemediesUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("txtRemediesName");
		String photoLink = request.getParameter("txtPhotoLink");
		String remediesId = request.getParameter("remediesId");

		RemediesBean remediesBean = new RemediesBean();

		System.out.println(name + " " + photoLink + " " + remediesId);
		remediesBean.setRemediesId(remediesId);
		boolean isError = false;

		if (ValidationUtils.isEmpty(name)) {
			isError = true;
			request.setAttribute("name", "<font color=red>* Name is Required</font>");
		} else {
			request.setAttribute("txtRemediesName", name);
			remediesBean.setName(name);
		}

		if (ValidationUtils.isEmpty(photoLink)) {
			isError = true;
			request.setAttribute("photoLink", "<font color=red>* Photo Link is Required</font>");
		} else {
			request.setAttribute("txtPhotoLink", photoLink);
			remediesBean.setPhotolink(photoLink);
		}

		if (isError) {
			request.setAttribute("remediesBean", remediesBean);
			request.getRequestDispatcher("RemediesEdit.jsp").forward(request, response);
		} else {
			if (new RemediesDAO().update(remediesBean)) {
				response.sendRedirect("RemediesListServlet");
			} else {
				request.getRequestDispatcher("RemediesEdit.jsp").forward(request, response);
			}

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
