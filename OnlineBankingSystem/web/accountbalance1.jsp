<%-- 
    Document   : accountbalance
    Created on : 03-Aug-2020, 9:46:43 pm
    Author     : MOUNIKA
--%>

<%@page import="org.mypackage.bankingapp.*"%>
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
                <h1>T - BANK<span class="style1"></span></h1>
            <h2>ONE TAP-MONEY TRANSFER</h2>
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
            <table><%
                String anum=request.getParameter("ACCOUNTNO");
                int ACCOUNTNO=Integer.parseInt(anum);
                String USERNAME=request.getParameter("USERNAME");
                String PASSWORD=request.getParameter("PASSWORD");
                boolean status=loginVerifcation.VerifyLogin(ACCOUNTNO,USERNAME,PASSWORD);
                try{
                if(status==true){
                System.out.println("WelcomE" +"USERNAME");
                Connection con=GetCon.getCon();
                PreparedStatement ps=con.prepareStatement("Select * from newaccount where ACCOUNTNO=?");
                ps.setInt(1,ACCOUNTNO);
                ResultSet rs=ps.executeQuery();
                out.print("<table align='left' cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
                        while(rs.next()){
                        int ACCOUNTNO1=rs.getInt(1);
                         session.setAttribute("ACCOUNTNO",ACCOUNTNO1);
                         System.out.println(ACCOUNTNO);
                         
                         out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getInt(7) + "</td>");
				out.print("</tr>");
                }
                out.println("</table>");
                
               out.print("<form name='F1'>");
               out.print("<input type='button' name='FUND TRANSFER'onClick='document.forms[0].action='FundTransfer.jsp'.return true;'/>");
               out.print("</form>");
                }
                else{
                out.print("Please check your username and Password");
			request.setAttribute("balance","Please check your username and Password");
		
                        out.print("<jsp:forward page='accountba1.jsp'></jsp:forward>");
                            }
                }
                       catch (SQLException e){
                       }

}
                
                
            %></table><%
                %>
        </div>
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
    
</html>
