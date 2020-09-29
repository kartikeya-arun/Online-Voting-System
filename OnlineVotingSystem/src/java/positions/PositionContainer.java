/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package positions;

/**
 *
 * @author NEERAJ PANDEY
 */
public class PositionContainer
{
  int id;
  String p_name;
  String p_desc;

    public PositionContainer(int id, String p_name, String p_desc) {
        this.id = id;
        this.p_name = p_name;
        this.p_desc = p_desc;
    }
    
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_desc() {
        return p_desc;
    }

    public void setP_desc(String p_desc) {
        this.p_desc = p_desc;
    }
  
  
}
