package com.thinkgem.jeesite.modules.goods.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.thinkgem.jeesite.common.persistence.BaseDao;
import com.thinkgem.jeesite.modules.goods.entity.GoodsImg;

/**
 * 商品图片数据访问层
 * @author z
 *
 */
@Repository
public class GoodsImgDao extends BaseDao<GoodsImg> {

	public GoodsImg getObjBySId(String sId) {
		List<GoodsImg> list = find(createDetachedCriteria(Restrictions.eq("sId", sId)));
		return list.size()!=0?list.get(0):null;
	}



}
