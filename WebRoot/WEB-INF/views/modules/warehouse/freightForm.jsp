<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>仓库管理</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	
	<form:form id="inputForm" modelAttribute="freight" action="${ctx}/freight/saveObj" method="post" class="form-horizontal">
		<form:hidden path="freightId"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="freightId"><font color="red">运费模板编号:</font></label>
			<div class="controls">
				${freight.freightId}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="freightName">运费模板名称:</label>
			<div class="controls">
				<form:input path="freightName" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="wName">仓库名称:</label>
			<div class="controls">
				<select name="wName" id="wName" >
					<c:forEach var="warehouse" items="${warehouseList}" >
						<option value="${warehouse.wName }" <c:if test="${warehouse.wName eq freight.wName}">selected="selected"</c:if>>
							${warehouse.wName }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="destinationPort">目的港:</label>
			<div class="controls">
				<form:input path="destinationPort" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="firstheavy">首重价格:</label>
			<div class="controls">
				<form:input path="firstheavy" onkeyup="value=value.replace(/[^\d.]/g,'')"  htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="overweight">每超重1Kg价格:</label>
			<div class="controls">
				<form:input path="overweight" onkeyup="value=value.replace(/[^\d.]/g,'')" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		
	
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
