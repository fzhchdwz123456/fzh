package com.thinkgem.jeesite.modules.goods.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.brand.dao.BrandDao;
import com.thinkgem.jeesite.modules.goods.dao.GoodsDao;
import com.thinkgem.jeesite.modules.goods.dao.GoodsImgDao;
import com.thinkgem.jeesite.modules.goods.dao.StandardDao;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.entity.Standard;
import com.thinkgem.jeesite.modules.goods.utils.GoodsImgVo;
import com.thinkgem.jeesite.modules.goods.utils.GoodsVo;
import com.thinkgem.jeesite.modules.goodsType.dao.GoodsTypeDao;
import com.thinkgem.jeesite.modules.warehouse.dao.FreightDao;
import com.thinkgem.jeesite.modules.warehouse.dao.WarehouseDao;

/**
* @Description:
* @author HuQianwei
* @date 2017年4月5日 下午3:21:07
 */

@Service
public class GoodsService {

	@Autowired
	private GoodsDao goodsDao;
	@Autowired
	private GoodsTypeDao goodsTypeDao;
	@Autowired
	private BrandDao brandDao;
	@Autowired
	private WarehouseDao warehouseDao;
	@Autowired
	private FreightDao freightDao;
	@Autowired 
	private StandardDao standardDao;
	@Autowired
	private GoodsImgDao goodsImgDao;

	@Transactional
	public Page<Goods> getList(Page<Goods> page) {
		 page = goodsDao.find(page);
		 page.setList(this.addObjToList(page.getList()));
		 return page;
	}
	
	@Transactional
	public void saveObj(Goods goods) {
		goods.setCreatedTime(new Date());
		goodsDao.save(goods);
	}
	
	@Transactional
	public Goods getObj(String id) {
		return addObjToGoods(goodsDao.get(id));
	}

	
	
	public Page<Goods> getList(Page<Goods> page, GoodsVo goodsVo) {
		 page = goodsDao.find(page,goodsVo);
		 page.setList(this.addObjToList(page.getList()));
		 return page;
	}
	
	
	@Transactional
	public Goods addObjToGoods(Goods goods){
		if (goods!=null) {
			List<Goods> list =new ArrayList<Goods>();
			list.add(goods);
			List<Goods> list2 = addObjToList(list);
			goods=list2.get(0);
		}
		return goods;
	}
	
	@Transactional
	public List<Goods> addObjToList(List<Goods> list){
		if (list.size()!=0) {
			for (Goods goods : list) {
				goods.setGoodsType(goodsTypeDao.get(goods.gettId()));
				goods.setBrand(brandDao.get(goods.getbId()));
				goods.setWarehouse(warehouseDao.get(goods.getwId()));
				goods.setFreight(freightDao.get(goods.getFreightId()));
				List<Standard> standardsList = standardDao.findListByGId(goods.getgId());
				for (Standard standard : standardsList) {
					standard.setGoodsImg(goodsImgDao.getObjBySId(standard.getsId()));
				}
				goods.setStandardList(standardsList);
			}
		}
		return list;
	}
	
	

	
}
