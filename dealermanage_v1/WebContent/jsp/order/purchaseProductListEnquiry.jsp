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
	var id = document.getElementsByName('purchase_product_id');
	var idValue;
	for(var i = 0; i < id.length; i++){
	    if(id[i].checked){
	    	idValue = id[i].value;
	    }
	}
	
	//for enquiry [S]
	var enquiryPathWithIdValue = "${pageContext.request.contextPath}/PurchaseProductController?action=enquiryEnquiry&purchase_product_id="+idValue;
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
					<li class="title"><a href="${pageContext.request.contextPath}/jsp/order/purchaseProduct.jsp">Purchase Product List</a></li>
					<li class="bread"><a href="">Dashboard > Order 
							Management > Purchase List > Purchase Product List</a></li>
				</ul>
			</div>
			<br>
<div class="card">
	<table class="display" style="width: 100%" cellspacing="10">			
		<tr>
			<td Class ="FormCellColor">Purchase ID</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${purchase_id}" /></td>
			<td Class ="FormCellColor">DateTime</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${date_time}" /></td>
			<td Class ="FormCellColor">Owner Name</td>
			<td Class ="FormInputColor" colspan="2"><c:out value="${owner_name}" /></td>
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
				<th Class ="HeaderTH">Purchase Product ID</th>
				<th Class ="HeaderTH">DateTime</th>
				<!-- <th Class ="HeaderTH">Product ID</th> -->
				<th Class ="HeaderTH">Product Name</th>
				<!-- <th Class ="HeaderTH">Pack Type</th>
				<th Class ="HeaderTH">Pack Size</th>
				<th Class ="HeaderTH">Pieces</th>
				<th Class ="HeaderTH">Bonus ID</th>
				<th Class ="HeaderTH">Bonus Name</th> -->
				<!-- <th Class ="HeaderTH">Order Pack</th> -->
				<th Class ="HeaderTH">Order Quantity</th>
				<th Class ="HeaderTH">TP Price</th>
				<th Class ="HeaderTH">Total TP Price</th>
				<th Class ="HeaderTH">Discount Amount</th>
				<th Class ="HeaderTH">Total Amount</th>
				<th Class ="HeaderTH">Order Status</th>
				<th Class ="HeaderTH">Delivery Status</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${purchaseProducts}" var="pp"> 
				<tr>
					<td Class ="FormInputColor"><input type="radio" name="purchase_product_id" id="purchase_product_id" value="${pp.purchase_product_id}" onclick="javascript: getRadioValue();" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.purchase_product_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.date_time}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.product_id}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${pp.product_name}" /></td>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.pack_type}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.pack_size}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.piceces}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.bonus_id}" /></td>
					<td Class ="FormInputColor"><c:out value="${sp.bonus_name}" /></td> --%>
					<%-- <td Class ="FormInputColor"><c:out value="${sp.order_pack}" /></td> --%>
					<td Class ="FormInputColor"><c:out value="${pp.order_quantity}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.tp_price}" /> <br>Unit Price</td>
					<td Class ="FormInputColor"><c:out value="${pp.total_tp_price}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.discount_amt}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.total_amount}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.order_status == 'P' ? 'Pending' : pp.order_status == 'A' ? 'Approved' : pp.order_status == 'C' ? 'Cancel' : pp.order_status == 'S' ? 'Success' : ''}" /></td>
					<td Class ="FormInputColor"><c:out value="${pp.delivery_status == 'P' ? 'Pending' : pp.delivery_status == 'D' ? 'Delivered' : pp.delivery_status == 'C' ? 'Cancel' : pp.delivery_status == 'S' ? 'Success' : pp.delivery_status == 'R' ? 'Return' : ''}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<!-- for get Data from sales [S] -->
	<input type="hidden" name="purchase_id" id="purchase_id" value="${purchase_id}">
	<input type="hidden" name="date_time" id="date_time" value="${date_time}">
	<input type="hidden" name="owner_name" id="owner_name" value="${owner_name}">
	<input type="hidden" name="mobile" id="mobile" value="${mobile}">
	<%
	String purchase_id = (String)request.getAttribute("purchase_id");
	String date_time = (String)request.getAttribute("date_time");
	String owner_name = (String)request.getAttribute("owner_name");
	String mobile = (String)request.getAttribute("mobile");
	
	HttpSession session1 = request.getSession();
	session1.setAttribute("purchase_id", purchase_id);
	session1.setAttribute("date_time", date_time);
	session1.setAttribute("owner_name", owner_name);
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
					<%-- <a Class ="button" href="${pageContext.request.contextPath}/PurchaseMainController?action=purchaseMainList">Return</a></td> --%>
					<a Class ="button" href="${pageContext.request.contextPath}/jsp/order/purchaseMain.jsp">Return</a></td>
				</tr>
	</table>
	</div>
</div><!-- mcontent -->
	
</div><!-- main -->
	
</body>
</html>