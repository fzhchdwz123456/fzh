package com.thinkgem.jeesite.common.utils;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;

import java.io.IOException;

public class SmsUtils {

	private static String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
	private static String username="cf_kidd";
	private static String password="20044445";
		
	public static void main(String [] args) {
		SmsUtils smsUtils = new SmsUtils();
		smsUtils.sendCode("15867816056","136758");	
	}
	
	// 发送普通消息
	private void send(String content, String mobile){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		
		// 短信请求数据
	    NameValuePair[] data = {                          //提交短信
			    new NameValuePair("account", username), 
			    new NameValuePair("password", password),     //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", mobile),     // 接收方手机号
			    new NameValuePair("content", content),    // 发送短信的内容
		};
	    
	    method.setRequestBody(data);		
		
		try {
			// 发送请求
			client.executeMethod(method);	
			
			// 获取回复结果
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			
			if(code == "2"){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
		
	}
	
	// 发送验证码
	public void sendCode(String mobile,String mobile_code){
		HttpClient client = new HttpClient(); 
		PostMethod method = new PostMethod(Url); 
			
		//client.getParams().setContentCharset("GBK");		
		client.getParams().setContentCharset("UTF-8");
		method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");

		

		//System.out.println(mobile);
		
		// 短信内容
	    String content = new String("您的验证码是："+ mobile_code +"。请不要把验证码泄露给其他人。如非本人操作，可不用理会！"); 
	    
	    // 短信请求数据
	    NameValuePair[] data = {                          //提交短信
			    new NameValuePair("account", username), 
			    new NameValuePair("password", password),     //密码可以使用明文密码或使用32位MD5加密
			    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
			    new NameValuePair("mobile", mobile),     // 接收方手机号
			    new NameValuePair("content", content),    // 发送短信的内容
		};
	    
	    method.setRequestBody(data);		
		
		try {
			// 发送请求
			client.executeMethod(method);	
			
			// 获取回复结果
			String SubmitResult =method.getResponseBodyAsString();
					
			//System.out.println(SubmitResult);

			Document doc = DocumentHelper.parseText(SubmitResult); 
			Element root = doc.getRootElement();


			String code = root.elementText("code");	
			String msg = root.elementText("msg");	
			String smsid = root.elementText("smsid");	
			
			
			System.out.println(code);
			System.out.println(msg);
			System.out.println(smsid);
			
			if(code == "2"){
				System.out.println("短信提交成功");
			}
			
		} catch (HttpException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		}	
	}
}
