package com.thinkgem.jeesite.modules.warehouse.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;
import com.thinkgem.jeesite.modules.warehouse.utils.WarehouseVo;

@Repository
public class WarehouseDao extends BaseDao<Warehouse> {

	public Page<Warehouse> find(Page<Warehouse> page, WarehouseVo warehouseVo) {
		if (warehouseVo==null) {
			return find(page);
		}
		DetachedCriteria dc = createDetachedCriteria();
		if (warehouseVo.getwId()!=null) {
			dc.add(Restrictions.like("wId", "%"+warehouseVo.getwId()+"%"));
		}
		if (warehouseVo.getwName()!=null) {
			dc.add(Restrictions.like("wName", "%"+warehouseVo.getwName()+"%"));
		}
		return find(page, dc);
	}

}
