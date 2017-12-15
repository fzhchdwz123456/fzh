package com.thinkgem.jeesite.modules.warehouse.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.warehouse.entity.Freight;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;
import com.thinkgem.jeesite.modules.warehouse.service.FreightService;
import com.thinkgem.jeesite.modules.warehouse.service.WarehouseService;
import com.thinkgem.jeesite.modules.warehouse.utils.FreightVo;

@Controller
@RequestMapping("/freight")
public class FreightController {

	@Autowired
	private FreightService freightService;
	@Autowired
	private WarehouseService warehouseService;
	
	
	@RequestMapping("/getList")
	public String getList(FreightVo freightVo,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute("freightVo", freightVo);
		Page<Freight> freightPage = freightService.getList(new Page<Freight>(),freightVo);
		model.addAttribute("freightPage", freightPage);
		return "modules/warehouse/freightList";
	}
	
	@RequestMapping("/getObj")
	public String getObj(FreightVo freightVo,HttpServletRequest request, HttpServletResponse response,Model model){
		Freight freight = freightService.getObj(freightVo.getFreightId());
		model.addAttribute("freight", freight);
		List<Warehouse> warehouseList = warehouseService.findAll();
		model.addAttribute("warehouseList", warehouseList);
		if (freightVo.getCode()==1) {
			return "返回列表和分类";
		}
		return "modules/warehouse/freightForm";
	}
	
	@RequestMapping("/saveObj")
	public String saveObj(Freight freight,HttpServletRequest request, HttpServletResponse response,Model model){
		freightService.saveObj(freight);
		model.addAttribute("freightVo", new FreightVo());
		Page<Freight> freightPage = freightService.getList(new Page<Freight>());
		model.addAttribute("freightPage", freightPage);
		return "modules/warehouse/freightList";
	}
	
	
	@RequestMapping("/addObj")
	public String addObj(Freight freight,HttpServletRequest request, HttpServletResponse response,Model model){
		List<Warehouse> warehouseList = warehouseService.findAll();
		model.addAttribute("warehouseList", warehouseList);
		model.addAttribute("freight", freight);
		return "modules/warehouse/addFreightObj";
	}
	
	
}
