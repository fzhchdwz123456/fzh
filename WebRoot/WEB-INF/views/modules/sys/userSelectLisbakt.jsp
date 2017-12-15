<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>选择用户</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("input[name=id]").each(function(){
				var userSelect = null;
				if (top.mainFrame.cmsMainFrame){
					userSelect = top.mainFrame.cmsMainFrame.userSelect;
				}else{
					userSelect = top.mainFrame.userSelect;
				}
				for (var i=0; i<userSelect.length; i++){
					if (userSelect[i][0]==$(this).val()){
						this.checked = true;
					}
				}
				$(this).click(function(){
					var id = $(this).val(), title = $(this).attr("title");
					if (top.mainFrame.cmsMainFrame){
						top.mainFrame.cmsMainFrame.userSelectAddOrDel(id, title);
					}else{
						top.mainFrame.userSelectAddOrDel(id, title);
					}
				});
			});
		});
		function view(href){
			top.$.jBox.open('iframe:'+href,'查看文章',$(top.document).width()-220,$(top.document).height()-120,{
				buttons:{"关闭":true},
				loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
					$(".nav,.form-actions,[class=btn]", h.find("iframe").contents()).hide();
				}
			});
			return false;
		}
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<div style="margin:10px;">
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/selectList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>姓名：</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<label>工号：</label><form:input path="no" htmlEscape="false" maxlength="50" class="input-small"/>&nbsp;
		<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>&nbsp;&nbsp;
	</form:form>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>选择</th>
					<th>姓名</th>
					<th>工号</th>
					<th>电话</th>
					<th>手机</th>
					<th>用户类型</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${page.list}" var="user">
					<tr>
						<td style="text-align:center;"><input type="checkbox"
							name="id" value="${user.id}" title="${user.name}" /></td>
						<td>${user.name}</td>
						<td>${user.no}</td>
						<td>${user.phone}</td>
						<td>${user.mobile}</td>
						<td>${user.userType}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<div class="pagination">${page}</div>
	</div>
</body>
</html>