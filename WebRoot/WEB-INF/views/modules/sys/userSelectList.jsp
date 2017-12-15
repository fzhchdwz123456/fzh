<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户选择</title>
	<meta name="decorator" content="default"/>
	
	<script type="text/javascript">
		$(document).ready(function() {

		});
		
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
	
</head>
<body>
	<div style="margin:10px;">
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/selectList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>姓名：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<label>工号：</label><form:input path="no" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th style="text-align:center;">选择</th>
					<th>姓名</th>
					<th>工号</th>
					<th>电话</th>
					<th>手机</th>
					<th>用户类型</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="user">
					<tr>
						<td style="text-align:center;"><input type="checkbox"
							name="id" value="${user.id}" title="${user.name}" /></td>
						<td>${user.name}</td>
						<td>${user.no}</td>
						<td>${user.phone}</td>
						<td>${user.mobile}</td>
						<td>${fns:getDictLabel(user.userType, 'sys_user_type', '无')}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="pagination">${page}</div>
	</div>
</body>
</html>