
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
               <p>Welcome!</p>
               <table style="width:897px; background:#FFFFFF; margin:0 auto;"> <%
                   try{
                   Connection con1=GetCon.getCon();
                   PreparedStatement ps1=con1.prepareStatement("Select max(ACCOUNTNO) from newaccount");
                   ResultSet rs1=ps1.executeQuery();
            while(rs1.next()){
				int  ACCOUNTNO=rs1.getInt(1);
				request.setAttribute("ACCOUNTNO",ACCOUNTNO);
				}
		    Integer ACCOUNTNO=(Integer)request.getAttribute("ACCOUNTNO");
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from newaccount where ACCOUNTNO='"+ACCOUNTNO+"'");
                        ResultSet rs=ps.executeQuery();
			
			out.print("<table align='left'  cellspacing='5' cellpadding='5'>");
			out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>PASSWORD</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
				
				session.setAttribute("ACCOUNTNO",ACCOUNTNO);
				
				System.out.print(ACCOUNTNO);
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getString(3) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getLong(7) + "</td>");
                                out.print("</tr>");
			    
			}
			out.print("</table>");
			} catch (SQLException e) {
			e.printStackTrace();
		}
   
			%></table><%
                       %> 
 <%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
        </div>
    </body>
</html>
