<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库管理</title>
	<meta name="decorator" content="default"/>
	
	<script type="text/javascript">
		function resetForm(){
			document.getElementById("warehouseId").value="";
			document.getElementById("warehouseName").value="";
		}
	</script>
</head>
<body>
	
	<form:form id="searchForm" modelAttribute="warehouseVo" action="${ctx}/warehouse/getList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>仓库编号：</label><form:input id="warehouseId" path="wId" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>仓库名称：</label><form:input id="warehouseName" path="wName" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<input class="btn"  type="button" value="重置" onclick = "resetForm()" />
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>仓库编号</th>
				<th>仓库名称</th>
				<th>包含商品数量</th>
				<th>操作</th>
				
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${warehousePage.list}" var="warehouse" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${warehouse.wId}</td>
				<td>${warehouse.wName}</td>
				<td>${warehouse.totalNumber}</td>
				<td>
    				<a href="${ctx}/warehouse/getObj?wId=${warehouse.wId}&code=1">查看</a>
					<a href="${ctx}/warehouse/getObj?wId=${warehouse.wId}&code=0">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
