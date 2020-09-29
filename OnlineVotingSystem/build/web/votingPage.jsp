

<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="admin.AdminKeyContainer"%>
<%@page import="admin.AdminKeyProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="userinfo.VoterProvider"%>
<%@page import="candidate.CandidateContainer"%>
<%@page import="candidate.CandidateProvider"%>
<%@page import="java.util.ArrayList"%>
<%@page import="positions.PositionContainer"%>
<%@page import="positions.PositionProvider"%>
<%@page import="java.util.List"%>
<%@page import="connection.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="userinfo.Voters"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="errorPage.jsp" %>

<META HTTP-EQUIV="Refresh" CONTENT="20">

<% Voters voter = (Voters)session.getAttribute("vote");
   
    if (voter == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="node_modules/sweetalert2/dist/sweetalert2.css" rel="stylesheet">
        <link rel="stylesheet" href="cssstyle/glow.css">
         <link rel="stylesheet" href="cssstyle/pulseButton.css">
        <title>JSP Page</title>
        
        <style>
            .hoverMe:hover{
                box-shadow:5px 5px 5px grey;
              
                
            }
            body{
                background: #333;
            }
            </style>
    </head>
    <body>
        
       
       
        <% int myTog=0;
            int doFilter=0;
            String resultFilter="dontgo";
        %>
        
        
        <%
                if((voter.getName().equals("Neeraj Pandey"))&&(voter.getEmail().equals("np5414635@gmail.com"))&&(voter.getAadhaar().equals("784509238512")))
                {
               
        %>
        
             <nav class="navbar navbar-expand-lg navbar-dark bg-primary text-white">
              <h2 class="navbar-brand display-3"><b>Admin Page</b></h2>
              <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="#"> <span class="sr-only">(current)</span></a>
                  </li>
                  
                  <!--add dropdown--> 
                  
                           <div class="dropdown m-1 p-1">
                            <button class="btn btn-success dropdown-toggle " type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              ADD
                            </button>
                            <div class="dropdown-menu bg-success" aria-labelledby="dropdownMenuButton">
                              <a class="dropdown-item" data-toggle="modal" data-target="#add-position-modal" href="#">Add Position</a>
                              <a class="dropdown-item" data-toggle="modal" data-target="#add-candidate-modal" href="#">Add Candidate</a>
                              <a class="dropdown-item" data-toggle="modal" data-target="#add-voter-modal" href="#">Add Voter</a>
                            </div>
                          </div>
                 
                  <!--end dropdown-->

                  
                 
                  <!--delete dropdown-->
                  
                  <div class="dropdown m-1 p-1">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          DELETE
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                         <a class="dropdown-item" data-toggle="modal" data-target="#deletePos" href="#">Delete Position</a>
                         <a class="dropdown-item" data-toggle="modal" data-target="#delete-candidate-modal" href="#">Delete Candidate</a>
                         <a class="dropdown-item" data-toggle="modal" data-target="#delete-voter-modal" href="#" >Delete Voter</a>
                        </div>
                      </div>
                 
                  <!--end dropdown-->
                  
                  <!--RESULT dropdown-->
                  
                  <div class="dropdown m-1 p-1">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       RESULT
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item"  href="myResult.jsp" >Results</a>
                            
                            <form action="ResultToggleServlet" method="post">
                                <input type="radio" class="m-1 p-1" name="resultT" value="public">
                                <label for="male"></label>Public Result<br>
                                <input type="radio" class="m-1 p-1" name="resultT" value="hide">
                                <label for="male"></label>Hide Result
                                <button class="btn btn-primary" type="submit"> Go </button>
                            </form>
                            
                        </div>
                      </div>
                 
                  <!--end dropdown-->
                  
                  <!--RESET dropdown-->
                  
                  <div class="dropdown m-1 p-1">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       RESET
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            
                                <a class="btn btn-outline-light p-1 m-1" style="display: none;" id="resetMe" href="ResetVoterStatusServlet"></a>
                                <button  class="btn btn-outline-light  dropdown-item"  onclick="resetFunction()">Reset voter Status</button>
                          
                                <a class="btn btn-outline-light p-1 m-1" style="display: none;" id="resetVoteCount" href="ResetVoteCounterServlet"></a>
                                <button  class="btn btn-outline-light  dropdown-item"  onclick="resetVoteCountFunction()">Reset vote Count</button>
                           
                    
                        </div> 
                      </div>
                 
                  <!--end dropdown-->
                  
                  <div class="dropdown m-1 p-1">
                        <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                       Set End Date
                        </button>
                        <div class="dropdown-menu text-center" aria-labelledby="dropdownMenuButton">
                            <form action="EndDateServlet" method="post">
                                <li class="nav-item active">
                                    <input type="date" class="btn btn-outline-light my-2 my-sm-0 dropdown-item p-2" name="endDate"  href="EndDateServlet"> 
                                </li>
                                <button class="btn btn-primary" type="submit">Save</button>
                            </form>
                        </div> 
                      </div>
                 
                  <!--end dropdown-->
                  
<!--                  <button class="btn btn-outline-light btn-success button1" onclick="myFun()">Hide VoteBtn</button>-->
                    
                    
                    
                     
                    <br>
<!--                    <li class="nav-item nav-item active">
                        <a class="btn btn-outline-light p-1 m-1"  href="ResetVoteCounter">Reset Vote Count</a>
                    </li>-->
                    
                    
                    
                </ul>

              </div>
            </nav>
        
        
        
        
        <%
            }
        %>
        
        <div class="container-fluid m-0 p-0">
            <div class=" jumbotron bg-primary">
             <a href="logoutServlet" class="btn btn-outline-light my-2 my-sm-0 float-right p-2 ntnw" style="text-shadow: 0 0 10px #fff" type="submit"><b>Not Now</b></a>
                
             
           
             
             <!--voting deadline-->
             <%  
                 String tgl="";
                Connection con1=ConnectionProvider.getConnection();
                String qy1="select * from adminkey where id=1";
               
                
                Statement stmt=con1.createStatement();
                
                ResultSet mrs=stmt.executeQuery(qy1);
                String endD="";
                while(mrs.next())
                {
                    endD=mrs.getString("endDate");
                    tgl=mrs.getString("resToggle");
                }
               
                 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
                 LocalDateTime now = LocalDateTime.now();
                 String currentDate=(String)dtf.format(now);
                   
                 
               if(endD.equalsIgnoreCase(currentDate))
                    {
                       myTog=1;
                        
                        if(!(tgl.equalsIgnoreCase("public")))
                        {
                           
                           %>
                           
                    <h2 class="text-white float-right mr-4 ml-4 draw p-2" id="ht">Voting ended !! Results will be available soon. </h2>
                    
                    <%
                    }
}
                    else
                    {
                        myTog=0;
                      %>
                    <h2 class="float-right mr-4 draw p-2">Voting ends on <%= endD %></h2>
                    <%
                    }
                   

             %>
             <!--deadline ends-->
             
             
            
             
               <!--result toggle-->
             
             <% 
                String qey="select resToggle from adminkey";
                try
                {
                    
                Statement stqry=con1.createStatement();
                ResultSet rsqry=stqry.executeQuery(qey);
                String rT="";
                while(rsqry.next())
                {
                    rT=rsqry.getString("resToggle");
                }
                
                if(rT.equalsIgnoreCase("public"))
                {
                    resultFilter="go";
                   
                    %>
                    
                    <a href="myResult.jsp" class="btn btn-outline-light my-2 my-sm-0 m-1 p-1 float-right p-2" style="text-shadow: 0 0 10px #fff" ><b>Go To Result</b></a>
                    <%
                        
                }
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }

             %>
             
             <!--result toggle ends-->
             
             
             
                <h5 class="display-4 d-flex">Welcome <img style="border-radius: 50%; height: 1.5em; width: 1.5em;" src="images/default.webp"></h5>
                <h5 class="display-4 d-flex"><%= voter.getName() %></h5>
                <%
                    String po=(String)session.getAttribute("pos");
                    
                       if(po!=null)
                       {
                     
                %>
                <div class="alert alert-success" role="alert">
                    <%= po%>
                  </div>
                
                <%
                   session.removeAttribute("pos"); 
                }%>
                
                <%
                    String vtr=(String)session.getAttribute("vmsg");
                    if(vtr!=null)
                    {
                   
                %>
                
                     
                    <div class="alert alert-success" role="alert">
                    <%= vtr %> 
                  </div>
                
                <%
                   session.removeAttribute("vmsg"); 
                }%>
                
                <%
                    String delPos=(String)session.getAttribute("delPos");
                    if(delPos!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= delPos %>
                  </div>
                <%
                    session.removeAttribute("delPos");
                }
                %>
                
                 <%
                    String delCan=(String)session.getAttribute("delCan");
                    if(delCan!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= delCan %>
                  </div>
                <%
                    session.removeAttribute("delCan");
                }
                %>
                
                
                  <%
                    String votDel=(String)session.getAttribute("VotDel");
                    if(votDel!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= delCan %>
                  </div>
                <%
                    session.removeAttribute("VotDel");
                }
                %>
                
                  <%
                    String addCan=(String)session.getAttribute("success");
                    if(addCan!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= addCan %>
                  </div>
                <%
                    session.removeAttribute("success");
                }
                %>
                
                   <%
                    String err=(String)session.getAttribute("error");
                    if(err!=null)
                    {
                %>
                     <div class="alert alert-danger" role="alert">
                    <%= err %>
                  </div>
                <%
                    session.removeAttribute("error");
                }
                %>
                
                   <%
                    String verr=(String)session.getAttribute("vError");
                    if(verr!=null)
                    {
                %>
                     <div class="alert alert-danger" role="alert">
                    <%= verr %>
                  </div>
                <%
                    session.removeAttribute("vError");
                }
                %>
                
                  <%
                    String rst=(String)session.getAttribute("reset");
                    if(rst!=null)
                    {
                %>
                     <div class="alert alert-danger" role="alert">
                    <%= rst %>
                  </div>
                <%
                    session.removeAttribute("reset");
                }
                %>
                
                  <%
                    String adharError=(String)session.getAttribute("aadhaarError");
                    if(adharError!=null)
                    {
                %>
                     <div class="alert alert-danger" role="alert">
                    <%= adharError %>
                  </div>
                <%
                    session.removeAttribute("aadhaarError");
                }
                %>
                  <%
                    String endDate=(String)session.getAttribute("endDte");
                    if(endDate!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= endDate %>
                  </div>
                <%
                    session.removeAttribute("endDte");
                }
                %>
                
                  <%
                    String vtCast=(String)session.getAttribute("voteCasted");
                    if(vtCast!=null)
                    {
                %>
                     <div class="alert alert-success" role="alert">
                    <%= vtCast %>
                  </div>
                <%
                    session.removeAttribute("voteCasted");
                }
                %>
                
                  <%
                    String resHide=(String)session.getAttribute("resHide");
                    if(resHide!=null)
                    {
                       
                %>
                     <div class="alert alert-success" role="alert">
                    <%= resHide %>
                  </div>
                <%
                    session.removeAttribute("resHide");
                }
                %>
                
                  <%
                    String resPublic=(String)session.getAttribute("resPublic");
                    if(resPublic!=null)
                    {
                       
                %>
                     <div class="alert alert-success" role="alert">
                    <%= resPublic %>
                  </div>
                <%
                    session.removeAttribute("resPublic");
                }
                %>
                
                
                
            </div>
        </div>
                
              
                <% 
                    session.setAttribute("voterName",voter.getName());
                   // session.setAttribute("voterIdentity",voter.getId());
                    // session.setAttribute("psnId",pos.getId());
                                   
                                  %>
        
                 <div class="container">
                    
                     <%
                         PositionProvider provider=new PositionProvider();
                         
                         Connection con=ConnectionProvider.getConnection();
                         
                        List<PositionContainer> list=provider.getAllPositions(con);
                    
                     %>
                     
                      <div class="row">
                     
                     <%
                         for(PositionContainer pos: list)
                         {
                       
                     %>
                    
                         <div class="col-md-4 hoverMe">
                             <div class="card mb-2" >
                                 <img class="card-img-top" src="images/defaultCandid.png" alt="Card image cap">
                                <div class="card-body text-center">
                                  <h5 class="card-title"><%= pos.getP_name()  %></h5>
                                  <p class="card-text"><%= pos.getP_desc() %></p>
                                  
                                  <!--start of voted action-->
                                  <%
                                        String qry="select status from voters where id="+voter.getId();
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
                                                if(posArr[i]==pos.getId())
                                                {
                                                   re=0;
                                                }
                                            }
                                            
                                            if(re==0)
                                            {
                                                if(myTog!=1)
                                                {
                                                %>
                                                <div class="btn btn-success myButton"> VOTED ! </div>
                                                <%
                                                }
                                            }

                                            else
                                                {
                                                    if(myTog!=1)
                                                    {
                                                    %>
                                                     <a  href="castVote.jsp?pos=<%= pos.getP_name() %>&voterId=<%= voter.getId()%>&posId=<%= pos.getId()%>" onclick="<% doFilter=1; %>" class="btn btn-primary myButton" id="<%= pos.getId()%>" >Go Vote</a>
                                                    <%
                                                      }
                                                }

                                        }
                                    %>
                                    <!--end of voted action-->
                                  
                                </div>
                              </div>
                         </div>
                     <%
                     }
                     %>
                     </div> 
                   
                 </div>
                     
                     <%
                     if(doFilter==1)
                     {
                         session.setAttribute("filterCastVote", "filterCastVote");
                     }
                     if(resultFilter.equals("dontgo"))
                     {
                         session.setAttribute("filterResult","filterResult");
                     }
                     
                     %>
                     
                     
                     <!--Start of Modals-->
                     
                      <!--adding position modal -->
                      <div class="modal animated bounceInDown" id="add-position-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Fill position details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        
                                       

                                        <form action="AddPositionServlet" method="post">

                                            <div class="form-group">
                                                <input type="text" name="posName" placeholder="Enter position name" class="form-control"> 

                                            </div>

                                            <div class="form-group">
                                                <input type="text" class="form-control" name="posDesc" placeholder="Enter poition description">

                                            </div>

                                           
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-block btn-outline-dark" >Add Position</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      
                      <!--End of position modal-->
                      
                      
                      <!--start of addding candidate modal-->
                      
                        <div class="modal animated bounceInDown" id="add-candidate-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Fill candidate details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        
                                       

                                        <form action="AddCandidateServlet" method="post" enctype="multipart/form-data">

                                            <div class="form-group">
                                                <input type="text" name="cName" placeholder="Enter candidate name" class="form-control"/> 

                                            </div>

                                                <div class="form-group">
                                                    <input type="email" name="cEmail" placeholder="Enter candidate email" class="form-control"/>

                                                </div>
                                            
                                             <div class="form-group">
                                                <input type="text" class="form-control" name="cPos" placeholder="Enter candidate position"/>

                                            </div>
                                            
                                             <div class="form-group">
                                                <input type="text" class="form-control" name="cAbout" placeholder="Enter something about candidate"/>

                                            </div>
                                    
                                             <div class="form-group">
                                                 <input type="file"  name="cPic" />
                                            </div>

                                           
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-block btn-outline-dark" >Add Candidate</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      
                      <!--end of adding candidate modal-->
                      
                      
                      <!--start of adding voter modal-->
                      
                       <div class="modal animated bounceInDown" id="add-voter-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Fill voter details</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        
                                       

                                        <form action="AddVoterServlet" method="post">

                                            <div class="form-group">
                                                <input type="text" name="voter_name" placeholder="Enter voter name" class="form-control"/> 

                                            </div>

                                                <div class="form-group">
                                                    <input type="email" class="form-control" name="voter_email" placeholder="Enter voter email">

                                                </div>
                                                <div class="form-group">
                                                    <input type="text" class="form-control" name="voter_aadhaar"  placeholder="Enter voters aadhaar no." required>

                                                </div>
                                            
                                             <div class="form-group">
                                                 <input type="password" class="form-control" name="voter_pass" placeholder="Enter voter password">

                                            </div>
                                            
                                             <div class="form-group">
                                                 <input type="text" class="form-control" name="voter_type" placeholder="Enter voter type">

                                            </div>

                                           
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-block btn-outline-dark" >Add Voter</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      
                      
                      <!--end of adding voter modal-->
                      
                      <!--start of deleting position modal-->
                      
                        <div class="modal animated bounceInDown" id="deletePos" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Check Positions to delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                 
                                        <form action="DeletePosServlet" method="post">
                                            
                                          
                                           
                                          
                                           <%
                                                for(PositionContainer pos: list)
                                                {
                                              
                                           %>
                                           <div class="form-check">
                                           <input class="form-check-input" type="checkbox" value="<%= pos.getId() %>" name="pos">
                                            <label class="form-check-label" for="defaultCheck1">
                                           
                                                <%= pos.getP_name() %>
                                                
                                                     <br>
                                                
                                            </label>
                                                  </div>
                                           <%
                                                }
                                           %>
                                         
                                             <div class="form-group text-center">
                                                <button type="submit" class="btn  btn-outline-dark" >Delete</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      
                      <!--end of deleting position modal-->
                      
                      
                      <!--start of deleting candidate modal-->
                      
                         <div class="modal animated bounceInDown" id="delete-candidate-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Check Positions to delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <%
                                        CandidateProvider canP=new CandidateProvider();
                                        
                                        List<CandidateContainer> can=canP.getAllCandidates(con);
                                        %>
                                 
                                        <form action="DeleteCanServlet" method="post">
                                            
                                          
                                           
                                          
                                           <%
                                                for(CandidateContainer candid: can)
                                                {
                                              
                                           %>
                                           <div class="form-check">
                                           <input class="form-check-input" type="checkbox" value="<%= candid.getId() %>" name="candidate">
                                            <label class="form-check-label" for="defaultCheck1">
                                           
                                                <%= candid.getName() %>
                                                
                                                     <br>
                                                
                                            </label>
                                                  </div>
                                           <%
                                                }
                                           %>
                                         
                                             <div class="form-group text-center">
                                                <button type="submit" class="btn  btn-outline-dark" >Delete</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      
                      
                      <!--end of deleting candidate modal-->
                      
                      
                      <!--start of delete voter modal-->
                      
                       <div class="modal animated bounceInDown" id="delete-voter-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header bg-primary">
                                        <h5 class="modal-title text-white" id="exampleModalLabel">Check Positions to delete</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <%
                                        VoterProvider vp=new VoterProvider();
                                        
                                        List<Voters> lst=vp.getAllVoters(con);
                                        %>
                                 
                                        <form action="DeleteVotServlet" method="post">
                                            
                                          
                                           
                                          
                                           <%
                                                for(Voters vl: lst)
                                                {
                                              
                                           %>
                                           <div class="form-check">
                                           <input class="form-check-input" type="checkbox" value="<%= vl.getId() %>" name="voters">
                                            <label class="form-check-label" for="defaultCheck1">
                                           
                                                <%= vl.getName() %>
                                                
                                                     <br>
                                                
                                            </label>
                                                  </div>
                                           <%
                                                }
                                           %>
                                         
                                             <div class="form-group text-center">
                                                <button type="submit" class="btn  btn-outline-dark" >Delete</button>
                                            </div>

                                        </form>

                                    </div>

                                </div>
                            </div>
                        </div>
                      <!--end of delete voter modal-->
                      
                     
                     <!--End of Modals-->
                     
                       <!--start of voted action-->
                
                <%  
//                    String vc=(String)session.getAttribute("voteCasted");
//                    if(vc!=null)
//                    {
//                        int vId=voter.getId();
//                        String strPos=(String)session.getAttribute("positionVotd");
//                        String strPosArr[]=strPos.split(" ");
//                        int l=strPosArr.length;
//                        int posArr[]=new int[l];
//                        for(int i=0;i<l;i++)
//                        {
//                            posArr[i]=Integer.parseInt(strPosArr[i]);
//                            
//                            if(true)
//                            {
//                                
//                            }
//                        }
//                        
//                    }

                %>
                
                
                <script>
                  
                   function resetFunction()
                   {
                      var doIt=confirm("Are you sure you want to reset user status??");
                      if(doIt)
                      {
                          $('#resetMe')[0].click();
                      }
                       
                   }
                   
                   function resetVoteCountFunction()
                   {
                       var rst=confirm("Are you sure you want to reset vote count ??");
                       if(rst)
                       {
                           $("#resetVoteCount")[0].click();
                       }
                   }
                   
                
                   
                
                </script>
        
        
<!--        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>
        <script src="node_modules/sweetalert2/dist/sweetalert2.all.min.js"></script>
        
       
    </body>
</html>
