<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统授权管理</title>
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
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/bus/accredit/">系统授权列表</a></li>
		<shiro:hasPermission name="bus:accredit:edit"><li><a href="${ctx}/bus/accredit/form">系统授权添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="accredit" action="${ctx}/bus/accredit/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>授权码：</label><form:input path="code" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>客户 ：</label><form:input path="customer" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>授权码</th>
				<th>客户</th>
				<th>起始时间</th>
				<th>结束时间</th>
				<th>授权人</th>
				<th>授权时间</th>
				<shiro:hasPermission name="bus:accredit:edit">
					<th>操作</th>
				</shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="accredit" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${accredit.code}</td>
				<td>${accredit.customer}</td>
				<td>${accredit.startDate}</td>
				<td>${accredit.endDate}</td>
				<td>${accredit.operator}</td>
				<td>${accredit.createDate}</td>
				<shiro:hasPermission name="bus:accredit:edit"><td>
    				<a href="${ctx}static/upload/${accredit.url}">下载</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
