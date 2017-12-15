package com.thinkgem.jeesite.modules.goods.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 商品图片GoodsImg
 * @author 
 */
@Entity
@Table(name = "goods_img")
public class GoodsImg implements Serializable{
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String iId; // 图片编号

	private String sId;//规格编号
	private String gId;// 商品编号
	private String smallImgUrl;// 50*50图
	private String middleImgUrl;// 100*100图
	private String greatImgUrl;// 500*500图
	private String otherImgUrl; // 其他图
	private Date createdTime;// 创建时间

	public String getiId() {
		return iId;
	}

	public void setiId(String iId) {
		this.iId = iId;
	}
	

	public String getSmallImgUrl() {
		return smallImgUrl;
	}

	public void setSmallImgUrl(String smallImgUrl) {
		this.smallImgUrl = smallImgUrl;
	}

	public String getMiddleImgUrl() {
		return middleImgUrl;
	}

	public void setMiddleImgUrl(String middleImgUrl) {
		this.middleImgUrl = middleImgUrl;
	}

	public String getGreatImgUrl() {
		return greatImgUrl;
	}

	public void setGreatImgUrl(String greatImgUrl) {
		this.greatImgUrl = greatImgUrl;
	}

	public String getOtherImgUrl() {
		return otherImgUrl;
	}

	public void setOtherImgUrl(String otherImgUrl) {
		this.otherImgUrl = otherImgUrl;
	}

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getsId() {
		return sId;
	}

	public void setsId(String sId) {
		this.sId = sId;
	}
	
}
