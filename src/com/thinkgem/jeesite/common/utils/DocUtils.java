package com.thinkgem.jeesite.common.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.thinkgem.jeesite.common.config.Global;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class DocUtils {  
  
    private Configuration configuration = null;  
  
    public DocUtils() {  
        configuration = new Configuration();  
        configuration.setDefaultEncoding("utf-8");  
    }  
  
    /**
     * 创建doc文档
     * @param dataMap 要填入模本的数据文件 
     * @param fileName 输出文档路径及名称
     * @param templateName 模板名称
     * @throws UnsupportedEncodingException
     */
    public void createDoc(Map<String,Object> dataMap,String fileName, String templateName, HttpServletRequest request) throws UnsupportedEncodingException {  
        //dataMap 要填入模本的数据文件  
        //设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，  
        //这里我们的模板是放在template包下面  
        configuration.setClassForTemplateLoading(this.getClass(), "/templates");  
        Template t = null;  
        try {  
            //装载模板  
            t = configuration.getTemplate(templateName);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        //输出文档路径及名称  
        String dir = Global.getUploadFileDir();
    	String realPath = request.getSession().getServletContext().getRealPath(dir);
        File outFile = new File(realPath, fileName); 
        
        Writer out = null;  
        FileOutputStream fos=null;  
        try {  
            fos = new FileOutputStream(outFile);  
            OutputStreamWriter oWriter = new OutputStreamWriter(fos,"UTF-8");  
            //这个地方对流的编码不可或缺，使用main（）单独调用时，应该可以，但是如果是web请求导出时导出后word文档就会打不开，并且包XML文件错误。主要是编码格式不正确，无法解析。  
            //out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile)));  
             out = new BufferedWriter(oWriter);   
        } catch (FileNotFoundException e1) {  
            e1.printStackTrace();  
        }  
           
        try {  
            try {
				t.process(dataMap, out);
			} catch (TemplateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}  
        } finally {
        	try {
				out.close();
				fos.close(); 
			} catch (IOException e) {
			}  
        }
    }  
	    
}  
