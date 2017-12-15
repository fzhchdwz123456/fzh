<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库管理</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	
	<form:form id="inputForm" modelAttribute="warehouse" action="${ctx}/warehouse/saveObj" method="post" class="form-horizontal">
		<form:hidden path="wId"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="wId"><font color="red">仓库编号:</font></label>
			<div class="controls">
				${warehouse.wId}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="wName">仓库名称:</label>
			<div class="controls">
				<form:input path="wName" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
	
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-primary" href="${ctx}/warehouse/deleteObj?wId=${warehouse.wId}">删除</a>
		</div>
	</form:form>
</body>
</html>
