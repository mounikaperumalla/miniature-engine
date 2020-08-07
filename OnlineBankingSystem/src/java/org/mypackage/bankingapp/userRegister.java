package org.mypackage.bankingapp;
import java.sql.*;

public class userRegister {
    static int Status_of_Regstrn=0;
    public static  int register(String USERNAME,String PASSWORD,String RPASSWORD,double AMOUNT,String ADDRESS,double PHONE){
              Connection con=GetCon.getCon();
            PreparedStatement ps;
            try{
                ps=con.prepareStatement("Insert into newaccount values(??????)");
                ps.setString(1,USERNAME);
                ps.setString(2,PASSWORD);
                ps.setString(3,RPASSWORD);
                ps.setDouble(4,AMOUNT);
                ps.setString(5,ADDRESS);
                ps.setDouble(6, PHONE);
                Status_of_Regstrn=ps.executeUpdate();
                }
           catch(SQLException e) {
            }
            return Status_of_Regstrn;
    }
    }
    