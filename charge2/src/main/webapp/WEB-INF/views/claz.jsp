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


</head>
<body>
	<div id="aaa" style="display: none;">
		<button type="button" class="btn btn-primary btn-sm"
			data-toggle="modal" data-target="#myModal">增加班级</button>
		<table id="claz" class="display" cellspacing="0">
			<thead>
				<tr>
					<th>班级</th>
					<th>人数</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${clazs}" var="claz">
					<tr>
						<td><a
							data-href="<c:url value='/claz/query_s.html?id=${claz.id}&name=${claz.name}'/>"
							onclick="change(this);">${claz.name}</a></td>
						<td>${claz.row}</td>
						<td><a
							data-href="<c:url value='/claz/del.html?id=${claz.id}'/>"
							onclick="del(this);">删除</a> <a href="<c:url value=''/>">修改</a></td>
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
						<h4 class="modal-title" id="myModalLabel">添加班级信息</h4>
					</div>
					<div class="modal-body">
						<form id="saveForm">
							班级:<input type="text" name="name" />
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
	//跳转到学生信息
	function change(obj) {
		$('#flushDIV').load($(obj).attr("data-href"));
	}
	//删除班级
	function del(obj) {
		var clickRow = $(obj).parents('tr')[0];
		var boo = window.confirm("确定删除吗?");
		if (boo) {
			$.ajax({
				url : $(obj).attr("data-href"),
				dataType : "text",
				type : "POST",
				success : function(data) {
					$(clickRow).addClass('selected');
					tab.row('.selected').remove().draw(false);

				}
			});
		}
	}
	$(function() {
		tab = $('#claz').DataTable({
			"stateSave" : "true",
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
			}
		});
		$('#aaa').css('display', 'block');

		//添加班级	
		$('#addBtn')
				.click(
						function() {
							var formData = $("#saveForm").serialize();
							var url = "<c:url value='/claz/add.html'/>";
							$
									.ajax({
										url : url,
										dataType : "text",
										data : formData,
										type : "POST",
										success : function(data) {
											data = eval("(" + data + ")");
											//将json解析
											tab.row
													.add(
															[
																	"<a onclick='change(this);' data-href='<c:url value='/claz/query_s.html' />"
																			+ "?id="
																			+ data.id
																			+ "&name="
																			+ data.name
																			+ "'>"
																			+ data.name
																			+ "</a>",
																	0,
																	"<a onclick='del(this);' data-href='<c:url value='/claz/del.html?id=' />"
																			+ data.id
																			+ "'>删除 </a><a>修改</a>" ])
													.draw();
										}
									});
						});

	});
</script>
</html>