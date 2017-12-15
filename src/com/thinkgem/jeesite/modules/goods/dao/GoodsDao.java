package com.thinkgem.jeesite.modules.goods.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.Parameter;
import com.thinkgem.jeesite.modules.goods.entity.Goods;
import com.thinkgem.jeesite.modules.goods.utils.GoodsVo;

/**
 * 商品相关的数据访问层
 * @author 
 */
@Repository
public class GoodsDao extends BaseDao<Goods>{

	public int getNumByCul(String cond,String id) {
		List<Goods> list = find(createDetachedCriteria(Restrictions.eq(cond, id)));
		return list.size();
	}

	public Page<Goods> find(Page<Goods> page, GoodsVo goodsVo) {
		DetachedCriteria dc = createDetachedCriteria();
		if (StringUtils.isNotBlank(goodsVo.getgId())) {
			dc.add(Restrictions.like("gId", "%"+goodsVo.getgId()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.getTitle())) {
			dc.add(Restrictions.like("title", "%"+goodsVo.getTitle()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.getName())) {
			dc.add(Restrictions.like("name", "%"+goodsVo.getName()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.getHSCode())) {
			dc.add(Restrictions.like("HSCode", "%"+goodsVo.getHSCode()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.getCustomsRecordCode())) {
			dc.add(Restrictions.like("customsRecordCode", "%"+goodsVo.getCustomsRecordCode()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.getOrigin())) {
			dc.add(Restrictions.like("origin", "%"+goodsVo.getOrigin()+"%"));
		}
		if (StringUtils.isNotBlank(goodsVo.gettId())) {
			dc.add(Restrictions.eq("tId", goodsVo.gettId()));
		}
		if (StringUtils.isNotBlank(goodsVo.getbId())) {
			dc.add(Restrictions.eq("bId", goodsVo.getbId()));
		}
		if (StringUtils.isNotBlank(goodsVo.getFreightId())) {
			dc.add(Restrictions.eq("freightId", goodsVo.getFreightId()));
		}
		if (StringUtils.isNotBlank(goodsVo.getwId())) {
			dc.add(Restrictions.eq("wId", goodsVo.getwId()));
		}
		
		if (goodsVo.getStartTime()!=null) {
			dc.add(Restrictions.ge("createdTime", goodsVo.getStartTime()));
		}
		if (goodsVo.getEndTime()!=null) {
			dc.add(Restrictions.le("createdTime", goodsVo.getEndTime()));
		}
		if (StringUtils.isNotBlank(goodsVo.getTaxType())) {
			if (goodsVo.getStartTax()!=0) {
				dc.add(Restrictions.ge(goodsVo.getTaxType(), goodsVo.getStartTax()));
			}
			if (goodsVo.getEndTax()!=0) {
				dc.add(Restrictions.le(goodsVo.getTaxType(), goodsVo.getEndTax()));
			}
		}
		
		return find(page, dc);
	}
	
	

}
