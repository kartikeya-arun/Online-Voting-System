/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candidate;

import connection.ConnectionProvider;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author NEERAJ PANDEY
 */
@MultipartConfig
public class AddCandidateServlet extends HttpServlet {

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
            out.println("<title>Servlet AddCandidateServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
             String name=request.getParameter("cName");
            String email=request.getParameter("cEmail");
            String pos=request.getParameter("cPos");
            Part img=request.getPart("cPic");
            String abt=request.getParameter("cAbout");
            
          int er=1;
            
            Connection con=ConnectionProvider.getConnection();
            
            String query="insert into candidates(c_name,c_email,c_position,c_pic,c_about)values(?,?,?,?,?)"; 
            try {
                
                CandidateProvider provider=new CandidateProvider();
                List<CandidateContainer> list=provider.getAllCandidates(con);
                
                for(CandidateContainer c: list)
                {
                    if(email.equalsIgnoreCase(c.getEmail())&&(pos.equalsIgnoreCase(c.getPosition())))
                    {
                        er=0;
                       
                    }
               
                }
                
                
                if(er==1)
                {
                   
                        PreparedStatement pstmt = con.prepareStatement(query); 
                        pstmt.setString(1,name); 
                        pstmt.setString(2,email);
                        pstmt.setString(3,pos);
                        pstmt.setString(4,img.getSubmittedFileName()); 
                        pstmt.setString(5,abt);



                        int i=pstmt.executeUpdate(); 
                        if(i>0)
                        {
                           //uploading pic to database

                            String path=request.getRealPath("/") + "pics\\" + img.getSubmittedFileName();
        //                    out.println(path);

                           FileOutputStream fos=new FileOutputStream(path);

                            InputStream ipst=img.getInputStream();

                            byte data[]=new byte[ipst.available()];

                            ipst.read(data);

                            fos.write(data);

                            fos.close();


                            HttpSession session=request.getSession();
                            session.setAttribute("success","Candidate added successfully");
                           response.sendRedirect("votingPage.jsp");

                            }  
                    }
                
                else
                {
                     HttpSession session=request.getSession();
                        session.setAttribute("error","Candidate already exist with given email ! Try with another email");
                        response.sendRedirect("votingPage.jsp");
                }
           
            }
            
            catch (Exception e) 
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
