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
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author NEERAJ PANDEY
 */
public class ResultToggleServlet extends HttpServlet {

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
            out.println("<title>Servlet ResultToggleServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            HttpSession session=request.getSession();
            Connection con=ConnectionProvider.getConnection();
            
         //   out.println(con);
            String rst=request.getParameter("resultT");
            
            
            if(rst.equalsIgnoreCase("public"))
            {
                String p=rst;
                String qy="update adminkey set resToggle=?";
                try{
                   out.println(p);
                    PreparedStatement stmt1=con.prepareStatement(qy);
                    stmt1.setString(1,p);
                    int i=stmt1.executeUpdate();
                    out.println(i);
                    if(i>0)
                    {
                        session.setAttribute("resPublic","Result is now public !");
                        response.sendRedirect("votingPage.jsp");
                    }
                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
                
            }
            if(rst.equalsIgnoreCase("hide"))
            {
                String h=rst;
                String q2="update adminkey set resToggle=?";
               
                try{
                    PreparedStatement stmt2=con.prepareStatement(q2);
                    stmt2.setString(1,h);
                   
                    int j=stmt2.executeUpdate();
                    
                    if(j>0)
                    {
                        session.setAttribute("resHide","Result is now hidden !");
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
