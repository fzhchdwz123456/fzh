package com.thinkgem.jeesite.modules.warehouse.utils;

public class FreightVo {

	private String freightId;	//运费模板编号
	private String freightName;	//运费模板名称
	private String wName;			//仓库名称
	private String destinationPort;	//目的港
	private int code;
	
	
	
	public String getFreightId() {
		return freightId;
	}
	public void setFreightId(String freightId) {
		this.freightId = freightId;
	}
	public String getFreightName() {
		return freightName;
	}
	public void setFreightName(String freightName) {
		this.freightName = freightName;
	}
	public String getwName() {
		return wName;
	}
	public void setwName(String wName) {
		this.wName = wName;
	}
	public String getDestinationPort() {
		return destinationPort;
	}
	public void setDestinationPort(String destinationPort) {
		this.destinationPort = destinationPort;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	
}
