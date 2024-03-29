<jsp:include page="../../base.jsp"></jsp:include>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
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

		<div class="mcontent">
			<div class="titlenav">
				<ul>
					<li class="title"><a href="">Brand Enquiry</a></li>
					<li class="bread"><a href="">Dashboard > Product
							Management > Brand List > Brand Enquiry</a></li>
				</ul>
			</div>
			<br>
<div class="card">
	
	<form action="" method="post">
		<table id="example" class="display" style="width: 100%" cellspacing="10">			
			<tr>
				<td Class ="FormCellColor" colspan="2">Brand ID</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.brand_id}" /></td>
				<td Class ="FormCellColor" colspan="2">Brand Name</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.brand_name}" /></td>
			</tr>
			
			<tr>
				<td Class ="FormCellColor" colspan="2">Company ID</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.company_id}" /></td>			
				<td Class ="FormCellColor" colspan="2">Company Name</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.company_name}" /></td>
			</tr>
			
			<tr>
				<td Class ="FormCellColor" colspan="2">Product Category ID</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.product_category_id}" /></td>
				<td Class ="FormCellColor" colspan="2">Created</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.created}" /></td>
			</tr>
			
			<tr>
				<td Class ="FormCellColor" colspan="2">Generic ID</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.generic_id}" /></td>			
				<td Class ="FormCellColor" colspan="2">Generic Name</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.generic_name}" /></td>
			</tr>
			
			<tr>
				<td Class ="FormCellColor" colspan="2">Updated</td>
				<td Class ="FormInputColor" colspan="2"><c:out value="${brand.updated}" /></td>
			</tr>
		</table>
		<br>
		
		<table align="center" width="100%">
			
				<tr>
					<td><hr align=left width="100%" color=#003399><br>
						<a Class ="button" href="${pageContext.request.contextPath}/jsp/product/brand.jsp">Return</a>
					</td>
				</tr>
		</table>
	</form>
	</div>
</div><!-- mcontent -->
	
</div><!-- main -->

	<!-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ -->

</body>
</html>