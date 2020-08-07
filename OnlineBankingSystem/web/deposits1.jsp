<%-- 
    Document   : deposits1.jsp
    Created on : 04-Aug-2020, 9:09:15 pm
    Author     : MOUNIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE BANKING</title>
        <link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function ctck()
{
var sds = document.getElementById("dum");

}
</script>
    </head>
    <body>
        <div id="TOPLINKS">
            
            <div id="header">
            <h1>T- BANK<span class="style1"></span></h1>
            <h2>ONE TAP-MONEY TRANSFER</h2>
            <A href="index.html"><IMG SRC="images/home1.gif"></IMG></A>	
            </div>
           
               <div id="navigation">
                   <ul>
                       <li><a href="Home.html">CREATE ACCOUNT</a></li>
                       <li><a href="accountbal.jsp">CHECK YOUR BALANCE</a></li>
                       <li><a href="transaction.jsp">TRANSACTIONS HISTORY</a></li>
                       <li><a href="deposit.jsp">DEPOSIT</a></li>
                       <li><a href="withdraw.jsp">WITHDRAW</a></li>
                       <li><a href="Fundtransfer.jsp">FUND TRANSFER</a></li>
                    </ul>  
               </div>
      <table style="width:897px; background:#FFFFFF; margin:0 auto;">
<tr >
	<td width="300" valign="top" style="border-right:#666666 1px dotted;">
    	<div id="services"><h1>Services</h1><br>
		    <ul>
        	<li>One click!</li>
            <li>One door step for all your money transactions</li>
            <li>Happy Transfer!!</li>
                    </ul>		
       </div>
	</td>
         <td width="1200" valign="top">
    	
    	<% 
%>
<table><%
        String num=request.getParameter("ACCOUNTNO");
		int ACCOUNTNO=Integer.parseInt(num);
        String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		String AMOUNT=request.getParameter("AMOUNT");
		int accoun=Integer.parseInt(AMOUNT);
	    boolean status=loginVerifcation.VerifyLogin(ACCOUNTNO,USERNAME,PASSWORD);
            try {
		if(status==true){
			out.print("Welcome    " + USERNAME);
		
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from newaccount where ACCOUNTNO=?");
			
            ps.setInt(1,ACCOUNTNO);
			ResultSet rs=ps.executeQuery();
                        int dataamount=0;
			
			if(rs.next()){
			dataamount=rs.getInt(5)+accoun; 
			
			}
                        Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con1.prepareStatement("update newaccount set amount=? where ACCOUNTNO='"+ACCOUNTNO+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			ResultSet rs1=ps1.executeQuery();
			
			if(rs1.next()){
			out.print("your balance has increase");
			request.setAttribute("totaldataamount",dataamount);
			request.setAttribute("balance","your balance has increase");	
			%>
			<jsp:forward page="dbalance.jsp"></jsp:forward> 
			<% 
                            }
                           }
                        else{
			out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
                       %>
                       <jsp:forward page="deposit.jsp"></jsp:forward> 
			<% 
                            }
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
			%></table><%
%>
    	
    	
		 </table>
        </div>
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
</html>
