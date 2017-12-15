package com.thinkgem.jeesite.modules.brand.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.BaseService;
import com.thinkgem.jeesite.modules.brand.dao.BrandDao;
import com.thinkgem.jeesite.modules.brand.entity.Brand;
import com.thinkgem.jeesite.modules.brand.utils.BrandVo;
import com.thinkgem.jeesite.modules.goods.dao.GoodsDao;

/**
* @Description: 品牌服务层
* @author HuQianwei
* @date 2017年4月5日 上午10:42:05
 */
@Service
public class BrandService extends BaseService {

	@Autowired
	private BrandDao brandDao;
	@Autowired
	private GoodsDao goodsDao;
	
	
	@Transactional
	public Page<Brand> getList(Page<Brand> page) {
		//获得分页列表
		page = brandDao.find(page);
		//获得包含商品数
		for (Brand brand : page.getList()) {
			brand.setTotalNumber(goodsDao.getNumByCul("bId",brand.getbId()));
		}
		return page;
	}
	
	public Page<Brand> getList(Page<Brand> page, BrandVo brandVo) {
		
		//获得分页列表
		page = brandDao.find(page,brandVo);
		//获得包含商品数
		for (Brand brand : page.getList()) {
			brand.setTotalNumber(goodsDao.getNumByCul("bId",brand.getbId()));
		}
		return page;
	}
	
	@Transactional
	public Brand getObj(String id) {
		return brandDao.get(id);
	}

	@Transactional
	public void saveObj(Brand brand) {
		brandDao.save(brand);
	}

	@Transactional
	public int deleteObj(String bId) {
		if (goodsDao.getNumByCul("bId",bId)>0) {
			return 0;
		}else {
			brandDao.deleteById(bId);
			return 1;
		}
	}

	public List<Brand> findAll() {
		return brandDao.findAll();
	}

	

}
