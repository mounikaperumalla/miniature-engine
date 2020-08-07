<%-- 
    Document   : withdraw
    Created on : 04-Aug-2020, 6:39:08 pm
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
            <A href="index.html"></A>
                <IMG SRC="banking.jpg" alt="banking">	
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
      
      
           <div id="welcome" style="border-right:#666666 1px dotted;"></div>
           <h1>WITHDRAW FORM</h1><br>
    	    <table  align="center" bgcolor="white">
		
		<tr>
                     <td width="1200" valign="top">
			<div><%if(request.getAttribute("balance")!=null)
			{
			out.print(request.getAttribute("balance"));
			}
			
			 %>
                         </div>
				<form name=F1 onSubmit="return dil(this)" action="withdrawal01.jsp" >
				   <table cellspacing="5" cellpadding="3">	
				  <tr><td>ACCOUNT NO:</td><td> <input type="text" name="ACCOUNTNO"/></td></tr>
					<tr><td>USER NAME:</td><td> <input type="text" name="USERNAME"/></td></tr>
					<tr><td>PASSWORD:</td><td> <input type="password" name="PASSWORD"/></td></tr>
                                        <tr><td>AMOUNT:</td><td> <input type="text" name="AMOUNT"/></td></tr>
					<tr><td></td><td><input type="submit" value="Submit"/>
					
                   
                   <INPUT TYPE=RESET VALUE="CLEAR"></td></tr>
             	</table>
				</form>
			</td>
		</tr>
            </table>   
    <script type="text/javascript">
document.onload = ctck();
</script>
       </div>
    </body>
</html>
