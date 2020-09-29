<%-- 
    Document   : castVote
    Created on : 9 Feb, 2020, 6:06:10 PM
    Author     : NEERAJ PANDEY
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="candidate.CandidateContainer"%>
<%@page import="candidate.CandidateProvider"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%--<%@page errorPage="errorPage.jsp" %>--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>JSP Page</title>
    </head>
    <body>

            
       <%  
//           session.setAttribute("filterCastVote", "filterCastVote"); 
           
           String voter=(String)session.getAttribute("voterName");
          // String id=(String)session.getAttribute("voterIdentity");
           
           // session.setAttribute("vtr_id",id); 
          // String posId=(String)session.getAttribute("psnId");
           
           String pos=request.getParameter("pos");
           String vtrId=request.getParameter("voterId");
           session.setAttribute("currentVoterId",vtrId);
           String posId=request.getParameter("posId");
           session.setAttribute("posId",posId);
           int psnId=Integer.parseInt(posId);
           
           
           
           Connection con=ConnectionProvider.getConnection();
           
           CandidateProvider provider=new CandidateProvider();
           List<CandidateContainer> li=provider.getAllCandidates(con);
           
       %>
    
           
       <div class="container-fluid m-0 p-0">
           <div class="jumbotron bg-primary">
                            <a href="logoutServlet" class="btn btn-outline-light my-2 my-sm-0 float-right p-2" type="submit"><b>Not Now</b></a>

               <h4 class="display-4">Welcome</h4> <h4 class="text-white display-4"><%= voter %></h4> <h4 class="display-4">You are here to cast your vote for position of </h4> <h4 class="text-white display-4"><%= pos %></h4>
           </div>
       </div>
           
               
       
          
           <div class="container">
               <div class="row">
       <% 
            for(CandidateContainer cc:li)
            {
                if(cc.getPosition().equalsIgnoreCase(pos))
                {
                    %>
                    <div class="col-md-4">
                        <div class="card" style="width: 18rem;">
                            <img class="card-img-top" src="images/<%= cc.getPic() %>" alt="Card image cap">
                        <div class="card-body text-center">
                          <h5 class="card-title"><%= cc.getName() %></h5>
                          <p class="card-text"><%= cc.getAbout() %></p>
                          
                            <!--start of voted action-->
                                  <%
                                      String query="select p_name from positions where id="+psnId;
                                      String pname="";
                                      try
                                      {
                                          
                                      Statement st1=con.createStatement();
                                       ResultSet rs1=st1.executeQuery(query);
                                        
                                       while(rs1.next())
                                       {
                                          pname=rs1.getString("p_name");
                                        
                                       }  
                                       
                                             if(pname.equalsIgnoreCase(pos))
                                      {
                                          
                                     
                                        String qry="select status from voters where id="+vtrId;
                                        Statement st=con.createStatement();
                                        ResultSet rs=st.executeQuery(qry);
                                        while(rs.next())
                                        {
                                            String votedPosition=rs.getString("status");
                                            String strPosArr[]=votedPosition.split(" ");
                                            int l=strPosArr.length;
                                            int posArr[]=new int[l];
                                            int re=1;
                                            for(int i=0;i<l;i++)
                                            {
                                                posArr[i]=Integer.parseInt(strPosArr[i]);
                                            }
                                            for(int i=1;i<l;i++)
                                            {
                                                if(posArr[i]==psnId)
                                                {
                                                   re=0;
                                                }
                                            }
                                            
                                            if(re==0)
                                            {
                                                %>
                                                <div class="btn btn-danger"> Not Allowed ! </div>
                                                <%
                                            }

                                            else
                                                {
                                                    %>
                                                    <a href="VoteCounterServlet?candId=<%= cc.getId() %>" class="btn btn-primary"><b>VOTE</b></a>
                                                    <%
                                                }
                                                     }

                                        }
                                      }
                                      catch(Exception e)
                                      {
                                          
                                      }
                                
                                    %>
                                    <!--end of voted action-->
                         
                          
                        </div>
                      </div>
                    </div>
                    <%
                }
            }
       
       
       %>
               </div>
           </div>
       
     
       
       
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
<!--        <script>
            $(document).ready(function(){
                $(".hideMe").click(function(){
                    $(".jumbotron").toggle();
                })
            });
        </script>-->
    </body>
</html>
