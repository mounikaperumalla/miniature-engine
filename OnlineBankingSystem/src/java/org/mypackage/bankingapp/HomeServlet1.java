package org.mypackage.bankingapp;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "HomeServlet", urlPatterns = {"/HomeServlet"})
public class HomeServlet1 extends HttpServlet {
  
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
   public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html");
       //TO GET DETAILS TO CREATE A NEW ACCOUNT IN BANK
       try (PrintWriter out = response.getWriter()) {
           //TO GET DETAILS TO CREATE A NEW ACCOUNT IN BANK
           String USERNAME=request.getParameter("USERNAME");
           String PASSWORD=request.getParameter("PASSWORD");
           String RPASSWORD=request.getParameter("RPASSWORD");
           
           String amt=request.getParameter("AMOUNT");
           double AMOUNT=Double.parseDouble(amt);
           
           String ADDRESS=request.getParameter("ADDRESS");
           
           String ph=request.getParameter("PHONENUMBER");
           double PHONENUMBER=Double.parseDouble(ph);
           
           int Status_of_Regstrn=userRegister.register(USERNAME,PASSWORD,RPASSWORD,AMOUNT,ADDRESS,PHONENUMBER);
           
           if(Status_of_Regstrn>0){
               out.print("WELCOME!YOU HAVE SUCESSFULLY CREATED YOUR ACCOUNT");
               RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
               rd.include(request,response);
           }
           else{
               out.print("SORRY YOUR REGISTRAION FAILED.TRY AGAIN");
               RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
               rd.include(request,response);
           }
       }
   }   
   }