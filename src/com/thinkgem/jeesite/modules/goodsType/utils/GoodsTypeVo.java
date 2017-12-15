package com.thinkgem.jeesite.modules.goodsType.utils;

public class GoodsTypeVo {

	private String tId; // 种类编号
	private String tName;
	private int code;//标志位，
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
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
}
