package org.mypackage.bankingapp;
import javax.servlet.*;
import java.sql.*;



public class ServletListener implements ServletContextListener {
    
    
    @Override
    public void contextInitialized(ServletContextEvent arg0)
   {
        int status_of_listener=0;
        Connection con;
        
        try{
            con=GetCon.getCon();
            PreparedStatement ps1=con.prepareStatement("Select * from newaccount");
            try{
            status_of_listener=ps1.executeUpdate();
            }
        catch(SQLException e){
            status_of_listener=2;
            System.out.println("My status is 11111"+ status_of_listener);
        }
            switch (status_of_listener) {
                case 0 -> System.out.println("TABLE NAME ALREADY EXISTS");
                case 2 -> {
                    System.out.println("TABLE SUCESSFULLY CREATED");
                    PreparedStatement ps=con.prepareStatement("CREATE TABLE  newaccount(ACCOUNTNO INT,USERNAME VARCHAR2(45),PASSWORD VARCHAR2(45),REPASSWORD VARCHAR2(45),AMOUNT INT,ADDERESS VARCHAR2(45),PHONENUMBER INT ,PRIMARY KEY (ACCOUNTNO))");
                    ps.executeUpdate();
                    PreparedStatement ps4=con.prepareStatement("CREATE TABLE  transaction(Tid INT AUTO_INCREMENT,account_no int,username VARCHAR2(45),password VARCHAR2(45),amount INT,PRIMARY KEY (Tid))");
                    ps4.executeUpdate();
                }
                default -> System.out.println(status_of_listener);
            }
        }
   
    catch(SQLException e){
    
}
   }

   
    @Override
   public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("project undeployed");
		
	}
}