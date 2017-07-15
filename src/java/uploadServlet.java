/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 import java.sql.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;

@MultipartConfig(maxFileSize = 16177215)   
public class uploadServlet extends HttpServlet {
  // database connection settings
   
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        String e = request.getParameter("ele");
        String c = request.getParameter("candidate");
         InputStream inputStream = null; // input stream of the upload file

     // btains the upload file part in this multipart request
         Part filePart = request.getPart("photo");
         if (filePart != null) {
           // prints out some information for debugging
            System.out.println(filePart.getName());
             System.out.println(filePart.getSize());
           System.out.println(filePart.getContentType());

           // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
            }
           Connection conn = null; // connection to the database
           String message = null; // message will be sent back to client
           try {
             // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ladmin", "root", "");
                                   
             // constructs SQL statement
             String sql = "update "+e+" set image_url='"+ inputStream+" where candidate = "+c;
             Statement k = conn.createStatement();
             k.executeUpdate(sql);
           
        } catch (SQLException ex) {
             message = "ERROR: " + ex.getMessage();
             ex.printStackTrace();
             }
           finally {
           if (conn != null) {
                  // closes the database connection
              try {
                  conn.close();
                  } catch (SQLException ex) {
                   ex.printStackTrace();
                  }
            }
          }
       }
}

