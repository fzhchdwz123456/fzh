package com.thinkgem.jeesite.modules.goods.service;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.thinkgem.jeesite.modules.goods.dao.GoodsImgDao;
import com.thinkgem.jeesite.modules.goods.entity.GoodsImg;

@Service
@Transactional
public class GoodsImgService {

	@Autowired
	private GoodsImgDao goodsImgDao;

	public void saveObj(GoodsImg goodsImg) {
		goodsImgDao.save(goodsImg);
	}
	
	
	
}
