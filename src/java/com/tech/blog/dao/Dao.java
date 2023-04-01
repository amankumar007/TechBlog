
package com.tech.blog.dao;

import java.sql.Connection;

/**
 *
 * @author Aman.Kumar
 */

import java.sql.*;
/**
 *
 * @author Aman.Kumar
 */
public class Dao {
    private Connection con;

    public Dao(Connection con) {
        this.con = con;
    }
    // getters and setter

    public Connection getCon() {
        return con;
    }

    public void setCon(Connection con) {
        this.con = con;
    }
    
    
}

