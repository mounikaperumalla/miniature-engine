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
            <A href="index.html"><IMG SRC="onlinebanking.png" alt="banking"/></A>	
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
		<tr>
			<td align="center" valign="middle" bgcolor="red"><h4>Transaction info of account</h4></td>
		</tr>
                <tr>
			<td>
                            <%
		        String num=request.getParameter("ACCOUNTNO");
		       int ACCOUNTNO=Integer.parseInt(num);
                       String USERNAME=request.getParameter("USERNAME");
		       String PASSWORD=request.getParameter("PASSWORD");
    
		        String AMOUNT=request.getParameter("totaldataamount");
		int accoun=Integer.parseInt(AMOUNT);
                         boolean status=loginVerifcation.VerifyLogin(ACCOUNTNO,USERNAME,PASSWORD);
                         if(status==true){
			out.print("Welcome    " + USERNAME);
                         if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			out.print(request.getAttribute("totaldataamount"));
		
                       }
                       %>
                       </td>
		</tr>
                </table>
                    <%    
                       
            String TranType="Deposit";
             Connection con1=GetCon.getCon();
            try {
		       PreparedStatement ps1=con1.prepareStatement("insert into transaction set account_no='"+ACCOUNTNO+"',username='"+USERNAME+"',amount='"+AMOUNT+"',TranType='"+TranType);
			ResultSet rs1=ps1.executeQuery();
			}
                        
             catch(SQLException e){
                        
                        }
       
                        }
			 %>
				
        </div>
    </body>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="org.mypackage.bankingapp.*" %>
</html>
