<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.entity.Customer,java.util.ArrayList,com.dao.CustomerDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customers</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Lato", sans-serif}
    .w3-bar,h1,button {font-family: "Montserrat", sans-serif}
    .fa-anchor,.fa-coffee {font-size:200px}
    
    .button1{
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
    }
    table{
    border: 0.5px solid var(--gray-dark);
    width: 100%;
    padding-left:20px;
}
	th, td {
  border-bottom: 1px solid #ddd;
  height: 45px;
}
tr:nth-child(even) {background-color: #f2f2f2;}
    </style>
</head>
<body class="w3-white">
				<div id="header">
				<div class="w3-top">
  <div class="w3-bar w3-gray w3-card w3-left-align w3-large">
    <h1 style="text-align:center">BANK-PAY</h1>
    
  </div>
				</div>
			</div>
			
			<div class="w3-white">
			<div id="container" style="margin-top:80px">
				<div id="content">
					
					<table>
						<tr>
							<th> Customer Id </th>
							<th> Customer Name </th>
							<th> Email </th>
							<th> Balance </th>
							<th> Action </th>
						</tr>
						
						<%ArrayList<Customer> customers = (ArrayList<Customer>)request.getAttribute("custdata");
						
						for(Customer customer : customers)
						{%>
							<tr>
								<td> <%= customer.getCid() %> </td>
								<td> <%= customer.getName() %> </td>
								<td> <%= customer.getEmail() %> </td>
								<td> <%= customer.getBalance() %> </td>
								<td> <a href="showFormForView.jsp?cId=<%=customer.getCid() %>
																&name=<%=customer.getName() %>
																&email=<%= customer.getEmail() %>
																&balance=<%= customer.getBalance() %>">
											View</a>
								 </td>
							</tr>
						<%} %>
						
					</table>
					
					<div class="button1">
					<form action="DisplayRecordsServlet" style="float:left;margin: 0px 20rem;background-color:gray">
						<button type="submit">HISTORY</button>
					</form>
					<form action="homepage.html" style="float:right;margin: 0px 20rem">
						<button type="submit">BACK</button>
					</form>
					</div>
				
				</div>
			</div>
			</div>
</body>
</html>