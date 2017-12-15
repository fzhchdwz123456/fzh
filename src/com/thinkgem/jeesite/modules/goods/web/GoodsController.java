package com.thinkgem.jeesite.modules.goods.web;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.modules.brand.entity.Brand;
import com.thinkgem.jeesite.modules.brand.service.BrandService;
import com.thinkgem.jeesite.modules.goods.dao.StandardDao;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.entity.GoodsImg;
import com.thinkgem.jeesite.modules.goods.entity.Standard;
import com.thinkgem.jeesite.modules.goods.service.GoodsImgService;
import com.thinkgem.jeesite.modules.goods.service.GoodsService;
import com.thinkgem.jeesite.modules.goods.service.StandardService;
import com.thinkgem.jeesite.modules.goods.utils.GoodsImgVo;
import com.thinkgem.jeesite.modules.goods.utils.GoodsVo;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.goodsType.service.GoodsTypeService;
import com.thinkgem.jeesite.modules.warehouse.entity.Freight;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;
import com.thinkgem.jeesite.modules.warehouse.service.FreightService;
import com.thinkgem.jeesite.modules.warehouse.service.WarehouseService;

/**
* @Description: 商品控制器
* @author HuQianwei
* @date 2017年4月5日 下午2:59:41
 */
@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsTypeService goodsTypeService;
	@Autowired 
	private BrandService brandService;
	@Autowired
	private WarehouseService warehouseService;
	@Autowired
	private FreightService freightService;
	@Autowired
	private StandardService standardService;
	@Autowired
	private GoodsImgService goodsImgService;
	
	
	@RequestMapping("/getList")
	public String getList(GoodsVo goodsVo ,HttpServletRequest request, HttpServletResponse response,Model model) {
		
		Page<Goods> goodsPage = goodsService.getList(new Page<Goods>(request, response),goodsVo);
		model.addAttribute("goodsPage", goodsPage);
		model.addAttribute("goodsVo",goodsVo);
		model=this.addModel(model);
		return "modules/goods/goodsList";
	}
	
	@RequestMapping("addObj")
	public String addObj(Goods goods,HttpServletRequest request, HttpServletResponse response,Model model){
		//返回空对象
		model.addAttribute("goods",goods);
		model = this.addModel(model);
		return "modules/goods/addObj";
	}
	
	@RequestMapping("saveObj")
	public String saveObj(Goods goods,HttpServletRequest request, HttpServletResponse response,Model model){
		goods.setgId(UUID.randomUUID().toString().replace("-", ""));
		goodsService.saveObj(goods);
		goodsService.addObjToGoods(goods);
		return "modules/goods/standardList";
	}
	
	
	@RequestMapping("/getGoodsById")
	public String getGoodsById(GoodsVo goodsVo,HttpServletRequest request, HttpServletResponse response,Model model){
		Goods goods = goodsService.getObj(goodsVo.getgId());
		model.addAttribute("goods", goods);
		model = addModel(model);
		return "modules/goods/goodsForm";
	}
	
	@RequestMapping("/updateGoods")
	public String updateGoods(Goods goods,HttpServletRequest request, HttpServletResponse response,Model model){
		goodsService.saveObj(goods);
		goodsService.addObjToGoods(goods);
		return "modules/goods/goodsForm";
	}
	
	
	
	
	
	
	
	//添加列表到model
	private Model addModel(Model model){
		//添加分类列表
		List<GoodsType> goodsTypesList = goodsTypeService.findAll();
		model.addAttribute("goodsTypesList", goodsTypesList);
		//添加品牌列表
		List<Brand> brandsList = brandService.findAll();
		model.addAttribute("brandsList", brandsList);
		//添加仓库列表
		List<Warehouse> warehousesList = warehouseService.findAll();
		model.addAttribute("warehousesList", warehousesList);
		//添加运费模板列表
		List<Freight> freightList = freightService.findAll();
		model.addAttribute("freightList", freightList);
		return model;
	}
	
	
	
}
