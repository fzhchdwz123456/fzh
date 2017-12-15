package com.thinkgem.jeesite.modules.goodsType.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.brand.entity.Brand;
import com.thinkgem.jeesite.modules.brand.service.BrandService;
import com.thinkgem.jeesite.modules.brand.utils.BrandVo;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.service.GoodsService;
import com.thinkgem.jeesite.modules.goods.utils.GoodsVo;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.goodsType.service.GoodsTypeService;
import com.thinkgem.jeesite.modules.goodsType.utils.GoodsTypeVo;

/**
* @Description: 分类控制器
* @author HuQianwei
* @date 2017年4月5日 上午11:06:50
 */
@Controller
@RequestMapping("/goodsType")
public class GoodsTypeController extends BaseController {

	@Autowired
	private GoodsTypeService goodsTypeService;
	@Autowired 
	private GoodsService goodsService;
	/**
	* @Description:  获得分类列表
	* @return String  
	* @author HuQianwei
	 */
	@RequestMapping("/getList")
	public String getList(GoodsTypeVo goodsTypeVo,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute("goodsTypeVo", goodsTypeVo);
		//TODO 返回页面没有分页
		Page<GoodsType> goodsTypePage = goodsTypeService.getList(new Page<GoodsType>(request, response),goodsTypeVo);
		model.addAttribute("goodsTypePage", goodsTypePage);
		return "modules/goodsType/goodsTypeList";
	}
	
	/**
	* @Description: 通过分类编号获得详细信息
	* @return String  
	* @author HuQianwei
	 */
	@RequestMapping("/getObj")
	public String getObj(GoodsTypeVo goodsTypeVo,HttpServletRequest request, HttpServletResponse response,Model model){
		GoodsType goodsType = goodsTypeService.getObj(goodsTypeVo.gettId());
		model.addAttribute("goodsType", goodsType);
		if (goodsTypeVo.getCode()==1) {//标志位为1，表示查看，返回列表
			GoodsVo goodsVo = new GoodsVo();
			goodsVo.settId(goodsType.gettId());
			Page<Goods> goodsPage =goodsService.getList(new Page<Goods>(),goodsVo);
			model.addAttribute("goodsPage", goodsPage);
			model.addAttribute("goodsVo", goodsVo);
			return "modules/goods/goodsList";
		}
		return "modules/goodsType/goodsTypeForm";
	}
	
	
	@RequestMapping("/deleteObj")
	public String deleteObj(GoodsTypeVo goodsTypeVo,HttpServletRequest request, HttpServletResponse response,Model model){
		int code = goodsTypeService.deleteObj(goodsTypeVo.gettId());
		goodsTypeVo.settId("");
		Page<GoodsType> goodsTypePage = goodsTypeService.getList(new Page<GoodsType>(request, response));
		model.addAttribute("goodsTypePage", goodsTypePage);
		if (code==0) {
			//TODO 返回信息确认
			addMessage(model, "该分类下还包含商品，无法删除！");
		}
		return "modules/goodsType/goodsTypeList";
	}
	
	
	
	@RequestMapping("/saveObj")
	public String saveObj(GoodsType goodsType,HttpServletRequest request, HttpServletResponse response,Model model) {
		goodsTypeService.saveObj(goodsType);
		Page<GoodsType> goodsTypePage = goodsTypeService.getList(new Page<GoodsType>(request, response));
		model.addAttribute("goodsTypeVo", new GoodsTypeVo());
		model.addAttribute("goodsTypePage", goodsTypePage);
		return "modules/goodsType/goodsTypeList";
	}
	
	@RequestMapping("/addObj")
	public String addObj(GoodsType goodsType,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute(goodsType);
		return "modules/goodsType/addObj";
	}
}
