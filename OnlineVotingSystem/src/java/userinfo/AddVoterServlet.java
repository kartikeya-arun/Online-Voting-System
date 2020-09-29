/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinfo;

import connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NEERAJ PANDEY
 */
public class AddVoterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddVoterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String name=request.getParameter("voter_name");
            String email=request.getParameter("voter_email");
            String pass=request.getParameter("voter_pass");
            String v_type=request.getParameter("voter_type");
            String v_aadhaar=request.getParameter("voter_aadhaar");
            
            int test=0;
            
            try
            {
               long adh=Long.parseLong(v_aadhaar); 
               test=1;
               
            }
            catch(Exception e)
            {
              test=0;
            }
            
            if(test==1)
            {
               if(v_aadhaar.length()!=12)
                {
                    test=0;
                    HttpSession session=request.getSession();
                    session.setAttribute("aadhaarError","Invalid Aadhaar number");
                    response.sendRedirect("votingPage.jsp"); 
                } 
            }
            else
            {
              HttpSession session=request.getSession();
              session.setAttribute("aadhaarError","Invalid Aadhaar number");
              response.sendRedirect("votingPage.jsp");  
            }
           
            if(test==1)
            {
           
            int er=1;
            
            Connection con=ConnectionProvider.getConnection();
            
            String query="insert into voters(name,email,password,user_type,aadhaar) values(?,?,?,?,?)";
            
            try{
                
                VoterProvider provider=new VoterProvider();
                List<Voters> list=provider.getAllVoters(con);
                
                for(Voters v: list)
                {
                    if(v_aadhaar.equalsIgnoreCase(v.getAadhaar()))
                    {
                        er=0;
                       
                    }
                    
                   
                }
                
                if(er==1)
                {
                    PreparedStatement pstmt=con.prepareStatement(query);
                        pstmt.setString(1,name);
                        pstmt.setString(2,email);
                        pstmt.setString(3, pass);
                        pstmt.setString(4, v_type);
                        pstmt.setString(5,v_aadhaar);

                       int i= pstmt.executeUpdate();

                       if(i>0)
                       {
                           HttpSession session=request.getSession();
                           session.setAttribute("vmsg","Voter added successfully");
                          
                           response.sendRedirect("votingPage.jsp");
                       }  
                      
                }
                else{
                     HttpSession session=request.getSession();
                        session.setAttribute("vError","Voter already exist with given Aadhaar ! Try with another");
                        response.sendRedirect("votingPage.jsp");
                    
                }
               
               
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
