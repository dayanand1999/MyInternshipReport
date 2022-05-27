<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Customer</title>
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
    </style>
</head>
<body style="margin-top:80px">
			<div id="header">
				<div class="w3-top">
  <div class="w3-bar w3-gray w3-card w3-left-align w3-large">
    <h1 style="text-align:center">BANK-PAY</h1>
    
  </div>
				</div>
			</div>
			<div id="container" style="background-color:teal;border:1px solid black;border-radius:25px;text-align:center;margin:100px 300px;
							padding:20px 20px 50px 20px">
			<form action="showFormForTransfer.jsp">
					Customer ID : <%= request.getParameter("cId") %><br><br>
					
					Name : <%= request.getParameter("name") %><br><br>
					
					Email : <%= request.getParameter("email") %><br><br>
					
					Current Balance : <%= request.getParameter("balance") %><br><br>
					
					<input type="submit" value="TRANSFER" style="float:left;margin-left:300px">
					</form>
					<form action="DisplayCustomersServlet" style="float:right;margin-right:300px">
						<button type="submit">BACK</button>
					</form>
			</div>
			
</body>
</html>