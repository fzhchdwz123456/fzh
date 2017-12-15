<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类信息</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	<form:form id="inputForm" modelAttribute="goodsType" action="${ctx}/goodsType/saveObj" method="post" class="form-horizontal">
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">分类名称:</label>
			<div class="controls">
				<form:input path="tName" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态:</label>
			<div class="controls">
				有效<input checked="checked" name="status" value="1" type="radio"  maxlength="50" class="required"/>
	    	            无效<input name="status" value="0" type="radio"  maxlength="50" class="required" />
			</div>
		</div>
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>