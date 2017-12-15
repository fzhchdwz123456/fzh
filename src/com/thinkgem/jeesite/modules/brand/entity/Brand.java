package com.thinkgem.jeesite.modules.brand.entity;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.thinkgem.jeesite.modules.goods.entity.Goods;

/**
 * 品牌Brand
 * @author 
 */
@Entity
@Table(name = "brand")
public class Brand implements Serializable{

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String bId; // 品牌编号
	private String bName;// 品牌名
	private int status;// 显示状态 1=显示，0=不显示

	@Transient
	private List<Goods> list; //商品列表
	@Transient
	private int totalNumber;
	
	
	public int getTotalNumber() {
		return totalNumber;
	}

	public void setTotalNumber(int totalNumber) {
		this.totalNumber = totalNumber;
	}

	public List<Goods> getList() {
		return list;
	}

	public void setList(List<Goods> list) {
		this.list = list;
	}

	public String getbName() {
		return bName;
	}

	public void setbName(String bName) {
		this.bName = bName;
	}

	public String getbId() {
		return bId;
	}

	public void setbId(String bId) {
		this.bId = bId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
