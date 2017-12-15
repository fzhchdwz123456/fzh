package com.thinkgem.jeesite.modules.goodsType.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.goodsType.utils.GoodsTypeVo;

/**
* @Description:
* @author HuQianwei
* @date 2017年4月5日 上午11:04:15
 */
@Repository
public class GoodsTypeDao extends BaseDao<GoodsType> {

	public Page<GoodsType> find(Page<GoodsType> page, GoodsTypeVo goodsTypeVo) {
		if (goodsTypeVo==null) {
			return find(page);
		}
		DetachedCriteria dc = createDetachedCriteria();
		if (StringUtils.isNotBlank(goodsTypeVo.gettId())) {
			dc.add(Restrictions.like("tId", "%"+goodsTypeVo.gettId()+"%"));
		}
		if (StringUtils.isNotBlank(goodsTypeVo.gettName())) {
			dc.add(Restrictions.like("tName", "%"+goodsTypeVo.gettName()+"%"));
		}
		return find(page, dc);
	}


	
}
