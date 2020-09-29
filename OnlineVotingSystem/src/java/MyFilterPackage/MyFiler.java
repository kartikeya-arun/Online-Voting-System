package MyFilterPackage;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userinfo.Voters;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NEERAJ PANDEY
 */
public class MyFiler implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session=req.getSession();
        Voters vote=(Voters)session.getAttribute("vote");
        
        if(vote!=null)
        {
            chain.doFilter(request, response);
        }
        else{
            HttpServletResponse httpResponse = (HttpServletResponse) response;
            httpResponse.sendRedirect("index.jsp");
        }
        
      
      
      

    }

    @Override
    public void destroy() {
    }
    
}
