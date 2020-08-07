<%-- 
    Document   : Fundtransfers.jsp
    Created on : 04-Aug-2020, 3:06:37 pm
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
           
      <table>
           <td width="1200" align="top">
          <%
          
          String num= request.getParameter("ACCOUNTNO");
		int ACCOUNTNO=Integer.parseInt(num);
		
	String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		String amoun=request.getParameter("AMOUNT");
		int accoun=Integer.parseInt(amoun);
                boolean status = loginVerifcation.VerifyLogin(ACCOUNTNO,USERNAME,PASSWORD);
                try {
		if(status==true){
			out.print("Welcome    " + USERNAME);
		    out.print("       TARGET ACCOUNT NO DOES NOT EXSIT -->    " + taccountno);
		    %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <A href='index.html'><IMG SRC='/onlinebanking'/></A>
                    <% 
			Connection con=GetCon.getCon();
			PreparedStatement ps=con.prepareStatement("Select * from newaccount where ACCOUNTNO ='"+taccountno+"'");
			ResultSet rs=ps.executeQuery();
			int dataamount=0;
			
			if(rs.next()){
			dataamount=accoun+rs.getInt(5); 
			}
                        Connection con1=GetCon.getCon();
			
			PreparedStatement ps1=con1.prepareStatement("update newaccount set AMOUNT=? where ACCOUNTNO='"+taccountno+"'");
			ps1.setInt(1,dataamount);
			ps1.executeUpdate();
			ResultSet rs1=ps1.executeQuery();
                        if(rs1.next()){}
			System.out.println("data amount"+dataamount);
			request.setAttribute("FUNDRECIEVED",dataamount);
			Connection con2=GetCon.getCon();
			PreparedStatement ps2=con2.prepareStatement("Select * from newaccount where ACCOUNTNO=?");
			
                        ps2.setInt(1,ACCOUNTNO);
			ResultSet rs2=ps2.executeQuery();
                        
                       
                        int dataamount1=0;
			if(rs2.next()){
			dataamount1=rs2.getInt(5)-accoun; 
			System.out.println(dataamount1);
			}
                        
              Connection con3 = GetCon.getCon();
			
			PreparedStatement ps3=con3.prepareStatement("update newaccount set AMOUNT=? where ACCOUNTNO='"+ACCOUNTNO+"'");
			ps3.setInt(1,dataamount1);
			ps3.executeUpdate();
			ResultSet rs3=ps3.executeQuery();
                        
                 if(rs3.next()){
		
			request.setAttribute("FUNDRECIEVED ",dataamount);
			request.setAttribute("FUNDTRASFERED ",dataamount1);
                        }
 %>
                    <jsp:forward page="tbalance.jsp"></jsp:forward> 
                    <% 
		out.print("<tr><th>ACCOUNT NO</th><th>USERNAME</th><th>AMOUNT</th><th>ADDRESS</th><th>PHONE</th></tr>");
			while(rs.next()){
			    int accountno1=rs.getInt(1);
				session.setAttribute("ACCOUNTNO",accountno1);
				
				System.out.print(ACCOUNTNO);
				
				out.print("<tr>");
				out.print("<td>" + rs.getInt(1) + "</td>");
				out.print("<td>" + rs.getString(2) + "</td>");
				out.print("<td>" + rs.getInt(5) + "</td>");
				out.print("<td>" + rs.getString(6) + "</td>");
				out.print("<td>" + rs.getInt(7) + "</td>");
				
			
				out.print("</tr>");
			
			}
                            
			out.print("</table>");
                 out.print("<form name='F1'>");
               out.print("<input type='button' name='FUND TRANSFER'onClick='document.forms[0].action='accountbal.jsp'.return true;'/>");
               out.print("</form>");
			}
else{
                 out.print("Please check your username and Password and target accountno");
			request.setAttribute("balance","Please check your username and Password and target accountno");
			%>
			<jsp:forward page="Fundtransfer.jsp"></jsp:forward> 
			<%
                            }
		 }catch (SQLException e) {
			e.printStackTrace();
		}
		
		
			%>
        </td>
      </table> <%
%>
        </div>
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
</html>
