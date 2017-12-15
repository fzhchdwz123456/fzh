<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="编号"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="隐藏域名称（ID）"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="隐藏域值（ID）"%>
<%@ attribute name="labelName" type="java.lang.String" description="输入框名称（Name）"%>
<%@ attribute name="labelValue" type="java.lang.String" description="输入框值（Name）"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="树结构数据地址"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="选择框标题"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css样式"%>
<div class="input-append">
	<input id="${id}Id" name="${name}" type="hidden" value="${value}"/>
	<input id="${id}Name" name="${labelName}" type="text" value="${labelValue}" class="${cssClass}" style="width:120px" />
	<a id="${id}Button" href="javascript:" class="btn${disabled eq 'true' ? ' disabled' : ''}"><i class="icon-search"></i></a>&nbsp;&nbsp;
</div>

<script type="text/javascript">

		$("#${id}Button").click(function(){
			top.$.jBox.open("iframe:${ctx}${url}", "选择${title}" ,$(top.document).width()-220,$(top.document).height()-300,{
				buttons:{"确定":true}, loaded:function(h){
					$(".jbox-content", top.document).css("overflow-y","hidden");
				}, submit:function(v, h, f){
					var selected = h.find("iframe")[0].contentWindow.$("input[name='id']:checked");
					$("#${id}Id").val(selected.val());
					var name = selected.attr("title");
	                $("#${id}Name").val(name);
				}
			});
		});
</script>

