<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>空白页</title>

<!-- basic styles -->

<link href="<c:url value='/static/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet" />
<link rel="stylesheet" 
	href="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.css"/>
<link rel="stylesheet"
	href="<c:url value='/static/bootstrap/css/font-awesome.min.css'/>" />



<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />



<link rel="stylesheet"
	href="<c:url value='/static/bootstrap/css/ace.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/static/bootstrap/css/ace-rtl.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/static/bootstrap/css/ace-skins.min.csss'/>" />


</head>

<body>
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> 卓派大数据
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <span class="user-info"> <small>欢迎,</small>
								zzq
						</span> <i class="icon-caret-down"></i>
					</a> <!-- /.ace-nav -->
				</li></ul>
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>
	</div>
	<div class="main-container-inner">
		<a class="menu-toggler" id="menu-toggler" href="#"> <span
			class="menu-text"></span>
		</a>

		<div class="sidebar" id="sidebar">
			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'fixed')
				} catch (e) {
				}
			</script>



			<ul class="nav nav-list">

				<li class="active"><a href="#"> <i class="icon-list"></i> <span
						class="menu-text"> 菜单栏 </span>
				</a></li>

				<c:forEach items="${menus['father']}" var="fatherMenu">
					<c:set var="fatherId" value="${fatherMenu.id }" />
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-tag"></i> <span class="menu-text">${fatherMenu.text}
						</span> <b class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<c:forEach items="${menus[fatherId]}" var="childMenu">
								<li><a data-href="${childMenu.url }" id="${childMenu.id }"
									href="#" class="child"> <i class="icon-double-angle-right"></i>
										${childMenu.text}
								</a></li>
							</c:forEach>
						</ul></li>
				</c:forEach>

			</ul>
			<!-- /.nav-list -->

			<div class="sidebar-collapse" id="sidebar-collapse">
				<i class="icon-double-angle-left"
					data-icon1="icon-double-angle-left"
					data-icon2="icon-double-angle-right"></i>
			</div>

			<script type="text/javascript">
				try {
					ace.settings.check('sidebar', 'collapsed')
				} catch (e) {
				}
			</script>
		</div>

		<div class="main-content">
			<div class="breadcrumbs" id="breadcrumbs">
				<script type="text/javascript">
				try {
					ace.settings.check('breadcrumbs', 'fixed');
				} catch (e) {
				}
				</script>
				<ul class="breadcrumb">
					<li><i class="icon-home home-icon"></i> <a href="#">Home </a></li>
					<li class="active">一级菜单</li>
					<li class="active">二级菜单</li>
				</ul>
			</div>

			<div class="page-content">
				<div class="row">
					<div class="col-xs-12" id="flushDIV">
						<!-- PAGE CONTENT BEGINS -->

						<!-- PAGE CONTENT ENDS -->
					</div>
					<!-- /.col -->
				</div>
				<!-- /.row -->
			</div>
			<!-- /.page-content -->
		</div>
		<!-- /.main-content -->

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->

	<!--[if !IE]> -->

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>


	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="<c:url value='/static/bootstrap/js/bootstrap.min.js'/>"></script>
	<script
		src="<c:url value='/static/bootstrap/js/typeahead-bs2.min.js'/>"></script>


	<script src="<c:url value='/static/bootstrap/js/ace-elements.min.js'/>"></script>
	<script src="<c:url value='/static/bootstrap/js/ace.min.js'/>"></script>
	<script  type="text/javascript"
	src="http://cdn.datatables.net/plug-ins/28e7751dbec/integration/bootstrap/3/dataTables.bootstrap.js"></script>
	

	<!-- inline scripts related to this page -->
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			charset='UTF-8' type="text/javascript"></script>
	</div>
	</body>
	<script type="text/javascript">
	$(function() {
		$(".child").click(function() {
			$('#flushDIV').html("");
			var href = $(this).attr("data-href");
			$('#flushDIV').load("<c:url value='/"+href+"'/>");
		});
	});
	</script>
</html>
