package DrRAJ.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class DoMyFilter implements Filter {

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		int a = ((HttpServletRequest) request).getRequestURI().toString().split("/").length;
		String s[] = ((HttpServletRequest) request).getRequestURI().toString().split("/");
		if (a == 2 && !(s[1].contains(".jsp") || s[1].contains("Servlet") || s[1].contains(".html")
				|| s[1].contains(".htm") || s[1].contains("servlet"))) {
			System.out.println("ddddddd "+s[1]);
			String str= "/ProductDetails.jsp";
			request.getRequestDispatcher(str).forward(request, response);
			//request.getRequestDispatcher("/index.html").forward(request, response);
		} else {
			chain.doFilter(request, response);
		}
	}

	public void destroy() {
		// TODO Auto-generated method stub

	}

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}