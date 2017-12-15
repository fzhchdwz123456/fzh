package com.thinkgem.jeesite.modules.warehouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.warehouse.dao.FreightDao;
import com.thinkgem.jeesite.modules.warehouse.entity.Freight;
import com.thinkgem.jeesite.modules.warehouse.utils.FreightVo;


@Service
public class FreightService {

	@Autowired
	private FreightDao freightDao;
	
	@Transactional
	public void saveObj(Freight freight) {
		freightDao.save(freight);
	}

	@Transactional
	public Page<Freight> getList(Page<Freight> page) {
		return freightDao.find(page);
		
	}

	public Freight getObj(String Id) {
		return 	freightDao.get(Id);

	}

	public Page<Freight> getList(Page<Freight> page, FreightVo freightVo) {
		return freightDao.find(page,freightVo);
	}

	public List<Freight> findAll() {
		return freightDao.findAll();
	}

}
