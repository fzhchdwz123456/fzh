package com.thinkgem.jeesite.modules.goods.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.thinkgem.jeesite.common.utils.FileUtils;
import com.thinkgem.jeesite.modules.brand.service.BrandService;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.entity.GoodsImg;
import com.thinkgem.jeesite.modules.goods.entity.Standard;
import com.thinkgem.jeesite.modules.goods.service.GoodsImgService;
import com.thinkgem.jeesite.modules.goods.service.GoodsService;
import com.thinkgem.jeesite.modules.goods.service.StandardService;
import com.thinkgem.jeesite.modules.goods.utils.GoodsImgVo;
import com.thinkgem.jeesite.modules.goodsType.service.GoodsTypeService;
import com.thinkgem.jeesite.modules.warehouse.service.FreightService;
import com.thinkgem.jeesite.modules.warehouse.service.WarehouseService;

@Controller
@RequestMapping("/standard")
public class StandardController {

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
	
	
	@RequestMapping("/addStandard")
	public String addStandard(Standard standard,HttpServletRequest request, HttpServletResponse response,Model model){
		model.addAttribute("standard", standard);
		return "modules/goods/addStandard";
	}
	
	@RequestMapping("/saveStandard")
	public String saveStandard(Standard standard,GoodsImg goodsImg,HttpServletRequest request, HttpServletResponse response,Model model) throws Exception{
		if (StringUtils.isBlank(standard.getsId())) {
			standard.setsId(UUID.randomUUID().toString().replace("-", ""));
		}
		standardService.saveObj(standard);
		
		goodsImg.setsId(standard.getsId());
		goodsImg.setgId(standard.getgId());
		goodsImg.setCreatedTime(new Date());
		
		uploadPC("pic","great",request);
		uploadPC("pic","middle",request);
		uploadPC("pic","small",request);
		uploadPC("pic","other",request);
		
		goodsImgService.saveObj(goodsImg);
		Goods goods = goodsService.getObj(standard.getgId());
		model.addAttribute("goods", goods);
		return "modules/goods/standardList";
	}

	
	@RequestMapping("/getObj")
	public String getObj(String sId,HttpServletRequest request, HttpServletResponse response,Model model){
		Standard standard = standardService.getObj(sId);
		model.addAttribute("standard", standard);
		return "modules/goods/standardForm";
	}
	
	@RequestMapping("/deleteObj")
	public String deleteObj(Standard standard,HttpServletRequest request, HttpServletResponse response,Model model){
		if (standardService.deleteObj(standard.getsId())) {
			model.addAttribute("goods", goodsService.getObj(standard.getgId()));
			return "modules/goods/standardList";
		}
		return "error/500";
	}
	

	public static String uploadPC(String upload,String imgName,HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest rm=(MultipartHttpServletRequest) request;
		CommonsMultipartFile cfile = (CommonsMultipartFile) rm.getFile(imgName);
		byte[] bfile=cfile.getBytes();
		String fileName="";
		SimpleDateFormat format=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		fileName=format.format(new Date());
		//获取三位随机数
		Random random=new Random();
		for(int i=0;i<3;i++){
			fileName=fileName+random.nextInt(9);
		}
		//获取原始文件名
		String origFileName=cfile.getOriginalFilename();
		String suffix =origFileName.substring(origFileName.lastIndexOf("."));
		//拿到了项目的部署路径
		String path=request.getSession().getServletContext().getRealPath("/");
		//定义文件的输出流
		File file=new File("C:/Users/fengzihao/Desktop/123/"+""+upload+"");
		if(!file.exists()){
			file.mkdir();//创建文件夹
		}
		OutputStream out=new FileOutputStream(new File("C:/Users/fengzihao/Desktop/123"+"/"+upload+"/"+fileName+suffix));
		out.write(bfile);
		out.flush();
		out.close();
		return "";
	}
	
	
}
