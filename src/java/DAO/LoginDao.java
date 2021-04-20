/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


     


public class LoginDao {
	String sql="select * from usuario where nome=? and senha=?";
	
	public boolean check(String usuario,String senha) {
		Connection con=null;
	    try{
		Class.forName("com.mysql.jdbc.Driver");

    	
    	 con= DriverManager.getConnection("jdbc:mysql://localhost:3306/livraria","root","root");
    	 PreparedStatement st=con.prepareStatement(sql);
    	 st.setString(1,usuario);
    	 st.setString(2,senha);
    	 ResultSet rs=st.executeQuery();
    	 if(rs.next()) {
    		 return true;
    	 }
    	 
    	 
    	 
    }catch(Exception e){System.out.println(e);}
		
		return false;
	}
	
	

}