<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>分类管理</title>
	<meta name="decorator" content="default"/>
	
	
	
</head>
<body>
	
	<form:form id="inputForm" modelAttribute="goodsType" action="${ctx}/goodsType/saveObj" method="post" class="form-horizontal">
		<form:hidden path="tId"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="tId">分类编号:</label>
			<div class="controls">
                ${goodsType.tId}
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="tName">分类名称:</label>
			<div class="controls">
                <form:input path="tName" htmlEscape="false" maxlength="50" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="status">状态:</label>
			<div class="controls">
			 	
				有效<input id="able" name="status" value="1" type="radio"  maxlength="50" class="required" <c:if test="${goodsType.status eq '1'}">checked="checked"</c:if> />
	    	            无效<input id="unable" name="status" value="0" type="radio"  maxlength="50" class="required" <c:if test="${goodsType.status eq '0'}">checked="checked"</c:if>/>
			</div>
		</div>
		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a class="btn btn-primary" href="${ctx}/goodsType/deleteObj?tId=${goodsType.tId}">删除</a>
		</div>
	</form:form>
</body>
</html>