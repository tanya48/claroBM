/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tekio.project.clarobm.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Asho
 */
public class Conexion {
    public static Connection getConexion() throws SQLException{

//        String url = "jdbc:mysql://172.18.6.11:3306/claro?&serverTimezone=America/Mexico_City";
//        String user = "claro2";
//        String pass = "claro2";
        String url = "jdbc:mysql://localhost/claro2?&serverTimezone=America/Mexico_City";
        String user = "root";
        String pass = "";
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        }catch(Exception ex){
            System.out.println(ex.getMessage());
        }
        
        return DriverManager.getConnection(url,user,pass);
    }
    
    public static void main(String[] args) throws SQLException {
        if(Conexion.getConexion() == null)
            System.out.println("No se conectó");
        else
            System.out.println("Se conectó");
    }
}