<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>品牌管理</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/dialog.jsp" %>
	<style type="text/css">.sort{color:#0663A2;cursor:pointer;}</style>

	<script type="text/javascript">
		
	function resetForm(){
		document.getElementById("bidSearch").value="";
		document.getElementById("bNameSearch").value="";
	}
	
	function page(n,s){
		$("#pageNo").val(n);
		$("#pageSize").val(s);
		$("#searchForm").attr("action","${ctx}/brand/getList").submit();
    	return false;
    }
	</script>
</head>
<body>
	<form:form id="searchForm" modelAttribute="brandVo" action="${ctx}/brand/getList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>品牌编号：</label><form:input id="bidSearch" path="bId" htmlEscape="false" maxlength="50" class="input-small"/>
		<label>品牌名称：</label><form:input id="bNameSearch" path="bName" htmlEscape="false" maxlength="50" class="input-small"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
		<input class="btn"  type="button" value="重置" onclick = "resetForm()" />
	</form:form>
	
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>序号</th><th>品牌编号</th><th>品牌名称</th><th>包含商品数量</th><th>状态</th><th>操作</th></tr></thead>
		<tbody>
		<c:forEach items="${brandPage.list}" var="brand" varStatus="no">
			<tr>
				<td>${no.index+1}</td>
				<td>${brand.bId}</td>
				<td>${brand.bName}</td>
				<td>${brand.totalNumber}</td>
				<td>${brand.status}</td>
				<td>
    				<a href="${ctx}/brand/getObj?bId=${brand.bId}&code=1">查看</a>
					<a href="${ctx}/brand/getObj?bId=${brand.bId}&code=0">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>