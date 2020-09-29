/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package candidate;

/**
 *
 * @author NEERAJ PANDEY
 */
public class CandidateContainer {
    
    int id;
    String name;
    String email;
    String position;
    String pic;
    String about;
    int voteCount;

    public CandidateContainer(int id, String name, String email, String position, String pic) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
        this.pic = pic;
    }
    public CandidateContainer(int id, String name, String email, String position, String pic,String about)
    {
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
        this.pic = pic;
        this.about=about;
    }
    
     public CandidateContainer(int id, String name, String email, String position, String pic,String about,int voteCount)
    {
        this.id = id;
        this.name = name;
        this.email = email;
        this.position = position;
        this.pic = pic;
        this.about=about;
        this.voteCount=voteCount;
        
    }

    public int getVoteCount() {
        return voteCount;
    }

    public void setVoteCount(int voteCount) {
        this.voteCount = voteCount;
    }
     
     

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
    
    
    
}
