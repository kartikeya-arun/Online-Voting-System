/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package positions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author NEERAJ PANDEY
 */
public class PositionProvider
{
  public List<PositionContainer> getAllPositions(Connection con)
  {
      List<PositionContainer> list=new ArrayList<>();
      
      String query="select * from positions order by id desc";
      
      try
      {
          Statement stmt=con.createStatement();
          ResultSet rs=stmt.executeQuery(query);
          
          while(rs.next())
          {
              int id=rs.getInt("id");
              String pos=rs.getString("p_name");
              String desc=rs.getString("p_desc");
              
              PositionContainer pc=new PositionContainer(id,pos,desc);
              
             list.add(pc);
          }
          
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return list;
  }
}
