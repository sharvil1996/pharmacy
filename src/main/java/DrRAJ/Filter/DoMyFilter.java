package DrRAJ.Filter;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import DrRAJ.Bean.ProductBean;
import DrRAJ.Bean.ProductCategoryBean;
import DrRAJ.Bean.RemediesBean;
import DrRAJ.DAO.ProductCategoryDAO;
import DrRAJ.DAO.ProductDAO;
import DrRAJ.DAO.RemediesDAO;

public class DoMyFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		int a = ((HttpServletRequest) request).getRequestURI().toString().split("/").length;
		String s[] = ((HttpServletRequest) request).getRequestURI().toString().split("/");

		if (a == 1) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			// System.out.println(((HttpServletRequest)
			// request).getRequestURI().toString());
			if (s[1].equalsIgnoreCase("login") || s[1].equalsIgnoreCase("company-info")
					|| s[1].equalsIgnoreCase("manufacturing-practices")
					|| s[1].equalsIgnoreCase("contract-manufacturing")) {
				chain.doFilter(request, response);
			} else {
				// System.out.println("Hello" + s[1]);
				if (a == 2 && !(s[1].contains(".jsp") || s[1].contains("Servlet") || s[1].contains(".html")
						|| s[1].contains(".htm") || s[1].contains("servlet"))) {

					RemediesBean remediesbean = new RemediesDAO().getByURL(s[1]);
					if (remediesbean != null) {
						if (remediesbean != null) {
							request.setAttribute("remediesbean", remediesbean);
							String str = "/RemediesDetails.jsp";
							request.getRequestDispatcher(str).forward(request, response);
						}
					} else {
						ArrayList<ProductBean> categoryBean = new ProductCategoryDAO().getByURL(s[1]);
						if (categoryBean != null && categoryBean.size() != 0) {
							System.out.println(categoryBean.size());
							request.setAttribute("categoryBean", categoryBean);
							String str = "/ProductCategory.jsp";
							request.getRequestDispatcher(str).forward(request, response);
						} else {
							ProductBean bean = new ProductDAO().getByURL(s[1]);
							if (bean != null) {
								request.setAttribute("bean", bean);
								String str = "/Product.jsp";
								request.getRequestDispatcher(str).forward(request, response);
							} else {
								response.getWriter().write("ERROR");

								// Book Code
							}
						}
					}
				} else {
					chain.doFilter(request, response);
				}
			}
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
