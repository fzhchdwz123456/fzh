package com.thinkgem.jeesite.modules.goods.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.modules.goods.entity.Standard;

/**
 * 商品规格数据访问层
 * @author 
 */
@Repository
public class StandardDao extends BaseDao<Standard>{
	
	

	public List<Standard> findListByGId(String gId) {
		return find(createDetachedCriteria(Restrictions.eq("gId", gId)));
	}
}
