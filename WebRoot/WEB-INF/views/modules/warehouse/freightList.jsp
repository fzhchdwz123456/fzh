<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>运费列表</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
	
		function resetForm(){
			document.getElementById("searchid").value="";
			document.getElementById("searchName").value="";
			document.getElementById("searchwName").value="";
			document.getElementById("searchdestinationPort").value="";
		}
	
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

	<form:form id="searchForm" modelAttribute="freightVo" action="${ctx}/freight/getList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>模板编号：</label><form:input id="searchid" path="freightId" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>模板名称：</label><form:input id="searchName" path="freightName" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>仓库名称：</label><form:input id="searchwName" path="wName" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>目的港：</label><form:input id="searchdestinationPort" path="destinationPort" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<input class="btn"  type="button" value="重置" onclick = "resetForm()" />
	</form:form>
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>运费模板编号</th>
				<th>运费模板名称</th>
				<th>仓库名称</th>
				<th>目的港</th>
				<th>首重价格</th>
				<th>每超重1Kg价格</th>
					<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${freightPage.list}" var="freight" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${freight.freightId}</td>
				<td>${freight.freightName}</td>
				<td>${freight.wName}</td>
				<td>${freight.destinationPort}</td>
				<td>${freight.firstheavy}</td>
				<td>${freight.overweight}</td>
				<td>
					<a href="${ctx}/freight/getObj?freightId=${freight.freightId}&code=0">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
