<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/datatables/css/jquery.dataTables.min.css'/>">

<script type="text/javascript"
	src="<c:url value='/static/jquery/js/jquery-2.0.3.min.js'/>"></script>

<script type="text/javascript"
	src="<c:url value='/static/datatables/js/jquery.dataTables.min.js'/>"></script>
</head>
<body>
	<p><h3>${students['clazName']}</h3></p>
	<a data-href='<c:url value='/claz/query_c.html' />' id='back'>返回</a>
	<hr>
	<table id="student_table" class="display" cellspacing="0">
		<thead>
			<tr>
				<th>姓名</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${students['studs']}" var="stud">
				<tr>
					<th>${stud.stud_name}</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
<script type="text/javascript">
$(function() {
var tab = $('#student_table').DataTable();
$('#back').click(function(){
	$('#flushDIV').load($(this).attr("data-href"));
});
});

</script>
</html>