package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerDao;
import com.entity.Customer;
import com.entity.Record;

/**
 * Servlet implementation class DisplayRecordsServlet
 */
@WebServlet("/DisplayRecordsServlet")
public class DisplayRecordsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerDao cust = new CustomerDao();
		List<Record> records = cust.getRecords();
		
		request.setAttribute("recordsdata", records);
		
		RequestDispatcher rd = request.getRequestDispatcher("list-records.jsp");
		rd.forward(request, response);
	}

}
