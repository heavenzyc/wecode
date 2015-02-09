package com.wecode.modules.wbp.common.config.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by zkdu on 2015/1/19.
 */
public class LoginFilter implements Filter {

    private ServletContext ctx = null;
    private FilterConfig config;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String requestUrl = request.getRequestURI();
        System.out.println(requestUrl);
        if (requestUrl.endsWith("/login") || requestUrl.endsWith("/") || requestUrl.endsWith("/index")) {
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (requestUrl.endsWith("/logout")){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (requestUrl.contains("assets")){
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }
        if (null == request.getSession().getAttribute("operator")){
            response.sendRedirect("/index");
            return;
        }else {
            filterChain.doFilter(servletRequest,servletResponse);
        }
    }

    @Override
    public void destroy() {

    }

    public static boolean isContains(String container, String[] regx) {
        boolean result = false;

        for (int i = 0; i < regx.length; i++) {
            if (container.indexOf(regx[i]) != -1) {
                return true;
            }
        }
        return result;
    }
}
