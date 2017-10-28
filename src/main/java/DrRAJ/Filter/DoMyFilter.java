package DrRAJ.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import DrRAJ.Bean.ProductBean;
import DrRAJ.DAO.ProductDAO;

public class DoMyFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		int a = ((HttpServletRequest) request).getRequestURI().toString().split("/").length;
		System.out.println("Helo " + ((HttpServletRequest) request).getRequestURI().toString());
		String s[] = ((HttpServletRequest) request).getRequestURI().toString().split("/");
		if (s[1].equalsIgnoreCase("login") || s[1].equalsIgnoreCase("company-info") || s[1].equalsIgnoreCase("manufacturing-practices")
				|| s[1].equalsIgnoreCase("contract-manufacturing")
				) {
			System.out.println("HI");
			chain.doFilter(request, response);
		} else {
			if (a == 2 && !(s[1].contains(".jsp") || s[1].contains("Servlet") || s[1].contains(".html")
					|| s[1].contains(".htm") || s[1].contains("servlet"))) {
				ProductBean bean = new ProductDAO().getByURL(s[1]);
				if (bean != null) {
					request.setAttribute("bean", bean);
					String str = "/Product.jsp";
					request.getRequestDispatcher(str).forward(request, response);
				} else {
					response.getWriter().write("Error");
				}
			} else {
				chain.doFilter(request, response);
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
