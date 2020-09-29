/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candidate;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NEERAJ PANDEY
 */
public class CandidateProvider
{
  public List<CandidateContainer> getAllCandidates(Connection con)
  {
      List<CandidateContainer> list=new ArrayList<>();
      
      String query="select * from candidates order by id desc";
      
      try
      {
       Statement stmt=con.createStatement();
       ResultSet rs=stmt.executeQuery(query);
          
          while(rs.next())
          {
              int id=rs.getInt("id");
              String name=rs.getString("c_name");
              String email=rs.getString("c_email");
              String position=rs.getString("c_position");
              String pic=rs.getString("c_pic"); 
              String abt=rs.getString("c_about");
              int voteCount=rs.getInt("c_voteCount");
              
              CandidateContainer candidate=new CandidateContainer(id,name,email,position,pic,abt,voteCount);
              
              list.add(candidate);
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return list;
  }
  
  public CandidateContainer getCandidateById(Connection con,int id)
  {
    List<CandidateContainer> li=new ArrayList<>();
    int cId=id;
    
     String query="select * from candidates order by id desc";
      
      try
      {
       Statement stmt=con.createStatement();
       ResultSet rs=stmt.executeQuery(query);
          
          while(rs.next())
          {
              int c_id=rs.getInt("id");
              String name=rs.getString("c_name");
              String email=rs.getString("c_email");
              String position=rs.getString("c_position");
              String pic=rs.getString("c_pic"); 
              String abt=rs.getString("c_about");
              int voteCount=rs.getInt("c_voteCount");
              
              CandidateContainer candidate=new CandidateContainer(id,name,email,position,pic,abt,voteCount);
              
              li.add(candidate);
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return li.get(0);
  }
}
