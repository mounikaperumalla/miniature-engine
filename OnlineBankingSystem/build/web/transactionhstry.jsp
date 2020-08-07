<%-- 
    Document   : transactionhstry
    Created on : 06-Aug-2020, 7:14:17 pm
    Author     : MOUNIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE BANKING</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <SCRIPT type="text/JavaScript">
     function dil(form)
     {
         for(var i=0;i<form.elements.length;i++)
         {
             if(form.elements[i].value === "")
             {
                 alert("FILL ALL THE FIELDS MENTIONED");
		   document.F1.ACCOUNTNO.focus();
		   return false;
             }       
         }
         if(isNaN(document.F1.ACCOUNTNO.value))
   {
       alert("Account number can't be null");
	   document.F1.ACCOUNTNO.value="";
	   document.F1.ACCOUNTNO.focus();
	   return false;
   }
    if(!isNaN(document.F1.USERNAME.value))
   {
       alert("User Name  must  be  char's & can't be null");
           document.F1.USERNAME.value="";
	   document.F1.USERNAME.focus();
	   return false;
   }
   if(!isNaN(document.F1.PASSWORD.value))
   {
       alert("Password  must  be  char's & can't be null");
	   document.F1.PASSWORD.value="";
	   document.F1.PASSWORD.focus();
	   return false;
   }
   
   return true;
     }
     <script>
 <SCRIPT type="text/JavaScript">   
function ctck()
{
var sds = document.getElementById("dum");
}
</SCRIPT>
    </head>
    <body>
          <div id="TOPLINKS">
            
            <div id="header">
            <h1>T- BANK<span class="style1"></span></h1>
            <h2>ONE TAP-MONEY TRANSFER</h2>
            <A href="index.html"><IMG SRC="images/home1.gif"/></A>	
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
               <%
                    String num=request.getParameter("ACCOUNTNO");
		       int ACCOUNTNO=Integer.parseInt(num);
                    Connection con1=GetCon.getCon();
                    try {
		       PreparedStatement ps1=con1.prepareStatement("select * from  transaction where account_no= ?" );
			ResultSet rs1=ps1.executeQuery();

                     
                    
                   
                 out.println("<table width='700px' align='center'  style='border:1px solid #000000;' >");
                 out.println("<tr>");
                 out.println("<td colspan=8 align='center' style='background-color:ffeeff'><b>Transaction Report</b></td>");
                 out.println("</tr>");
                 out.println("<tr style='background-color:black;'>");
                 out.println("<td><b>T.id</b></td>");                  
                 out.println("<td><b>Username</b></td>");
                 out.println("<td><b>Amount</b></td>");
                 out.println("<td><b>Transaction Type</b></td>");
                 out.println("</tr>");	
                            
                                out.print("<tr>");
				out.print("<td>" + rs1.getInt(1) + "</td>");
				out.print("<td>" + rs1.getString(2) + "</td>");
				out.print("<td>" + rs1.getInt(4) + "</td>");
				out.print("<td>" + rs1.getString(5) + "</td>");
		
				
			
				out.print("</tr>");
                   }
                   catch(SQLException e)
                   {
                   
                   }
                   out.println("</table>");
			%>
          </div>		
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
</html>
