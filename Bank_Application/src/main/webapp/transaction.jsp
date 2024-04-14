<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="pojo.Account"%>
<%@ page import="dao.DaoAccount"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj2" class="pojo.Account" ></jsp:useBean>
<jsp:useBean id="dao" class="dao.DaoAccount" ></jsp:useBean>

<%
int amount = Integer.parseInt(request.getParameter("input_money"));
int transactionType = Integer.parseInt(request.getParameter("amount"));
int id = (Integer) session.getAttribute("id");

dao.getAccountDetails(obj2);
// Get account details


// Perform transaction based on transaction type
if (transactionType == 1) { 
	dao.depositAmount(id, amount);
	out.println("<h1>amount deposit is : "+amount+"</h1>");
	out.println("<hr>");
 	

	out.println("<h3>Thank you visit again</h3>");
} 
if (transactionType == 2) { // Withdrawal
    if (amount <=amount) {
         dao.withdrawAmount(id, amount);
         out.println("<h1>amount withdraw is : "+amount+"<h1>");
         out.println("<hr>");
     	out.println("<h3>Thank you visit again</h3>");
   
    }else{
    	out.println("<h3>insufficient balance");
    }
}

%>


</body>
</html>