<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品列表</title>
	<meta name="decorator" content="default"/>
		
	<script type="text/javascript">
	
		
	
	
		function resetForm(){
			document.getElementById("gIdSearch").value="";
			document.getElementById("nameSearch").value="";
			document.getElementById("titleSearch").value="";
			document.getElementById("originSearch").value="";
			document.getElementById("customsRecordCodeSearch").value="";
			document.getElementById("HSCode").value="";
			document.getElementById("startTax").value="0.0";
			document.getElementById("endTax").value="0.0";
			document.getElementById("bIdSearch").value="";
			document.getElementById("wIdSearch").value="";
			document.getElementById("tIdSearch").value="";
			document.getElementById("taxTypeSearch").value="";
		}
	</script>
	
</head>
<body>
	
	<form:form id="searchForm" modelAttribute="goodsVo" action="${ctx}/goods/getList" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		
		<div class="control-group">
			<label>商品编号 ：</label><form:input id="gIdSearch" path="gId" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>商品名称 ：</label><form:input id="nameSearch" path="name" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>商品标题 ：</label><form:input id="titleSearch" path="title" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>商品品牌 ：</label><select name="bId" id="bIdSearch" >
										<option value="" selected="selected">--请选择--</option>
										<c:forEach var="brand" items="${brandsList}" >
											<option value="${brand.bId }" <c:if test="${brand.bId eq goodsVo.bId}">selected="selected"</c:if>>
												${brand.bName }
											</option>
										</c:forEach>
								  </select>
		</div>
		<div>
			<label>产地 ：</label><form:input id="originSearch" path="origin" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>海关备案号 ：</label><form:input id="customsRecordCodeSearch" path="customsRecordCode" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>仓库 ：</label><select name="wId" id="wIdSearch" >
										<option value="" selected="selected">--请选择--</option>
										<c:forEach var="warehouse" items="${warehousesList}" >
											<option value="${warehouse.wId }" <c:if test="${warehouse.wId eq goodsVo.wId}">selected="selected"</c:if>>
												${warehouse.wName }
											</option>
										</c:forEach>
								  </select>
			<label>商品分类 ：</label><select name="tId" id="tIdSearch" >
										<option value="" selected="selected">--请选择--</option>
										<c:forEach var="goodsType" items="${goodsTypesList}" >
											<option value="${goodsType.tId }"<c:if test="${goodsType.tId eq goodsVo.tId}">selected="selected"</c:if>>
												${goodsType.tName }
											</option>
										</c:forEach>
								  </select>
								  
		</div>
		<div>
			<label>税则号 ：</label><form:input id="HSCode" path="HSCode" htmlEscape="false" maxlength="50" class="input-small"/>
			<label>税种类 ：</label><select name="taxType" id="taxTypeSearch" >
										<option value="">--请选择--</option>
										<option value="taxRate"<c:if test="${goodsVo.taxType eq 'taxRate'}">selected="selected"</c:if>>税率</option>
										<option value="importTax"<c:if test="${goodsVo.taxType eq 'importTax'}">selected="selected"</c:if>>进口税</option>
										<option value="VAT" <c:if test="${goodsVo.taxType eq 'VAT'}">selected="selected"</c:if>>增值税</option>
										<option value="tariff" <c:if test="${goodsVo.taxType eq 'tariff'}">selected="selected"</c:if>>关税</option>
										<option value="consumerTax" <c:if test="${goodsVo.taxType eq 'consumerTax'}">selected="selected"</c:if>>消费者税</option>
								  </select>
			<form:input id="startTax" path="startTax" htmlEscape="false" maxlength="50" class="input-small"/>--
			<form:input id="endTax" path="endTax" htmlEscape="false" maxlength="50" class="input-small"/>
		</div>
		
		
<!-- 
		<div>
			<label class="control-label" for="startTime">起始时间:</label>
				<input id="startTime" name="startTime" type="text" readonly="readonly" maxlength="20"
				class="input-small Wdate required" value="<fmt:formatDate value="${goodsVo.startTime}" pattern="yyyy-MM-dd HH-mm-ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH-mm-ss',isShowClear:true});" />
		
			<label class="control-label" for="endTime">结束时间:</label>
				<input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20"
				class="input-small Wdate required" value="<fmt:formatDate value="${goodsVo.endTime}" pattern="yyyy-MM-dd HH-mm-ss"/>"
				onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH-mm-ss',isShowClear:true});" />
		</div>
-->


		
			&nbsp;&nbsp;&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			&nbsp;&nbsp;<input id="btnSubmit" class="btn" type="button" value="重置" onclick="resetForm()" />
	</form:form>
	
	<tags:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>序号</th>
				<th>商品编号</th>
				<th>商品名称</th>
				<th>海关备案编号</th>
				<th>商品标题</th>
				<th>商品分类</th>
				<th>商品品牌</th>
				<th>产地</th>
				<th>仓库---库存</th>
				<th>运费模板</th>
				<th>重量</th>
				<th>促销价格</th>
				<th>税则号</th>
				<th>增值税</th>
				<th>进口税</th>
				<th>消费者税</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${goodsPage.list}" var="goods" varStatus="s">
			<tr>
				<td>${s.index + 1}</td>
				<td>${goods.gId}</td>
				<td>${goods.name}</td>
				<td>${goods.customsRecordCode}</td>
				<td>${goods.title}</td>
				<td>${goods.goodsType.tName}</td>
				<td>${goods.brand.bName}</td>
				<td>${goods.origin}</td>
				<td>
					${goods.warehouse.wName}---库存数量
				</td>
				<td>${goods.freight.freightName}</td>
				<td>${goods.weight}</td>
				<td>${goods.promotionPrice}</td>
				<td>${goods.HSCode}</td>
				<td>${goods.VAT}</td>
				<td>${goods.importTax}</td>
				<td>${goods.consumerTax}</td>
				<td>
					<span id="sale_${goods.gId}">
						<c:if test="${goods.onsale eq '1'}">
							<a href="javascript:doPublic('<s:property value='${goods.gId}'/>',0)">下架</a>
						</c:if>
						<c:if test="${goods.onsale eq '0'}">
							<a href="javascript:doPublic('<s:property value='${goods.gId}'/>',1)">上架</a>
						</c:if>
					</span>
    			
    				<a href="${ctx}/goods/getGoodsById?gId=${goods.gId}">修改</a>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
