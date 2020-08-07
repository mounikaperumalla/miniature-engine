<%-- 
    Document   : deposit
    Created on : 04-Aug-2020, 8:59:12 pm
    Author     : MOUNIKA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ONLINE BANKING</title>
        <link href="style.css" rel="stylesheet" type="text/css">
        <SCRIPT LANGUAGE="JavaScript">
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
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>DEPOSIT FORM</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
		
		</tr>
               
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
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>WITHDRAW FORM</h1><br>
    	    <table  align="center" bgcolor="white">
		<tr>
		
		</tr>
                <tr>
			<td><div><%if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			}
			
			 %></div>
                         <form name=F1 onSubmit="return dil(this)" action="deposits1.jsp" >
				   <table cellspacing="5" cellpadding="3">	
				  <tr><td>ACCOUNT NO:</td><td> <input type="text" name="ACCOUNTNO"/></td></tr>
					<tr><td>USER NAME:</td><td> <input type="text" name="USERNAME"/></td></tr>
					<tr><td>PASSWORD:</td><td> <input type="password" name="PASSWORD"/></td></tr>
					<tr><td>TARGET ACCOUNT NO:</td><td><input type="text" name="taccountno"/></td></tr>
                                        <tr><td>AMOUNT:</td><td> <input type="text" name="AMOUNT"/></td></tr>
                                        
					<tr><td></td><td><input type="submit" value="Submit"/>
					
                   
                   <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
             	</table>
				</form>
			</td>
		</tr>
	</table>
    	   </div>      
    </td><td width="299" valign="top">
    	<div id="welcome" style="border-right:#666666 1px dotted;"><h1>Welcome</h1><br>
    	    <center><img src="images/globe_10.gif" alt="business" width="196" height="106"></center><br>
		    <p>REQUIRED INFORMATION AND TRANSFERS DISPLAYED</p>
	    	
	    </div>      
    </td>
            	
    
</tr></table>
           
    <script type="text/javascript">
document.onload = ctck();
</script>
                </div>
    </body>
</html>

