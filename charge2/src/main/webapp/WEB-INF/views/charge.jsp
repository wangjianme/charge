<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/datatables/css/jquery.dataTables.min.css'/>" />
<script type="text/javascript"
	src="<c:url value='/static/jquery/js/jquery-2.0.3.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/datatables/js/jquery.dataTables.min.js'/>"></script>
</style>
</head>
<body>
	<p>收费信息表</p>
	<table id="tb" class="display" cellspacing="0">
		<thead>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>交款金额</th>
				<th>交款类型</th>
				<th>交款日期</th>
				<th>编辑</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${charges}" var="charge">
				<tr>
				    <td>${charge.charge_ssid }</td>
				    <td>${charge.charge_name }</td>
					<td>${charge.charge_money}</td>
					<td>${charge.charge_type}</td>
					<td>${charge.charge_date}</td>
					<td><a
						data-href="<c:url value='/charge/del.html?charge_id=${charge.charge_id}'/>"
						class="deleteBtn">删除</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<button type="button" class="btn btn-primary btn-sm"
		data-toggle="modal" data-target="#myModal">增加</button>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">增加/修改收费信息</h4>
				</div>
				<div class="modal-body">
					<form id="f1">
						<table id="tb2" style="width: 100%; margin: 10px;">
							<tr>
								<td>学号:</td>
								<td><input type="text" name="charge_ssid" id="ssid" /></td>
							</tr>
							<tr>
								<td>姓名:</td>
								<td><input type="text" name="charge_name" id="name" /></td>
							</tr>
							<tr>
								<td>交款金额:</td>
								<td><input type="text" name="charge_money" id="money" /></td>
							</tr>
							<tr>
								<td>交款类型：</td>
								<td>
								   <input type="text" name="charge_type" id="type" />
								</td>
							</tr>
							<tr>
								<td>交款日期:</td>
								<td><input type="text" name="charge_date" id="date" /></td>
							</tr>
						</table>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="_save" class="btn btn-primary" data-dismiss="modal">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		$('#tb').DataTable({
			"stateSave" : "true",
			"sPaginationType" : "full_numbers",
			"oLanguage" : {
				"sLengthMenu" : "每页显示 _MENU_ 条记录",
				"sZeroRecords" : "抱歉， 没有找到",
				"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
				"sInfoEmpty" : "没有数据",
				"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
				"sZeroRecords" : "没有此学生信息",
				"sSearch" : "搜索:",
				"oPaginate" : {
					"sFirst" : "首页",
					"sPrevious" : "前一页",
					"sNext" : "后一页",
					"sLast" : "尾页"
				}
			}
		});
		<!--删除一行数据-->
		$('.deleteBtn').click(function() {
			var boo = window.confirm("确定删除数据?");
		    if (boo) {
			    $.ajax({
				    url : $(this).attr("data-href"),
					dataType : "text",
					type : "POST",
					success : function(data) {
						$('#flushDIV').load("<c:url value='/charge/query.html' />");
						}
					});
			    }
		});
		<!--增加数据 -->
		$('#_save').click(function () {
			var id = $('#ssid').val();
			var nm = $('#name').val();
			var mon=$('#money').val();
			var type=$("#type").val(); 
			var date = $('#date').val();
			$.ajax({
				url:"<c:url value='/charge/add.html'/>"+"?charge_ssid="+id+"&charge_name="+nm+"&charge_money="+mon+"&charge_type="+type+"&charge_date="+date,
				dataType:"text",
				type:"POST",
				success:function(data){
					$('#flushDIV').load("<c:url value='/charge/query.html' />");
				}
			});
		})
	});
</script>
</html>