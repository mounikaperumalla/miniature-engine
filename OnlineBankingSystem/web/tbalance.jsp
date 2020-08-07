
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
      <table style="width:897px; background:#FFFFFF; margin:0 auto;">
                <tr>
			<td align="center" valign="middle" bgcolor="red"><h4>Transaction info of account</h4></td>
			<td>
			<%
			{
			out.print("the target account balance is");
			out.print(request.getAttribute("FUNDRECIEVED "));
			out.println("reduced balance is");
			out.print(request.getAttribute("FUNDTRASFERED"));
				
                        String num= request.getParameter("ACCOUNTNO");
		int ACCOUNTNO=Integer.parseInt(num);
		
	String USERNAME=request.getParameter("USERNAME");
		String PASSWORD=request.getParameter("PASSWORD");
		
		String num1=request.getParameter("taccountno");
		int taccountno=Integer.parseInt(num1);
		
		String amoun=request.getParameter("AMOUNT");
		int accoun=Integer.parseInt(amoun);
                
                 String AMOUNT=request.getParameter("FUNDTRANSFERED");
		int Fdaccoun=Integer.parseInt(AMOUNT);
                
                 String FAMOUNT=request.getParameter("FUNDRECIEVED");
		int Fdaccount=Integer.parseInt(FAMOUNT);
                
               String TranType="Fundtransfers";

                
			Connection con1=GetCon.getCon();
            try {
		       PreparedStatement ps1=con1.prepareStatement("insert into transaction set account_no='"+ACCOUNTNO+"',username='"+USERNAME+"',amount='"+Fdaccount+"',TranType='"+TranType);
			ResultSet rs1=ps1.executeQuery();
			}
                        
             catch(SQLException e){
                        
                        }

			 %>
			</td>
		</tr>
               
                </table><%
%>
    </div>
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
</html>
