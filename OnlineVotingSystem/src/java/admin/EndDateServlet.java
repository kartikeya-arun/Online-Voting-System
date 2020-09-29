/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class EndDateServlet extends HttpServlet {

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
            out.println("<title>Servlet EndDateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            String endDate=request.getParameter("endDate");
            out.println("selected end date = "+endDate);
            
            Connection con=ConnectionProvider.getConnection();
//            AdminKeyProvider provider=new AdminKeyProvider();
//            List<AdminKeyContainer> keys=provider.getAllAdminKeys(con);
//            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
            LocalDateTime now = LocalDateTime.now();  
            String date=(String)dtf.format(now);
            out.println("Current date and time of system new = "+date);
            
            out.println("<br>");
           
            
            //HttpSession session=request.getSession();
           // session.setAttribute("endingDate",endDate);
          
           String query="update adminkey set endDate=?";
           
           try{
               PreparedStatement pstmt=con.prepareStatement(query);
               pstmt.setString(1,endDate);
               int i=pstmt.executeUpdate();
               
               if(i>0)
               {
                   HttpSession session=request.getSession();
                   session.setAttribute("endDte","endDate Updated successfully");
                   response.sendRedirect("votingPage.jsp");
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
