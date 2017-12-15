package com.thinkgem.jeesite.modules.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.goods.dao.GoodsDao;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.warehouse.dao.WarehouseDao;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;
import com.thinkgem.jeesite.modules.warehouse.utils.WarehouseVo;

@Service
@Transactional
public class WarehouseService {

	@Autowired 
	private WarehouseDao warehouseDao;
	@Autowired
	private GoodsDao goodsDao;

	@Transactional
	public Page<Warehouse> getList(Page<Warehouse> page, WarehouseVo warehouseVo) {
		page = warehouseDao.find(page,warehouseVo);
		for (Warehouse warehouse : page.getList()) {
			warehouse.setTotalNumber(goodsDao.getNumByCul("wId", warehouse.getwId()));
		}
		return page;
	}

	@Transactional
	public Warehouse getObj(String wId) {
		return warehouseDao.get(wId);
	}

	@Transactional
	public int deleteObj(String wId) {
		if (goodsDao.getNumByCul("wId",wId)>0) {
			return 0;
		}else {
			warehouseDao.deleteById(wId);
			return 1;
		}
	}

	@Transactional
	public Page<Warehouse> getList(Page<Warehouse> page) {
		page = warehouseDao.find(page);
		for (Warehouse warehouse : page.getList()) {
			warehouse.setTotalNumber(goodsDao.getNumByCul("wId",warehouse.getwId()));
		}
		return page;
	}

	@Transactional
	public void saveObj(Warehouse warehouse) {
		warehouseDao.save(warehouse);
	}

	public List<Warehouse> findAll() {
		return warehouseDao.findAll();
	}
	
	
	
	
	
}
