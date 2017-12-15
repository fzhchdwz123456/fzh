package com.thinkgem.jeesite.common.utils.email.entity;

import java.util.List;

/**
 * 邮件对象
 * @author wu
 *
 */
public class EmailMessage {

	/**
	 * 邮件主题
	 */
	private String subject;
	/**
	 * 邮件内容
	 */
	private String content;
	/**
	 * 发送对象
	 */
	private String to;
	
	/**
	 * 抄送对象
	 */
//	private String cc;
	
	/**
	 * 发送附件
	 */
	private List<String> files;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTo() {
		return to;
	}

	public void setTo(String to) {
		this.to = to;
	}

//	public String getCc() {
//		return cc;
//	}
//
//	public void setCc(String cc) {
//		this.cc = cc;
//	}

	public List<String> getFiles() {
		return files;
	}

	public void setFiles(List<String> files) {
		this.files = files;
	}
}
