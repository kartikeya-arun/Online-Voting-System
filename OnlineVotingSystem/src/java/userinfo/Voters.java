/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package userinfo;

public class Voters 
{
    String name;
    String email;
    String password;
    int id;
    String user_type;
    String status;
    String aadhaar;

    public Voters(String name, String email, String password, int id, String user_type,String status,String aadhaar) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.id = id;
        this.status=status;
        this.aadhaar=aadhaar;
    }

    public String getAadhaar() {
        return aadhaar;
    }

    public void setAadhaar(String aadhaar) {
        this.aadhaar = aadhaar;
    }
    
    

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

  
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public String getUser_type() {
        return user_type;
    }

    public void setUser_type(String user_type) {
        this.user_type = user_type;
    }
   
    public void setPassword(String password) {
        this.password = password;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

}