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
	<div id="student_div" style="display: none;">

		<p>学生信息管理表</p>
		<button type="button" class="btn btn-primary btn-sm"
			data-toggle="modal" data-target="#myModal">增加</button>

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
						<h4 class="modal-title" id="myModalLabel">请填写学生信息</h4>
					</div>
					<div class="modal-body">
						<form id="saveForm">
							<table align="center">
								<thead>
									<tr>
										<th>学号 :</th>
										<th><input type="text" name="stud_id"  />
										</th>
									</tr>
									<tr>
										<th>姓名 :</th>
										<th><input type="text" name="stud_name"  /></th>
									</tr>
									<tr>
										<th>性别 :</th>
										<th><input value="1" type="radio" name="stud_gender" />男
											<input value="0" type="radio" name="stud_gender" />女</th>
									</tr>
									<tr>
										<th>出生年月 :</th>
										<th><input type="text" name="stud_birth" /></th>
									</tr>
									<tr>
										<th>学历 :</th>
										<th><input type="text" name="stud_education" /></th>
									</tr>
									<tr>
										<th>专业 :</th>
										<th><input type="text" name="stud_major" /></th>
									</tr>
									<tr>
										<th>毕业时间 :</th>
										<th><input type="text" name="stud_graduationdate" /></th>
									</tr>
									<tr>
										<th>简历文件 :</th>
										<th><input type="text" name="stud_resume" /></th>
									</tr>
									<tr>
										<th>班级 :</th>
										<th><input type="text" name="stud_class" /></th>
									</tr>
									<tr>
										<th>来源 :</th>
										<th><input type="text" name="stud_from" /></th>
									</tr>
									<tr>
										<th>学费 :</th>
										<th><input type="text" name="stud_tuition"  /></th>
									</tr>
									<tr>
										<th>头像 :</th>
										<th><input type="text" name="stud_picture" /></th>
									</tr>
								</thead>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary" id="insertBtn"
							data-dismiss="modal">保存</button>
					</div>
				</div>
			</div>
		</div>

		<table id="student_table" class="display" cellspacing="0">
			<thead>
				<tr>
					<th>学号ID</th>
					<th>姓名Name</th>
					<th>性别Gender</th>
					<th>出生年月Birth</th>
					<th>学历Education</th>
					<th>专业Major</th>
					<th>毕业时间GraduationDate</th>
					<th>简历Resume</th>
					<th>班级Class</th>
					<th>来源From</th>
					<th>学费Tuition</th>
					<th>照片Picture</th>
					<th>操作Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stud}" var="stud">
					<tr>
						<td>${stud.stud_id}</td>
						<td>${stud.stud_name}</td>
						<td>${stud.stud_gender}</td>
						<td>${stud.stud_birth}</td>
						<td>${stud.stud_education}</td>
						<td>${stud.stud_major}</td>
						<td>${stud.stud_graduationdate}</td>
						<td>${stud.stud_resume}</td>
						<td>${stud.stud_class}</td>
						<td>${stud.stud_from}</td>
						<td>${stud.stud_tuition}</td>
						<td>${stud.stud_picture}</td>
						<td><a
							data-href="<c:url value='/student/delete.html?uuid=${stud.stud_uuid}'/>"
							onclick="del(this);">删除</a> <a href="<c:url value=''/>">修改</a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>

	</div>
</body>
<script type="text/javascript">
	//删除
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
		tab = $('#student_table').DataTable({
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
		$('#student_div').css('display', 'block');

		//添加
		$('#insertBtn')
				.click(
						function() {
							//
							var formData = $("#saveForm").serialize();
							var url = "<c:url value='/student/insert.html'/>";
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
																	data.stud_id,
																	data.stud_name,
																	data.stud_gender.value,
																	data.stud_birth,
																	data.stud_education,
																	data.stud_major,
																	data.stud_graduationdate,
																	data.stud_resume,
																	data.stud_class,
																	data.stud_from,
																	data.stud_tuition,
																	data.stud_picture,
																	"<a href='<c:url value='/student/delete.html?uuid="
																			+ data.uuid
																			+ "'/>' onclick='del(this);'>删除</a>"
																			+ "<a href=''>修改</a>" ])
													.draw();
										}
									});
						});

	});
</script>

</html>