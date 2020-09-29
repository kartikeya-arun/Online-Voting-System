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
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NEERAJ PANDEY
 */
public class loginServlet extends HttpServlet {

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
            out.println("<title>Servlet loginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String email=request.getParameter("email");
            String pass=request.getParameter("password");
            out.println("1");
            
            try{
                
                Connection con=ConnectionProvider.getConnection();
                
                 String query="select * from voters where email=? and password=? ";
                
                PreparedStatement pstmt=con.prepareStatement(query);
                
                pstmt.setString(1,email);
                pstmt.setString(2,pass);
                
               ResultSet rs=pstmt.executeQuery();
                
               if(rs.next())
               {
                  
                   String v_name=rs.getString("name");
                   String v_email=rs.getString("email");
                   int v_id=rs.getInt("id");
                   String v_type=rs.getString("user_type");
                   String v_pass=rs.getString("password");
                   String v_status=rs.getString("status");
                   String v_adhar=rs.getString("aadhaar");
                   
                   Voters voter=new Voters(v_name,v_email,v_pass,v_id,v_type,v_status,v_adhar);
                
                   HttpSession session=request.getSession();
                   session.setAttribute("vote",voter);
                   
                   response.sendRedirect("votingPage.jsp");
                          
                           
               }
               else
               {
                   HttpSession session=request.getSession();
                   session.setAttribute("isValid","invalid user");
                   response.sendRedirect("index.jsp");
               }

                
            }
            catch(Exception e)
            {
                e.printStackTrace();
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
