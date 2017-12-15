package com.thinkgem.jeesite.modules.goods.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;

import com.thinkgem.jeesite.modules.brand.entity.Brand;
import com.thinkgem.jeesite.modules.goodsType.entity.GoodsType;
import com.thinkgem.jeesite.modules.warehouse.entity.Freight;
import com.thinkgem.jeesite.modules.warehouse.entity.Warehouse;


/**
 * 商品Goods
 * @author 
 */
@Entity
@Table(name = "goods")
public class Goods implements Serializable{
	@Id
	private String gId;// 商品编号
	private String barCode;// 商品条码
	private String title;// 商品标题
	private double referencePrice;// 参考价
	private double promotionPrice;// 促销价
	private double costPrice;// 成本价
	private int integral;// 积分
	private double taxRate;// 税率
	private double importTax;// 进口税
	private double weight;// 重量
	private String detail;// 商品详情
	private int isRecommended;// 是否热门推荐 0不推荐，1推荐
	private Date createdTime;// 创建时间

	private String tId;// 商品种类对应编号
	private String bId;// 商品品牌对应编号
	
	private String introduce;//商品名下面的一句话介绍
	private String freightId;//运费模板编号
	private int combination;//是否是组合 0不是，1是
	private String name; //在海关申报的名称，格式标准
	private String unit; //常用单位
	private int onsale; //上架下架 0下架，1上架
	private String origin; //产地
	private String wId; //所属仓库
	private double VAT; //增值税
	private double tariff; //关税
	private double consumerTax; //消费者税
	private String supplierId; //供应商编号
	private String HSCode;			//税则号
	private String customsRecordCode;	//海关备案号
	

	@Transient
	private List<Standard> standardList; // 存放规格信息
	@Transient
	private GoodsType goodsType; // 存放商品品类
	@Transient
	private Brand brand; // 存放商品品牌
	@Transient
	private List<GoodsImg> imgList; // 存放图片的列表
	@Transient
	private Standard standard;  // 购买的规格
	@Transient
	private Warehouse warehouse; //仓库
	@Transient
	private Freight freight;
	
	
	
	
	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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

	public Freight getFreight() {
		return freight;
	}

	public void setFreight(Freight freight) {
		this.freight = freight;
	}

	public Warehouse getWarehouse() {
		return warehouse;
	}

	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}

	public String getFreightId() {
		return freightId;
	}

	public void setFreightId(String freightId) {
		this.freightId = freightId;
	}

	public Standard getStandard() {
		return standard;
	}

	public void setStandard(Standard standard) {
		this.standard = standard;
	}

	public List<GoodsImg> getImgList() {
		return imgList;
	}

	public void setImgList(List<GoodsImg> imgList) {
		this.imgList = imgList;
	}

	public List<Standard> getStandardList() {
		return standardList;
	}

	public void setStandardList(List<Standard> standardList) {
		this.standardList = standardList;
	}

	public GoodsType getGoodsType() {
		return goodsType;
	}

	public void setGoodsType(GoodsType goodsType) {
		this.goodsType = goodsType;
	}

	public Brand getBrand() {
		return brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	public String getBarCode() {
		return barCode;
	}

	public void setBarCode(String barCode) {
		this.barCode = barCode;
	}

	public String getTitle() {
		return title;
	}

	public String getgId() {
		return gId;
	}

	public void setgId(String gId) {
		this.gId = gId;
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

	public void setTitle(String title) {
		this.title = title;
	}


	public double getReferencePrice() {
		return referencePrice;
	}
	
	public void setReferencePrice(double referencePrice) {
		this.referencePrice = referencePrice;
	}

	public double getPromotionPrice() {
		return promotionPrice;
	}

	public void setPromotionPrice(double promotionPrice) {
		this.promotionPrice = promotionPrice;
	}

	public double getCostPrice() {
		return costPrice;
	}

	public void setCostPrice(double costPrice) {
		this.costPrice = costPrice;
	}

	public int getIntegral() {
		return integral;
	}

	public void setIntegral(int integral) {
		this.integral = integral;
	}

	public double getTaxRate() {
		return taxRate;
	}

	public void setTaxRate(double taxRate) {
		this.taxRate = taxRate;
	}

	public double getImportTax() {
		return importTax;
	}

	public void setImportTax(double importTax) {
		this.importTax = importTax;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getIsRecommended() {
		return isRecommended;
	}

	public void setIsRecommended(int isRecommended) {
		this.isRecommended = isRecommended;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public int getCombination() {
		return combination;
	}

	public void setCombination(int combination) {
		this.combination = combination;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public int getOnsale() {
		return onsale;
	}

	public void setOnsale(int onsale) {
		this.onsale = onsale;
	}

	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getwId() {
		return wId;
	}

	public void setwId(String wId) {
		this.wId = wId;
	}

	public double getVAT() {
		return VAT;
	}

	public void setVAT(double vAT) {
		VAT = vAT;
	}

	public double getTariff() {
		return tariff;
	}

	public void setTariff(double tariff) {
		this.tariff = tariff;
	}

	public double getConsumerTax() {
		return consumerTax;
	}

	public void setConsumerTax(double consumerTax) {
		this.consumerTax = consumerTax;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
	
	
}
