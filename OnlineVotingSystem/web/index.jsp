

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
       
        <title>Home Page</title>
    </head>
    <body>
        <div class="container-fluid m-0 p-0">
            <div class="jumbotron bg-primary text-center text-white">
                <span><img style="border-radius: 50%" src="images/onlineVotingLogo.png"></span> <h5 class="display-3"><b>Online Voting</b></h5>
                                     
                
              
                
               
            </div>
        </div>    
           
            <main>
                <div class="container p-0">
                    <div class="row">
                        <div class="col-md-4 offset-md-4">
                            <div class="card">
                                <div class="card-header text-center">
                                    <h5>Please Login</h5>
                                    
                                </div>
                                 <form action="loginServlet" method="POST">
                                <div class="card-body">
                                           
                                                <div class="form-group">
                                                  <label for="exampleInputEmail1">Email address</label>
                                                  <input type="email" class="form-control" name="email" aria-describedby="emailHelp" placeholder="Enter email">
                                                  <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                                </div>
                                                <div class="form-group">
                                                  <label for="exampleInputPassword1">Password</label>
                                                  <input type="password" class="form-control" name="password" placeholder="Password">
                                                </div>
                                               
                                </div>
                                      <div class="card-footer text-center">
                                                     <button type="submit" class="btn btn-primary">Login</button>
                                                </div>
                                 </form>
                                
                                           
                            </div>
                        </div>
                    </div>
                </div>
            </main>
            

                 
               
        
         <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/yourcode.js"></script>

    </body>
</html>
