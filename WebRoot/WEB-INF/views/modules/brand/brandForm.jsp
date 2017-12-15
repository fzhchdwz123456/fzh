<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>品牌管理</title>
	<meta name="decorator" content="default"/>
	
	
	
</head>
<body>
	
	<form:form id="inputForm" modelAttribute="brand" action="${ctx}/brand/saveObj" method="post" class="form-horizontal">
		<form:hidden path="bId"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="bId">品牌编号:</label>
			<div class="controls">
                ${brand.bId}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="bName">品牌名称:</label>
			<div class="controls">
                <form:input path="bName" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="status">状态:</label>
			<div class="controls">
			 	
				有效<input name="status" value="1" type="radio"  maxlength="50" class="required" <c:if test="${brand.status eq '1'}">checked="checked"</c:if> />
	    	            无效<input id="unable" name="status" value="0" type="radio"  maxlength="50" class="required" <c:if test="${brand.status eq '0'}">checked="checked"</c:if>/>
			</div>
		</div>
		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-primary" href="${ctx}/brand/deleteObj?bId=${brand.bId}">删除</a>
		</div>
		
	</form:form>
</body>
</html>