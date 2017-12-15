package com.thinkgem.jeesite.common.utils.license;


public class licenseCreateTest {
	public static void main(String[] args) throws Exception{
		CreateLicense cLicense = new CreateLicense();
		//获取参数
		cLicense.setParam("./param.properties");
		//生成证书
		cLicense.create();
	}
}
