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
<link rel="stylesheet" type="text/css"
	href="<c:url value='/static/datatables/css/dataTables.bootstrap.min.css'/>">


<script type="text/javascript"
	src="<c:url value='/static/jquery/js/jquery-2.0.3.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/datatables/js/jquery.dataTables.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/datatables/js/dataTables.bootstrap.min.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/static/bootstrap/js/bootstrap.min.js'/>"></script>

</head>
<body>
<div id="content" style="display:none;">
	<button type="button" id="addUser" class="btn btn-primary btn-sm"
		data-toggle="modal" data-target="#myModal">增加用户</button>  
		<button type="button" class="btn btn-primary btn-sm"
		data-toggle="modal" id="updateUser" data-target="#myModal" style='display:none;'>修改用户</button>
	<table id="claz" class="display" cellspacing="0">
		<thead>
			<tr>
				<th>用户名</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${users}" var="user">
				<tr>
					<td>${user.name}</td>
					<td><a
						data-href="<c:url value='/user/del.html?id=${user.id}'/>"
						onclick="del(this);">删除</a> <a data-href="${user.id}" onclick="update(this);">修改</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>


	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel"></h4>
				</div>
				<div class="modal-body">
				<form id="saveForm">
				<table>
				<tbody>
				<tr>
				<td>
				<input type="hidden" name="id" />
				</td>
				</tr>
				<tr>
				<td>
				用户名:  <input type="text" name="name" />
				</td>
				</tr>
				</tbody>
				</table>
				</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">返回</button>
					<button type="button" class="btn btn-primary" id="addBtn"
						data-dismiss="modal">保存</button>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">


function del(obj){
	var clickRow = $(obj).parents('tr')[0];
	var boo=window.confirm("确定删除吗?");
	if(boo){
	$.ajax({
		url:$(obj).attr("data-href"),
		dataType:"text",
		type:"POST",
		success:function(data){
			$(clickRow).addClass('selected');
			tab.row('.selected').remove().draw( false );
			
		}
	});
	}
}
function update(obj){
	var updateRow = $(obj).parents('tr')[0];
	$(updateRow).addClass('update');
	var rowData = tab.row( updateRow ).data();
	var nm = rowData.name;
	document.getElementsByName('name')[0].value=nm;
	document.getElementsByName('id')[0].value=$(obj).attr("data-href");
	$('#updateUser').click();
}
$(function() {
	tab = $('#claz').DataTable({
		"stateSave": "true",
		"sPaginationType" : "full_numbers",
		"oLanguage" : {
			"sLengthMenu" : "每页显示 _MENU_ 条记录",
			"sZeroRecords" : "抱歉， 没有找到",
			"sInfo" : "从 _START_ 到 _END_ /共 _TOTAL_ 条数据",
			"sInfoEmpty" : "没有数据",
			"sInfoFiltered" : "(从 _MAX_ 条数据中检索)",
			"sZeroRecords" : "没有检索到数据",
			"sSearch" : "名称:",
			"oPaginate" : {
				"sFirst" : "首页",
				"sPrevious" : "前一页",
				"sNext" : "后一页",
				"sLast" : "尾页"
			}
		},
		"columns": [
	        {data: "name"},
	        {data: "option"}
	        ]
	});
	
	$('#content').css('display','block');
	
	$('#addUser').click(function(){
		$('#myModalLabel').text('增加用户');
	});
	$('#updateUser').click(function(){
		$('#myModalLabel').text('修改用户');
	});
//删除班级
	$(document).on('click','.deleteBtn',function(){
		var clickRow = $(this).parents('tr')[0];
		var boo=window.confirm("确定删除吗?");
		if(boo){
		$.ajax({
			url:$(this).attr("data-href"),
			dataType:"text",
			type:"POST",
			success:function(data){
				$(clickRow).addClass('selected');
				tab.row('.selected').remove().draw( false );
				
			}
		});
		}
	});	
	//添加班级
	$('#addBtn').click(function(){
		var formData=$("#saveForm").serialize();
		if($('#myModalLabel').text='修改用户'){
			var updateRow = $('.update')[0];
			var rowData = tab.row( updateRow ).data();
			var url = "<c:url value='/user/update.html'/>";
			$.ajax({
				url:url,
				dataType:"text",	
				data:formData,
				type:"POST",
				success:function(data){
					data = eval("("+data+")");
					//将json解析
					rowData.name=data.name;
					tab.row(updateRow).data(rowData).draw();					
				}
			});
		}
		else{
		var url = "<c:url value='/user/add.html'/>";
	$.ajax({
		url:url,
		dataType:"text",	
		data:formData,
		type:"POST",
		success:function(data){
			data = eval("("+data+")");
			//将json解析
			tab.row.add([
				data.name,
				"<a onclick='del(this);' data-href='<c:url value='/user/del.html?id=' />"+data.id+"'>删除  </a><a data-href='"+data.id+"' onlick='update(this);'>修改</a>"
			]).draw();
			$('#newRow').attr("data-href","<c:url value='/user/del.html?id=' />"+data.id);					
		}
	});
		}
});
});
</script>
</html>