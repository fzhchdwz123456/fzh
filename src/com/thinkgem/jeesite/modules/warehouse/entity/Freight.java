package com.thinkgem.jeesite.modules.warehouse.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "freight")
public class Freight {

	@Id
	@GeneratedValue(generator = "uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	private String freightId;	//运费模板编号
	private String freightName;	//运费模板名称
	private String wName;			//仓库名称
	private String destinationPort;	//目的港
	private double firstheavy;		//首重价格
	private double overweight;		//每超重1KG价格
	
	
	
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
	public double getFirstheavy() {
		return firstheavy;
	}
	public void setFirstheavy(double firstheavy) {
		this.firstheavy = firstheavy;
	}
	public double getOverweight() {
		return overweight;
	}
	public void setOverweight(double overweight) {
		this.overweight = overweight;
	}
	
	
	
}
