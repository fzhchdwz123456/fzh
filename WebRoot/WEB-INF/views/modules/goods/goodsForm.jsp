<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品详情</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/ckeditor/ckeditor.js"></script>
</head>
<body>
	
	<form:form id="inputForm" modelAttribute="goods" action="${ctx}/goods/updateGoods" method="post" class="form-horizontal">
		<form:hidden path="gId"/>
		<tags:message content="${message}"/>
		

		<div class="control-group">
			<label class="control-label" for="tId"><font color="red">商品分类:</font></label>
			<div class="controls">
				<select name="tId" id="tId" >
					<c:forEach var="goodsType" items="${goodsTypesList}" >
						<option value="${goodsType.tId }" <c:if test="${goodsType.tId eq goods.tId}">selected="selected"</c:if>>
							${goodsType.tName }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="bId"><font color="red">商品品牌:</font></label>
			<div class="controls">
				<select name="bId" id="bId" >
					<c:forEach var="brand" items="${brandsList}" >
						<option value="${brand.bId }" <c:if test="${brand.bId eq goods.bId}">selected="selected"</c:if>>
							${brand.bName }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="name"><font color="red">商品编号:</font></label>
			<div class="controls">
				${goods.gId }
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="name"><font color="red">商品名称:</font></label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100"/>&nbsp;(海关申报名称)
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="title"><font color="red">商品标题:</font></label>
			<div class="controls">
				<form:input path="title" htmlEscape="false" maxlength="100"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for=unit><font color="red">常用单位:</font></label>
			<div class="controls">
				<form:input path="unit" htmlEscape="false" maxlength="100"/> &nbsp;例如：罐，袋，箱
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="origin"><font color="red">产地:</font></label>
			<div class="controls">
				<form:input path="origin" htmlEscape="false" maxlength="100"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="wId"><font color="red">所属仓库:</font></label>
			<div class="controls">
				<select name="wId" id="wId" >
					<c:forEach var="warehouse" items="${warehousesList}" >
						<option value="${warehouse.wId }" <c:if test="${warehouse.wId eq goods.wId}">selected="selected"</c:if>>
							${warehouse.wName }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="freightId"><font color="red">运费模板:</font></label>
			<div class="controls">
				<select name="freightId" id="freightId" >
					<c:forEach var="freight" items="${freightList}" >
						<option value="${freight.freightId }" <c:if test="${freight.freightId eq goods.freightId}">selected="selected"</c:if>>
							${freight.freightName }
						</option>
					</c:forEach>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="weight"><font color="red">重量:</font></label>
			<div class="controls">
				<form:input onkeyup="value=value.replace(/[^\d.]/g,'')" path="weight" htmlEscape="false" maxlength="200"/>&nbsp;Kg
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="combination"><font color="red">是否组合:</font></label>
			<div class="controls">
				<select name="combination" id="combination" >
					<option value="1" <c:if test="${goods.combination eq '1' }">selected="selected"</c:if>>是</option>
					<option value="0" <c:if test="${goods.combination eq '0' }">selected="selected"</c:if>>否</option>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="promotionPrice"><font color="red">促销价格:</font></label>
			<div class="controls">
				<form:input path="promotionPrice" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="costPrice">成本价格:</label>
			<div class="controls">
				<form:input path="costPrice" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		
		
		<div class="control-group">
			<label class="control-label" for="referencePrice">参考价格:</label>
			<div class="controls">
				<form:input path="referencePrice" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="isRecommended">是否推荐:</label>
			<div class="controls">
				<select name="isRecommended" id="isRecommended" >
					<option value="1" <c:if test="${goods.isRecommended eq '1' }">selected="selected"</c:if>>是</option>
					<option value="0" <c:if test="${goods.isRecommended eq '0' }">selected="selected"</c:if>>否</option>
				</select>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="integral">积分:</label>
			<div class="controls">
				<form:input path="integral" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="taxRate">税率:</label>
			<div class="controls">
				<form:input path="taxRate" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="importTax">进口税:</label>
			<div class="controls">
				<form:input path="importTax" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="VAT">增值税:</label>
			<div class="controls">
				<form:input path="VAT" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="tariff">关税:</label>
			<div class="controls">
				<form:input path="tariff" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="consumerTax">消费者税:</label>
			<div class="controls">
				<form:input path="consumerTax" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="introduce">简介:</label>
			<div class="controls">
				<form:input path="introduce" htmlEscape="false" maxlength="200"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="detail">详情:</label>
			<div class="controls">
				<textarea id="detail" name="detail" class="ckeditor" ></textarea>
				<script type="text/javascript">CKEDITOR.replace('detail');</script>
			</div>
		</div>
		
		<div class="control-group">
			<label class="control-label" for="onsale"><font color="red">是否上架:</font></label>
			<div class="controls">
				上架<input name="onsale" value="1" type="radio"  maxlength="50" class="required"  <c:if test="${goods.onsale eq '1' }">checked="checked"</c:if> />
	    	            下架<input  name="onsale" value="0" type="radio"  maxlength="50" class="required" <c:if test="${goods.onsale eq '0' }">checked="checked"</c:if> />
			</div>
		</div>
		
		<div class="form-actions">
			<input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;
			<a class="btn" href="${ctx}/goods/getList">返回商品列表</a>
		</div>
	</form:form>
	
	
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
	
	
	
</body>
</html>