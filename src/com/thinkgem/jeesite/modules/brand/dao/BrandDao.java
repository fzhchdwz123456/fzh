package com.thinkgem.jeesite.modules.brand.dao;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.brand.entity.Brand;
import com.thinkgem.jeesite.modules.brand.utils.BrandVo;

/**
 * 商品品牌数据访问层
 * @author z
 */
@Repository
public class BrandDao extends BaseDao<Brand> {

	public Page<Brand> find(Page<Brand> page, BrandVo brandVo) {
		if (brandVo==null) {
			return find(page);
		}
		DetachedCriteria dc = createDetachedCriteria();
		if (brandVo.getbId()!=null) {
			dc.add(Restrictions.like("bId", "%"+brandVo.getbId()+"%"));
		}
		if (brandVo.getbName()!=null) {
			dc.add(Restrictions.like("bName", "%"+brandVo.getbName()+"%"));
		}
		return find(page, dc);
	}
	

	
}
