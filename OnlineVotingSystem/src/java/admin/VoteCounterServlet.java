/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import candidate.CandidateContainer;
import candidate.CandidateProvider;
import connection.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import userinfo.VoterProvider;
import userinfo.Voters;

/**
 *
 * @author NEERAJ PANDEY
 */
public class VoteCounterServlet extends HttpServlet {

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
            out.println("<title>Servlet VoteCounterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            int cId=Integer.parseInt(request.getParameter("candId"));
            int vCount=0;
            String name="";
            
             HttpSession se=request.getSession();
             String vName=(String)se.getAttribute("voterName");
            int vId=Integer.parseInt((String)se.getAttribute("currentVoterId"));
            
            
              Connection con=ConnectionProvider.getConnection();
             
            int positionId=Integer.parseInt((String)se.getAttribute("posId"));

            String temp="";
            
//        Updating voters status

            String q1="select status from voters where id=?";
            try
            {
               PreparedStatement stm=con.prepareStatement(q1);
               stm.setInt(1,vId);
               
               ResultSet rs2=stm.executeQuery();
               
               while(rs2.next())
               {
                  String stat=rs2.getString("status");
                  stat=stat+" "+positionId;
                  temp=stat;
              
               }
               
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
           
            
             String q2="update voters set status=? where id=?";
             try
             {
                 
                PreparedStatement st2=con.prepareStatement(q2);
                    
                    st2.setString(1,temp);
                    st2.setInt(2,vId);
               
                    int s=st2.executeUpdate();
                    
                    if(s>0)
                    {
                       // out.println("stat again="+temp);
                        
                        HttpSession ssn=request.getSession();
                        ssn.setAttribute("voteCasted","voting successful");
                        ssn.setAttribute("postionVotd",temp);
                        
                        response.sendRedirect("votingPage.jsp");
                      
                        
                    } 
             }
             catch(Exception e)
             {
                 e.printStackTrace();
             }
                    
//       end of updating voters status     


//       incrementing candidate vote counter
            CandidateProvider provider=new CandidateProvider();
            CandidateContainer CanCon=provider.getCandidateById(con, cId);

               
            if(cId==CanCon.getId())
            {
                
                String q="select c_voteCount from candidates where id="+cId;
                try
                {
                    Statement st=con.createStatement();
                    ResultSet rs=st.executeQuery(q);
                    
                    while(rs.next())
                    {
                         vCount=rs.getInt("c_voteCount");
                         vCount=vCount+1;
                    }
                    
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            
            }      
               

                String query="update candidates set c_voteCount=? where id=?";

               try{
                   PreparedStatement pstmt=con.prepareStatement(query);
                   pstmt.setInt(1,vCount);
                   pstmt.setInt(2, cId);
                   
                   int j=pstmt.executeUpdate();
                   
                   if(j>0)
                   {
//                        HttpSession s=request.getSession();
//                        s.setAttribute("voted", "Congratulations !! You successfully voted for "+name);
                        //response.sendRedirect("votingPage.jsp");
                      
                       
                    
                   }

                  

               }
               catch(Exception e)
               {
                   e.printStackTrace();
               }
            
                    
//          end of incrementing  candidate vote counter     
            

         
            
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
