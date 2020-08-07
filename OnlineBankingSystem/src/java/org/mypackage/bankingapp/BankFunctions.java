package org.mypackage.bankingapp;
import java.rmi.*;

public interface BankFunctions extends Remote {
    public int CreateAccount(String username,String password,double amount,String adderess,double phone) throws RemoteException;
    public String WithDrawal(int acno,String uname,String pwd,int amt) throws RemoteException;
    public String Deposit(int acno,String uname,String pwd,int amt) throws RemoteException;
    public String FundTransfer(int acno,String uname,String pwd,int tacno,int amt) throws RemoteException;
    public String AccountBalance(int acno,String uname,String pass) throws RemoteException;
    public String TransactionHistory(int acno,String uname,String pass);    
}
