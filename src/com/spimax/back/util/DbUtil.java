package com.spimax.back.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DbUtil {
	
	 public static Connection getConnection(){  
	        Connection conn=null;  
	        try {  
	            Class.forName("oracle.jdbc.driver.OracleDriver");//找到oracle驱动器所在的类  
	            String url="jdbc:oracle:thin:@localhost:1521:orcl"; //URL地址  
	            String username="scott";  
	            String password="bao123";  
	            conn=DriverManager.getConnection(url, username, password);  
	              
	        } catch (ClassNotFoundException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        } catch (SQLException e) {  
	            // TODO Auto-generated catch block  
	            e.printStackTrace();  
	        }  
	        return conn;  
	    }  
	     
	    public static void close(PreparedStatement pstmt){  
	        if(pstmt !=null){  
	            try {  
	                pstmt.close();  
	            } catch (SQLException e) {  
	                  
	                e.printStackTrace();  
	            }  
	        }  
	    }  
	      
	    public static void close(ResultSet rs){  
	        if(rs !=null){  
	            try {  
	                rs.close();  
	            } catch (SQLException e) {  
	                // TODO Auto-generated catch block  
	                e.printStackTrace();  
	            }  
	        } 
	    }
}
