package org.mypackage.bankingapp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
 import java.sql.SQLException;

/**
 *
 * @author MOUNIKA
 */
public class loginVerifcation {
    public static boolean VerifyLogin(int ACCOUNTNO,String USERNAME,String PASSWORD){
        boolean status_of_verifyLogin=false;
        Connection con= GetCon.getCon();
         try{
            PreparedStatement ps=con.prepareStatement("Select * from newaccount where ACCOUNTNO=? and USERNAME = ? and PASSWORD =?");
            ps.setInt(1,ACCOUNTNO);
            ps.setString(2,USERNAME);
            ps.setString(3,PASSWORD);
            
            
            ResultSet rs=ps.executeQuery();
            status_of_verifyLogin=rs.next();
        }
        catch (SQLException e){
        }
        return status_of_verifyLogin;
    
}
    
}
