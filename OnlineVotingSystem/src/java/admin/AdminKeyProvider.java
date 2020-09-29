/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NEERAJ PANDEY
 */
public class AdminKeyProvider 
{
    public List<AdminKeyContainer> getAllAdminKeys(Connection con)
    {
        List<AdminKeyContainer> li=new ArrayList<>();
        
        String query="select * from adminkey";
        try
        {
         Statement stmt=con.createStatement();
         ResultSet rs=stmt.executeQuery(query);
         while(rs.next())
         {
             int id=rs.getInt("id");
             int resToggle=rs.getInt("resToggle");
             
             String endDate=rs.getString("endDate");
             
             AdminKeyContainer ak=new AdminKeyContainer(id,resToggle,endDate);
             li.add(ak);
         }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return li;
    }
}
