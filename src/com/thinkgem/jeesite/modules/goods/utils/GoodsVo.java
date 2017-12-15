package com.thinkgem.jeesite.modules.goods.utils;

import java.sql.Date;

public class GoodsVo {

	private String gId;// 商品编号
	private String title;// 商品标题
	private String name; //在海关申报的名称，格式标准
	private String HSCode;	//税则号
	private String customsRecordCode;	//海关备案号
	private String origin; //产地
	
	private String tId;// 商品种类对应编号
	private String bId;// 商品品牌对应编号
	private String freightId;//运费模板编号
	private String wId; //所属仓库

	private Date startTime;	//开始时间
	private Date endTime;	//结束时间
	
	private String taxType; //税种类
	private double startTax;	//开始数字
	private double endTax;		//结束数字
	
	
	
	
	public String getgId() {
		return gId;
	}
	public void setgId(String gId) {
		this.gId = gId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHSCode() {
		return HSCode;
	}
	public void setHSCode(String hSCode) {
		HSCode = hSCode;
	}
	public String getCustomsRecordCode() {
		return customsRecordCode;
	}
	public void setCustomsRecordCode(String customsRecordCode) {
		this.customsRecordCode = customsRecordCode;
	}
	public String getOrigin() {
		return origin;
	}
	public void setOrigin(String origin) {
		this.origin = origin;
	}
	
	public String gettId() {
		return tId;
	}
	public void settId(String tId) {
		this.tId = tId;
	}
	public String getbId() {
		return bId;
	}
	public void setbId(String bId) {
		this.bId = bId;
	}
	public String getFreightId() {
		return freightId;
	}
	public void setFreightId(String freightId) {
		this.freightId = freightId;
	}
	public String getwId() {
		return wId;
	}
	public void setwId(String wId) {
		this.wId = wId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public double getStartTax() {
		return startTax;
	}
	public void setStartTax(double startTax) {
		this.startTax = startTax;
	}
	public double getEndTax() {
		return endTax;
	}
	public void setEndTax(double endTax) {
		this.endTax = endTax;
	}
	
	
	
	
}
