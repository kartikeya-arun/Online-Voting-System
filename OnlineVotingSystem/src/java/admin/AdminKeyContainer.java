/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.sql.Timestamp;

/**
 *
 * @author NEERAJ PANDEY
 */
public class AdminKeyContainer 
{
    int id;
    int resToggle;
   
    String endTime;

    public AdminKeyContainer(int id, int resToggle, String endTime) {
        this.id = id;
        this.resToggle = resToggle;
       
        this.endTime = endTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResToggle() {
        return resToggle;
    }

    public void setResToggle(int resToggle) {
        this.resToggle = resToggle;
    }

   
   

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }
    
    
    
}
