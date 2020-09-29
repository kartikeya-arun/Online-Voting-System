/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connection;

import java.sql.Connection;
import java.sql.DriverManager;


public class ConnectionProvider 
{
    static Connection con;
    
    public static Connection getConnection() 
    {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        
        con=DriverManager.getConnection("jdbc:mysql://localhost:3307/onlinevoting","root","root");
       
    }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
         return con;
    }
    
}
