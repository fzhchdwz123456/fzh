package com.thinkgem.jeesite.modules.goods.service;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.modules.goods.dao.GoodsImgDao;
import com.thinkgem.jeesite.modules.goods.dao.StandardDao;
import com.thinkgem.jeesite.modules.goods.entity.GoodsImg;
import com.thinkgem.jeesite.modules.goods.entity.Standard;


@Service
@Transactional
public class StandardService {

	@Autowired
	private StandardDao standardDao;
	@Autowired
	private GoodsImgDao goodsImgDao;

	public void saveObj(Standard standard) {
		standardDao.save(standard);
	}

	public Standard getObj(String id) {
		Standard standard = standardDao.get(id);
		standard.setGoodsImg(goodsImgDao.get(standard.getsId()));
		return standard;
	}

	public boolean deleteObj(String id) {
		try {
			standardDao.deleteById(id);
			List<GoodsImg> list = goodsImgDao.find(goodsImgDao.createDetachedCriteria(Restrictions.eq("sId",id )));
			if (list.size()>0) {
				list.get(0);
				goodsImgDao.deleteById(id);
			}
			return true;
		} catch (Exception e) {
			return false;
		}
	}
	
	
}
