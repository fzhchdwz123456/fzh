package com.thinkgem.jeesite.modules.warehouse.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.service.GoodsService;
import com.thinkgem.jeesite.modules.goods.utils.GoodsVo;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;
import com.thinkgem.jeesite.modules.warehouse.service.WarehouseService;
import com.thinkgem.jeesite.modules.warehouse.utils.WarehouseVo;

@Controller
@RequestMapping("/warehouse")
public class WarehouseController extends BaseController {

	@Autowired
	private WarehouseService warehouseService;
	@Autowired 
	private GoodsService goodsService;

	
	@RequestMapping("/getList")
	public String getList(WarehouseVo warehouseVo,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute("warehouseVo", warehouseVo);
		//TODO 返回页面没有分页
		Page<Warehouse> warehousePage = warehouseService.getList(new Page<Warehouse>(request, response),warehouseVo);
		model.addAttribute("warehousePage", warehousePage);
		return "modules/warehouse/warehouseList";
	}
	

	@RequestMapping("/getObj")
	public String getObj(WarehouseVo warehouseVo,HttpServletRequest request, HttpServletResponse response,Model model){
		Warehouse warehouse = warehouseService.getObj(warehouseVo.getwId());
		model.addAttribute("warehouse", warehouse);
		if (warehouseVo.getCode()==1) {//标志位为1，表示查看，返回列表
			GoodsVo goodsVo = new GoodsVo();
			goodsVo.setwId(warehouse.getwId());
			Page<Goods> goodsPage =goodsService.getList(new Page<Goods>(),goodsVo);
			model.addAttribute("goodsPage", goodsPage);
			model.addAttribute("goodsVo", goodsVo);
			return "modules/goods/goodsList";
		}
		return "modules/warehouse/warehouseForm";
	}
	
	
	@RequestMapping("/deleteObj")
	public String deleteObj(WarehouseVo warehouseVo,HttpServletRequest request, HttpServletResponse response,Model model){
		int code = warehouseService.deleteObj(warehouseVo.getwId());
		warehouseVo.setwId("");
		Page<Warehouse> warehousePage = warehouseService.getList(new Page<Warehouse>(request, response));
		model.addAttribute("warehousePage", warehousePage);
		if (code==0) {
			//TODO 返回信息确认
			addMessage(model, "该分类下还包含商品，无法删除！");
		}
		return "modules/warehouse/warehouseList";
	}
	
	
	
	@RequestMapping("/saveObj")
	public String saveObj(Warehouse warehouse,HttpServletRequest request, HttpServletResponse response,Model model) {
		warehouseService.saveObj(warehouse);
		Page<Warehouse> warehousePage = warehouseService.getList(new Page<Warehouse>(request, response));
		model.addAttribute("warehouseVo", new WarehouseVo());
		model.addAttribute("warehousePage", warehousePage);
		return "modules/warehouse/warehouseList";
	}
	
	@RequestMapping("/addObj")
	public String addObj(Warehouse warehouse,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute(warehouse);
		return "modules/warehouse/addWarehouseObj";
	}
}
