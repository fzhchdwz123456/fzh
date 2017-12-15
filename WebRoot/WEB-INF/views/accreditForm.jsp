<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>系统授权管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#inputForm").validate();
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/bus/accredit/">系统授权列表</a></li>
		<li class="active"><a href="${ctx}/bus/accredit/form?id=${accredit.id}">系统授权<shiro:hasPermission name="bus:accredit:edit">${not empty accredit.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="bus:accredit:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	
	<form:form id="inputForm" modelAttribute="accredit" action="${ctx}/bus/accredit/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<tags:message content="${message}"/>
		<div class="control-group">
			<label class="control-label" for="code"><font color="red">* 授权码:</font></label>
			<div class="controls">
				<form:input path="code" htmlEscape="false" maxlength="200" class="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="customer">客户:</label>
			<div class="controls">
				<form:input path="customer" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="startDate">起始时间:</label>
			<div class="controls">
				<input id="startDate" name="startDate" type="text" readonly="readonly" maxlength="20"
				class="input-small Wdate required" value="<fmt:formatDate value="${accredit.startDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="endDate">结束时间:</label>
			<div class="controls">
				<input id="endDate" name="endDate" type="text" readonly="readonly" maxlength="20"
				class="input-small Wdate required" value="<fmt:formatDate value="${accredit.endDate}" pattern="yyyy-MM-dd"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="bus:accredit:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="授 权"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
