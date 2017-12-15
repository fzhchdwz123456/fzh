package com.thinkgem.jeesite.modules.goodsType.entity;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

/**
 * 商品品类GoodsType
 * @author 
 */
@Entity
@Table(name = "goods_type")
public class GoodsType implements Serializable{
	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String tId; // 种类编号
	private String tName;// 品类名
	private int status;// 显示状态 1=显示，0=不显示

	@Transient
	private int totalNumber;

	
	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}
	
	public String gettId() {
		return tId;
	}

	public void settId(String tId) {
		this.tId = tId;
	}


	public String gettName() {
		return tName;
	}

	public void settName(String tName) {
		this.tName = tName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
