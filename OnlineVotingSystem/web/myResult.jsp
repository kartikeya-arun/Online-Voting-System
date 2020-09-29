<%-- 
    Document   : myResult
    Created on : 14 Feb, 2020, 9:59:23 AM
    Author     : NEERAJ PANDEY
--%>

<%@page import="candidate.CandidateContainer"%>
<%@page import="candidate.CandidateProvider"%>
<%@page import="positions.PositionContainer"%>
<%@page import="java.util.List"%>
<%@page import="positions.PositionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>
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
            Connection con=ConnectionProvider.getConnection();
            
            PositionProvider p=new PositionProvider();
            List<PositionContainer> li=p.getAllPositions(con);
            
            for(PositionContainer pc: li)
            {
                int totalVotes=0;
                
                %>
                       <h4>For Position of <%= pc.getP_name() %></h4>
                       <h4>Votes scored are as below by each candidate</h4>
                <%
               CandidateProvider cp=new CandidateProvider();
               List<CandidateContainer> lcc=cp.getAllCandidates(con);
               
               for(CandidateContainer cc: lcc)
               {
                   if(pc.getP_name().equalsIgnoreCase(cc.getPosition()))
                   {
                       totalVotes=totalVotes+cc.getVoteCount();
                       %>
                       
                       <h4><%= cc.getName() %> got <b><%= cc.getVoteCount() %></b> votes</h4>
                       <%
                   }
                 
               }
               for(CandidateContainer cc: lcc)
                {
                    if(pc.getP_name().equalsIgnoreCase(cc.getPosition()))
                   {

                       float percentage=(float)((float)cc.getVoteCount()/(float)totalVotes)*100;
                       

                   %>
                       <h4><%= cc.getName() %> got <b><%= percentage %>% </b> votes</h4>
                    <%
                   }
                    
                }
               %>
               <hr>
               <%
                   
            }
            
        %>
       
        
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
    </body>
</html>
