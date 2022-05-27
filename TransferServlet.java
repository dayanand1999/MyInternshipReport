package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerDao;
import com.entity.Customer;

/**
 * Servlet implementation class TransferServlet
 */
@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter pw = response.getWriter();
		
		int SentAcc = Integer.parseInt(request.getParameter("accNo1"));
		int ReceiveAcc = Integer.parseInt(request.getParameter("accNo2"));
		double Amount = Integer.parseInt(request.getParameter("amt"));
		
		CustomerDao cust = new CustomerDao();
		pw.println(cust.getBalance(SentAcc));
		pw.println(cust.getBalance(ReceiveAcc));
		if(SentAcc>100 && SentAcc<=110) {
			if(ReceiveAcc>100 && ReceiveAcc<=110) {
				if(Amount<=cust.getBalance(SentAcc)) {
					cust.updateAccountBalance(ReceiveAcc, cust.getBalance(ReceiveAcc)+Amount);
					cust.updateAccountBalance(SentAcc, cust.getBalance(SentAcc)-Amount);
					cust.recordTransfer(SentAcc, ReceiveAcc, Amount);
					List<Customer> customers = cust.getCustomers();
					
					request.setAttribute("custdata", customers);
					
					RequestDispatcher rd = request.getRequestDispatcher("list-customers.jsp");
					rd.forward(request, response);
				}
				else {
					pw.println("Invalid Amount");
				}
			}
			else {
				pw.println("Invalid Account No");
			}
		}
		else {
			pw.println("Invalid Account No");
		}
		
		
		
	}

}
