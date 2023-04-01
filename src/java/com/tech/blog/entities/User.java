/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.entities;

import java.sql.*;
import com.tech.blog.dao.*;
import com.tech.blog.helpers.*;

/**
 *
 * @author Aman.Kumar
 */
public class User {

    private String name;
    private String email;
    private String password;
    private String about;
    private String gender;
    private String profilePic;
    private int id;
    private Timestamp regDate;

    public User(String name, String email, String password, String about, String gender) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.about = about;
        this.gender = gender;
    }
    
    public User(int id,String name, String email, String about, String gender) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.about = about;
        this.gender = gender;
    }

    public User() {
    }

//    getters and setters
    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getAbout() {
        return about;
    }

    public String getGender() {
        return gender;
    }

    public String getProfilePic() {
        return profilePic;
    }

    public int getId() {
        return id;
    }

    public Timestamp getRegDate() {
        return regDate;
    }

    public void setProfilePic(String profilePic) {
        this.profilePic = profilePic;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setRegDate(Timestamp regDate) {
        this.regDate = regDate;
    }
    
    

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
    

    public boolean save() {
        boolean res = false;
        Dao dao = new Dao(ConnectionProvider.getConnection());
        String query = "insert into users(username, email, password, gender, about) values(?, ?, ?, ?, ?)";
        try {

            PreparedStatement prpStmt = dao.getCon().prepareStatement(query);
            prpStmt.setString(1, this.name);
            prpStmt.setString(2, this.email);
            prpStmt.setString(3, this.password);
            prpStmt.setString(4, this.gender);
            prpStmt.setString(5, this.about);

            prpStmt.executeUpdate();
            res = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }

    public boolean getUserByEmailPassword(String email, String password){
        boolean res = false;
        Dao dao = new Dao(ConnectionProvider.getConnection());
        try {
            String query = "select * from users where email=? and password = ? ";
            PreparedStatement prpstmt = dao.getCon().prepareStatement(query) ;
            prpstmt.setString(1, email);
            prpstmt.setString(2, password);
            
            ResultSet set = prpstmt.executeQuery();
            
            if (set.next()){
                this.setName(set.getString("username"));
                this.setEmail(set.getString("email"));
                this.setAbout(set.getString("about"));
                this.setGender(set.getString("gender"));
                this.setPassword(set.getString("password"));
                this.setId(set.getInt("id"));
                this.setRegDate(set.getTimestamp("reg_date"));
                this.setProfilePic(set.getString("profile_pic"));
                res = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return res;
    }

    public boolean update() {
        boolean res = false;
        Dao dao = new Dao(ConnectionProvider.getConnection());
        try{
            String query = "update users set username=?, email=?, gender=?, about=? where id=? ";
            PreparedStatement prpstmt = dao.getCon().prepareStatement(query);
            prpstmt.setString(1, this.getName());
            prpstmt.setString(2, this.getEmail());
            prpstmt.setString(3,this.getGender());
            prpstmt.setString(4, this.getAbout());
            prpstmt.setInt(5, this.getId());
            prpstmt.executeUpdate();
            res=true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return res;
    }

    public boolean delete() {
        return false;
    }

}
