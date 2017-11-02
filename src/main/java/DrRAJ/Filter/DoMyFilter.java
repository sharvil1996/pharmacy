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
import DrRAJ.Bean.RemediesBean;
import DrRAJ.DAO.ProductCategoryDAO;
import DrRAJ.DAO.ProductDAO;
import DrRAJ.DAO.RemediesDAO;

public class DoMyFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		int a = ((HttpServletRequest) request).getRequestURI().toString().split("/").length;
		String s[] = ((HttpServletRequest) request).getRequestURI().toString().split("/");

		if (a == 2) {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else {
			// System.out.println(((HttpServletRequest)
			// request).getRequestURI().toString());
			if (s[2].equalsIgnoreCase("login") || s[2].equalsIgnoreCase("company-info")
					|| s[2].equalsIgnoreCase("manufacturing-practices")
					|| s[2].equalsIgnoreCase("contract-manufacturing") || s[2].equalsIgnoreCase("dr-raj-products")
					|| s[2].equalsIgnoreCase("find-a-store-or-practitioner")
					|| s[2].equalsIgnoreCase("faq")
					|| s[2].equalsIgnoreCase("know-your-medicine")
					|| s[2].equalsIgnoreCase("remedies")
			) {
				chain.doFilter(request, response);
			} else {
				// System.out.println("Hello" + s[2]);
				if (a == 3 && !(s[2].contains(".jsp") || s[2].contains("Servlet") || s[2].contains(".html")
						|| s[2].contains(".htm") || s[2].contains("servlet"))) {

					RemediesBean remediesbean = new RemediesDAO().getByURL(s[2]);
					if (remediesbean != null) {
						if (remediesbean != null) {
							request.setAttribute("remediesbean", remediesbean);
							String str = "/RemediesDetails.jsp";
							request.getRequestDispatcher(str).forward(request, response);
						}
					} else {
						ArrayList<ProductBean> categoryBean = new ProductCategoryDAO().getByURL(s[2]);
						if (categoryBean != null && categoryBean.size() != 0) {
							System.out.println(categoryBean.size());
							request.setAttribute("categoryBean", categoryBean);
							String str = "/ProductCategory.jsp";
							request.getRequestDispatcher(str).forward(request, response);
						} else {
							ProductBean bean = new ProductDAO().getByURL(s[2]);
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
