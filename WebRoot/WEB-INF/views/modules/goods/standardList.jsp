<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>添加规格图片</title>
	<meta name="decorator" content="default"/>
	
</head>
<body>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>商品编号</th>
					<th>商品名称</th>
					<th>商品标题</th>
					<th>商品分类</th>
					<th>商品品牌</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${goods.gId}</td>
					<td>${goods.name}</td>
					<td>${goods.title}</td>
					<td>${goods.goodsType.tName}</td>
					<td>${goods.brand.bName}</td>
				</tr>
			</tbody>
	</table>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th>规格</th>
					<th>颜色</th>
					<th>库存</th>
					<th>图片</th>
					<th>中图</th>
					<th>小图</th>
					<th>其他图</th>
					<th>修改</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${goods.standardList}" var="standard" varStatus="s">
					<tr>
						<td>${standard.standard}</td>
						<td>${standard.color}</td>
						<td>${standard.store}</td>
						<td><img src="${standard.goodsImg.greatImgUrl}" alt="图片未找到" /></td>
						<td><img src="${standard.goodsImg.middleImgUrl}" alt="图片未找到" /></td>
						<td><img src="${standard.goodsImg.smallImgUrl}" alt="图片未找到" /></td>
						<td><img src="${standard.goodsImg.otherImgUrl}" alt="图片未找到" /></td>
						<td>
							<a href="${ctx}/standard/getObj?sId=${standard.sId}">修改</a>
							<a href="${ctx}/standard/deleteObj?sId=${standard.sId}&gId=${standard.gId}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
	</table>
	<div class="form-actions">
		<a class="btn btn-primary" href="${ctx}/standard/addStandard?gId=${goods.gId}">添加规格</a>&nbsp;
		<a class="btn" href="${ctx}/goods/getList">返回商品列表</a>
	</div>

</body>
</html>