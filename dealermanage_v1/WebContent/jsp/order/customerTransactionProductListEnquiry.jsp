<jsp:include page="../../base.jsp"></jsp:include>
<br>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/copytest.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/table.css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/dataTables/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jquery.dataTables.min.css">
	
<title>onlinep</title>
<link rel="stylesheet" 	href="${pageContext.request.contextPath}/css/table.css">

<script type="text/javascript">

$(document).ready(function() {
	$('#example').DataTable();
});

function getRadioValue()
{
	var id = document.getElementsByName('transaction_product_id');
	var idValue;
	for(var i = 0; i < id.length; i++){
	    if(id[i].checked){
	    	idValue = id[i].value;
	    }
	}
	
	//for enquiry [S]
	var enquiryPathWithIdValue = "${pageContext.request.contextPath}/CustomerTransactionProductController?action=enquiryEnquiry&transaction_product_id="+idValue;
	//for enquiry [E]
	
	if (idValue !=null) {
		//for enquiry [S]
		document.getElementById('enquiryEnquiry').href = enquiryPathWithIdValue;
		//for enquiry [E]
	} else {
		alert("Please select a ID !!");
		return false;
	}
}

</script>
</head>
<body>

<%
String message = (String) request.getAttribute("success");
%>
	<table align="center">
				<%
				if(message!=null) {
				%>
				<tr>
					<th Class="HeaderTH"><%=message %></th>
				</tr>
				<%
				}
				%>
	</table>
	<br>
<div class="mcontent">
			<div class="titlenav">
			<ul>
					<li class="title"><a href="${pageContext.request.contextPath}/jsp/order/customerTransactionProduct.jsp">Customer Transaction Product List</a></li>
					<li class="bread"><a href="">Dashboard > Order 
							Management > Customer Transaction List > Customer Transaction Product List</a></li>
				</ul>
			</div>
			<br>
<div class="card">
	<table class="display" style="width: 100%" cellspacing="10">			
		<tr>
			<td Class ="FormCellColor">Transaction ID</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${transaction_id}" /></td>
			<td Class ="FormCellColor">Requisition ID</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${requisition_id}" /></td>
			<td Class ="FormCellColor">DateTime</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${date_time}" /></td>
			<td Class ="FormCellColor">Customer Name</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${customer_name}" /></td>
			<td Class ="FormCellColor">Mobile</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${mobile}" /></td>
			<td Class ="FormCellColor">Total Amount</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${sumTotalAmount}" /></td>
		</tr>
	</table>
</div>
			<br>
<div class="card">
	
	<table id="example" class="display" style="width: 100%; font-size: 13px;">
		<thead>
			<tr>
				<th  Class ="HeaderTH"></th>
				<th Class ="HeaderTH">Transaction Product ID</th>
				<th Class ="HeaderTH">Product Requisition ID</th>
				<th Class ="HeaderTH">Requisition ID</th>
				<th Class ="HeaderTH">DateTime</th>
				<th Class ="HeaderTH">Product Name</th>
				<th Class ="HeaderTH">Order Quantity</th>
				<th Class ="HeaderTH">MRP</th>
				<th Class ="HeaderTH">Total MRP</th>
				<th Class ="HeaderTH">Discount Amount</th>
				<th Class ="HeaderTH">Total Amount</th>
				<th Class ="HeaderTH">Order Status</th>
				<th Class ="HeaderTH">Delivery Status</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${customerTransactionProducts}" var="ctp"> 
				<tr>
					<td Class ="FormInputColor"><input type="radio" name="transaction_product_id" id="transaction_product_id" value="${ctp.transaction_product_id}" onclick="javascript: getRadioValue();" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.transaction_product_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.requisition_product_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.requisition_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.date_time}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.product_name}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.order_quantity}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.mrp_price}" /> <br>Unit Price</td>
					<td Class ="FormInputColor"><c:out value="${ctp.total_mrp_price}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.discount_amt}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.total_amount}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.order_status == 'P' ? 'Pending' : ctp.order_status == 'A' ? 'Approved' : ctp.order_status == 'C' ? 'Cancel' : ctp.order_status == 'S' ? 'Success' : ''}" /></td>
					<td Class ="FormInputColor"><c:out value="${ctp.delivery_status == 'P' ? 'Pending' : ctp.delivery_status == 'D' ? 'Delivered' : ctp.delivery_status == 'C' ? 'Cancel' : ctp.delivery_status == 'S' ? 'Success' : ctp.delivery_status == 'R' ? 'Return' : ''}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- for get Data from sales [S] -->
	<input type="hidden" name="transaction_id" id="transaction_id" value="${transaction_id}">
	<input type="hidden" name="requisition_id" id="requisition_id" value="${requisition_id}">
	<input type="hidden" name="date_time" id="date_time" value="${date_time}">
	<input type="hidden" name="customer_name" id="customer_name" value="${customer_name}">
	<input type="hidden" name="mobile" id="mobile" value="${mobile}">
	<%
	String transaction_id = (String)request.getAttribute("transaction_id");
	String requisition_id = (String)request.getAttribute("requisition_id");
	String date_time = (String)request.getAttribute("date_time");
	String customer_name = (String)request.getAttribute("customer_name");
	String mobile = (String)request.getAttribute("mobile");
	
	HttpSession session1 = request.getSession();
	session1.setAttribute("transaction_id", transaction_id);
	session1.setAttribute("requisition_id", requisition_id);
	session1.setAttribute("date_time", date_time);
	session1.setAttribute("customer_name", customer_name);
	session1.setAttribute("mobile", mobile);
	%>
	<!-- for get Data from sales [E] -->
	<br>
<input type="hidden" name="val" id="val" value="" />
	<table align="center" width="100%">
			
				<tr>
					<td><hr align=left width="100%" color=#003399>
					<br>
					<a id="enquiryEnquiry" Class ="button" href="" onclick="javascript: getRadioValue();">enquiry</a>
					<%-- <a Class ="button" href="${pageContext.request.contextPath}/CustomerTransactionMainController?action=customerTransactionMainList">Return</a></td> --%>
					<a Class ="button" href="${pageContext.request.contextPath}/jsp/order/customerTransactionMain.jsp">Return</a></td>
				</tr>
	</table>
	</div>
</div><!-- mcontent -->
	
</div><!-- main -->
	
</body>
</html>