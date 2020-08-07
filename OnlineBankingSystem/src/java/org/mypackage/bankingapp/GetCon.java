package org.mypackage.bankingapp;
import java.sql.*;
public class GetCon {
    private GetCon(){}
    
  public static Connection con;
  static{
      try{
          Class.forName(DBintlz.DRIVER);
          con=DriverManager.getConnection(DBintlz.CONN_STRING,DBintlz.UNAME,DBintlz.PWORD);
      }
      catch(ClassNotFoundException e) {
          System.out.println("exception");
	} 
      catch (SQLException e) {
	
		System.out.println("Exception in GetCon");
	}
  }
      public static Connection getCon(){
	return con;
}
      
}     
