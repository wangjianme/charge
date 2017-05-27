<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<style>
</style>
</head>
<body>
<div id='content' style='display:none;'>
		<p>来源信息表</p>
		<button type="button" id="a" class="btn btn-primary btn-sm"
			data-toggle="modal" data-target="#myModal">增加</button>
			<button type="button" id="b" class="btn btn-primary btn-sm"
			data-toggle="modal" data-target="#myModal" style="display:none;">修改</button>

		<table id="tb" class="display" cellspacing="0">

			<thead>
				<tr>
					<th>来源名称</th>

					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${source}" var="source">
					<tr>
						<td>${source.name}</td>

						<td><a
							data-href="<c:url value='/source/delete.html?id=${source.id}'/>"
							onclick="del(this)";>删除</a>
							 <a data-href="${source.id}" onclick="update(this);">修改</a>
							 </td>

					</tr>

				</c:forEach>
			</tbody>

		</table>
</div>

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
						<h4 class="modal-title" id="myModalLabel">添加信息管理</h4>
					</div>
					<div class="modal-body">
						<form id="saveForm">
							<table align="center">
								<thead>
									<tr>
										<th style="font-size: 15px">来源信息:<input type="text"
											name="name" />
											<input type="hidden" name="id">
										</th>
									</tr>
								</thead>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="addBtn"
							data-dismiss="modal">保存</button>
					</div>
				</div>
			</div>
		</div>

</body>
<script type="text/javascript">

function del(obj) {
	var clickRow = $(obj).parents('tr')[0];
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
}
function update(obj) {
	var updateRow = $(obj).parents('tr')[0];
	var rowData = tab.row(updateRow).data();
	
	//给行加个标记
	$(updateRow).addClass('update');
	
	var nm = rowData.name;
	document.getElementsByName('name')[0].value = nm;
	document.getElementsByName('id')[0].value = $(obj).attr("data-href");
	$('#b').click();
}
$(function() {
tab = $('#tb').DataTable({
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
	//给咧取名字
	"columns": [
		{data: "name"},
		{data: "option"}
	]
});
$('#content').css('display','block');
//删除信息
//给所有的包扩未来生成的全部添加事件

$('#a').click(function(){
	$('#myModalLabel').text('增加来源');
});
$('#b').click(function(){
	$('#myModalLabel').text('修改来源');
});
//添加来源信息
$('#addBtn').click(function(){
	//获取表单所有数据
	 var formData=$("#saveForm").serialize();
	//如果是修改就执行修改
	if($('#myModalLabel').text='修改来源'){
		//获取加了标记的那一行
		var updateRow = $('.update')[0];
		//获取此行的数据
		var rowData = tab.row(updateRow).data();
		//数据库里改
		var url = "<c:url value='/source/update.html' />";
		
		$.ajax({
				url:url,
				dataType:"text",	
				data:formData,
				type:"POST",
				//成功的话数据库以增加
				success:function(data){
					//转为json
					data = eval("("+data+")");
					//将json解析
					
					//从页面上改
					rowData.name = data.name;
					//使数据生效                                                   新数据               生效
					tab.row(updateRow).data(rowData).draw();
				}
				});
		
		//修改完之后删除属性
		$(updateRow).removeClass();
		
	}else{
	//获取表单里所有数据data
	var url = "<c:url value='/source/add.html'/>";
$.ajax({
	url:url,
	dataType:"text",	
	data:formData,
	type:"POST",
	//成功的话数据库以增加
	success:function(data){
		//转为json
		data = eval("("+data+")");
		//将json解析
		tab.row.add([
			data.name,
			"<a onclick='del(this);' data-href='<c:url value='/source/delete.html?id=' />"+data.id+"'>删除 </a><a onclick='update(this);'>修改</a>"
		]).draw();
	}
	});
	
  }
});
	});
</script>
</html>