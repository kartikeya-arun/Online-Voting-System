package MyFilterPackage;
        
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author NEERAJ PANDEY
 */
public class FilterCastVote implements Filter{

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
    
         HttpServletRequest req=(HttpServletRequest)request;
        HttpSession session=req.getSession();
      String filterCast=(String)session.getAttribute("filterCastVote");
      
        if(filterCast!=null)
        {
            chain.doFilter(request, response);
        }
        else{
             HttpServletResponse httpResponse = (HttpServletResponse) response;
          httpResponse.sendRedirect("votingPage.jsp");  
        }
        
    
    
    }

    @Override
    public void destroy() {
    }
    
}
