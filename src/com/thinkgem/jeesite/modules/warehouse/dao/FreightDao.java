package com.thinkgem.jeesite.modules.warehouse.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.warehouse.entity.Freight;
import com.thinkgem.jeesite.modules.warehouse.utils.FreightVo;

@Repository
public class FreightDao extends BaseDao<Freight> {

	
	public Page<Freight> find(Page<Freight> page, FreightVo freightVo) {
		if (freightVo==null) {
			return find(page);
		}
		DetachedCriteria dc = createDetachedCriteria();
		if (freightVo.getFreightId()!=null) {
			dc.add(Restrictions.like("freightId", "%"+freightVo.getFreightId()+"%"));
		}
		if (freightVo.getFreightName()!=null) {
			dc.add(Restrictions.like("freightName", "%"+freightVo.getFreightName()+"%"));
		}
		if (freightVo.getwName()!=null) {
			dc.add(Restrictions.like("wName", "%"+freightVo.getwName()+"%"));
		}
		if (freightVo.getDestinationPort()!=null) {
			dc.add(Restrictions.like("destinationPort", "%"+freightVo.getDestinationPort()+"%"));
		}
		return find(page, dc);
		
	}

}
