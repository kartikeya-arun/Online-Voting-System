/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NEERAJ PANDEY
 */
public class VoterProvider 
{
    public List<Voters> getAllVoters(Connection con)
    {
        List<Voters> list=new ArrayList<>();
        
        String query="select * from voters";
       
        try{
            Statement stmt=con.createStatement();
           ResultSet rs= stmt.executeQuery(query);
           
           while(rs.next())
           {
               int id=rs.getInt("id");
               String name=rs.getString("name");
               String email=rs.getString("email");
               String password=rs.getString("password");
               String user_type=rs.getString("user_type");
               String status=rs.getString("status");
               String adhar=rs.getString("aadhaar");
               
               Voters voter=new Voters(name,email,password,id,user_type,status,adhar);
               
               list.add(voter);
               
               
           }

        }
        catch(Exception e)
        {
            e.printStackTrace();
        }           
        
        return list;
    }
    
    public Voters getVoterById(Connection con,int id)
    {
        List<Voters> li=new ArrayList<>();
        int vid=id;
        
        String q="select * from voters where id=?";
        
        try{
            PreparedStatement pstmt=con.prepareStatement(q);
            pstmt.setInt(1,vid);
            
            ResultSet rs=pstmt.executeQuery();
            
            while(rs.next())
            {
               int v_id=rs.getInt("id");
               String name=rs.getString("name");
               String email=rs.getString("email");
               String password=rs.getString("password");
               String user_type=rs.getString("user_type");
               String status=rs.getString("status");
               String adhar=rs.getString("aadhaar");
               
               Voters voter=new Voters(name,email,password,id,user_type,status,adhar);
               
               li.add(voter);
               
                
            }
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return li.get(0);
        
    }
}
