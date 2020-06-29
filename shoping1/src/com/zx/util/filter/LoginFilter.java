package com.zx.util.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.zx.bean.User;
import com.zx.util.ConstantUtil;

/**
 * 登录过滤器
 */
@WebFilter("*.do")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		//从session中获取用户信息
		User user = (User)((HttpServletRequest)request).getSession().getAttribute(ConstantUtil.SESSION_USER);
        if(user == null) {
        	request.setAttribute("mess", "尚未登录，请登录后再进行相关操作！");
        	request.getRequestDispatcher("/WEB-INF/view/front/login.jsp").forward(request, response);
        }else {
        	// 放行
    		chain.doFilter(request, response);
        }
		
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
