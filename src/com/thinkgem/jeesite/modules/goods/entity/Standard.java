package com.thinkgem.jeesite.modules.goods.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 商品规格Standard
 * @author 
 */
@Entity
@Table(name = "standard")
public class Standard implements Serializable{
	@Id
	private String sId; // 规格编号

	private String gId;// 商品编号
	private String standard;// 规格
	private String color;// 颜色
	private int store;// 库存
	
	@Transient
	private GoodsImg goodsImg; //图片对象

	public GoodsImg getGoodsImg() {
		return goodsImg;
	}

	public void setGoodsImg(GoodsImg goodsImg) {
		this.goodsImg = goodsImg;
	}

	 
	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
	}

	public String getStandard() {
		return standard;
	}

	public void setStandard(String standard) {
		this.standard = standard;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getStore() {
		return store;
	}

	public void setStore(int store) {
		this.store = store;
	}

}
