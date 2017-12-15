package com.thinkgem.jeesite.modules.brand.web;

import javassist.expr.NewArray;

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

/**
* @Description:  品牌controller
* @author HuQianwei
* @date 2017年4月5日 上午10:31:51
 */
@Controller
@RequestMapping("/brand")
public class BrandController extends BaseController {

	@Autowired
	private BrandService brandService;
	@Autowired 
	private GoodsService goodsService;
	
	
	@RequestMapping("/getList")
	public String getList(BrandVo brandVo,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute("brandVo", brandVo);
		//TODO 返回页面没有分页
		Page<Brand> brandPage = brandService.getList(new Page<Brand>(request, response),brandVo);
		model.addAttribute("brandPage", brandPage);
		return "modules/brand/brandList";
	}
	
	
	@RequestMapping("/getObj")
	public String getObj(BrandVo brandVo,HttpServletRequest request, HttpServletResponse response,Model model){
		Brand brand = brandService.getObj(brandVo.getbId());
		model.addAttribute("brand", brand);
		if (brandVo.getCode()==1) {//标志位为1，表示查看，返回列表
			GoodsVo goodsVo = new GoodsVo();
			goodsVo.setbId(brand.getbId());
			Page<Goods> goodsPage =goodsService.getList(new Page<Goods>(),goodsVo);
			model.addAttribute("goodsPage", goodsPage);
			model.addAttribute("goodsVo", goodsVo);
			return "modules/goods/goodsList";
		}
		return "modules/brand/brandForm";
	}
	
	
	@RequestMapping("/deleteObj")
	public String deleteObj(BrandVo brandVo,HttpServletRequest request, HttpServletResponse response,Model model){
		int code = brandService.deleteObj(brandVo.getbId());
		brandVo.setbId("");
		Page<Brand> brandPage = brandService.getList(new Page<Brand>(request, response));
		model.addAttribute("brandPage", brandPage);
		if (code==0) {
			//TODO 返回信息确认
			addMessage(model, "该品牌下还包含商品，无法删除！");
		}
		return "modules/brand/brandList";
		
	}
	
	
	@RequestMapping("/saveObj")
	public String saveObj(Brand brand,HttpServletRequest request, HttpServletResponse response,Model model) {
		brandService.saveObj(brand);
		Page<Brand> brandPage = brandService.getList(new Page<Brand>(request, response));
		model.addAttribute("brandVo", new BrandVo());
		model.addAttribute("brandPage", brandPage);
		return "modules/brand/brandList";
	}
	
	
	@RequestMapping("/addObj")
	public String addObj(Brand brand,HttpServletRequest request, HttpServletResponse response,Model model) {
		model.addAttribute(brand);
		return "modules/brand/addObj";
	}
	
}
