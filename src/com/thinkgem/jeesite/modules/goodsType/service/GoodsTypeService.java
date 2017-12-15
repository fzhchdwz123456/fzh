package com.thinkgem.jeesite.modules.goodsType.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.goods.dao.GoodsDao;
import com.thinkgem.jeesite.modules.goods.service.GoodsService;
import com.thinkgem.jeesite.modules.goodsType.dao.GoodsTypeDao;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.goodsType.utils.GoodsTypeVo;


/**
* @Description:分类服务层
* @author HuQianwei
* @date 2017年4月5日 下午2:09:30
 */
@Service
public class GoodsTypeService {

	@Autowired 
	private GoodsTypeDao goodsTypeDao;

	@Autowired
	private GoodsDao goodsDao;
	
	@Transactional
	public Page<GoodsType> getList(Page<GoodsType> page) {
		page = goodsTypeDao.find(page);
		for (GoodsType goodsType : page.getList()) {
			goodsType.setTotalNumber(goodsDao.getNumByCul("tId",goodsType.gettId()));
		}
		return page;
	}


	@Transactional
	public GoodsType getObj(String tId) {
		return goodsTypeDao.get(tId);
	}

	@Transactional
	public int deleteObj(String tId) {
		if (goodsDao.getNumByCul("tId",tId)>0) {
			return 0;
		}else {
			goodsTypeDao.deleteById(tId);
			return 1;
		}
	}

	@Transactional
	public void saveObj(GoodsType goodsType) {
		goodsTypeDao.save(goodsType);
	}


	public List<GoodsType> findAll() {
	
		return goodsTypeDao.findAll();
	}


	public Page<GoodsType> getList(Page<GoodsType> page, GoodsTypeVo goodsTypeVo) {
		page = goodsTypeDao.find(page,goodsTypeVo);
		for (GoodsType goodsType : page.getList()) {
			goodsType.setTotalNumber(goodsDao.getNumByCul("tId",goodsType.gettId()));
		}
		return page;
	}
	
	
	
}
