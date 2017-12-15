<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加运费</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	<form:form id="inputForm" modelAttribute="freight" action="${ctx}/freight/saveObj" method="post" class="form-horizontal">
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">运费模板名称:</label>
			<div class="controls">
				<form:input path="freightName" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">仓库名称:</label>
			<div class="controls">
				<select name="wName" id="wName" >
					<option value="">--请选择--</option>
					<c:forEach var="warehouse" items="${warehouseList}" >
						<option value="${warehouse.wName }">${warehouse.wName }</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">目的港:</label>
			<div class="controls">
				<form:input path="destinationPort" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">首重价格:</label>
			<div class="controls">
				<form:input path="firstheavy" onkeyup="value=value.replace(/[^\d.]/g,'')" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label">每超重1KG价格:</label>
			<div class="controls">
				<form:input path="overweight" onkeyup="value=value.replace(/[^\d.]/g,'')" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		
		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>