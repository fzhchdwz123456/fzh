<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加商品</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	
	<form:form id="inputForm"  modelAttribute="standard" action="${ctx}/standard/saveStandard" method="post" class="form-horizontal" enctype="multipart/form-data">
		<form:hidden path="gId"/>
		<tags:message content="${message}"/>
		

		<div class="control-group">
			<label class="control-label" for="standard">规格:</label>
			<div class="controls">
				<form:input path="standard" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="color">颜色:</label>
			<div class="controls">
				<form:input path="color" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="store">库存:</label>
			<div class="controls">
				<form:input path="store" htmlEscape="false" maxlength="200"/>
			</div>
		</div>

		<div class="control-group">
			<label class="control-label" for="greatImg">大图:</label>
			<div class="controls">
				<input type="file" id="great" name="great">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="middleImg">中图:</label>
			<div class="controls">
				<input type="file" id="middle" name="middle">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="smallImg">小图:</label>
			<div class="controls">
				<input type="file" id="small" name="small">
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="otherImg">其他图:</label>
			<div class="controls">
				<input type="file" id="other" name="other">
			</div>
		</div>
		
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="下一步"/>&nbsp;
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>