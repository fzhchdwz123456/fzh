package com.thinkgem.jeesite.common.utils;

import java.text.DecimalFormat;

public class FormatUtils {

	public static String decimalDouble(double number) {
		DecimalFormat  df   = new DecimalFormat("######0.00");   
		return df.format(number);
	}
	
	public static String decimalDouble3(double number) {
		DecimalFormat  df   = new DecimalFormat("######0.000");   
		return df.format(number);
	}
	
	public static void main(String[] args) {
		String decimalDouble = FormatUtils.decimalDouble3(5);
		System.out.println(decimalDouble);
	}
}
