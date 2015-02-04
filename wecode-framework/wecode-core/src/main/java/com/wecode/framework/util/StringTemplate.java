package com.wecode.framework.util;

import java.io.StringReader;
import java.io.StringWriter;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.wecode.framework.collections.KV;

import freemarker.core.Environment;
import freemarker.ext.beans.BeansWrapper;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * 字符串模板工具类
 * usage
 *
 * <pre>
 * // 使用
 * Map&lt;String, Object&gt; map = new HashMap&lt;String, Object&gt;();
 * map.put(&quot;username&quot;, &quot;vicky&quot;);
 * StringTemplate.replace(str,map); ==> Hello, world!
 * //简单的方式
 * StringTemplate.replace("Hello, ${name}!","name","world"); ==> Hello, world!
 * </pre>
 *
 * @author heaven.zyc 2014-1-21 上午10:34:19
 */
public class StringTemplate {

	private static final Logger log = LoggerFactory.getLogger(StringTemplate.class);

	private static Configuration config;

	static {
		initFreemarkerConfig();
	}

//	public static void process(Object data, String templatePath, Writer out) {
//		initFreemarkerConfig();
//		Configuration config = freemarkerConfig.getConfiguration();
//		try {
//			Template template = config.getTemplate(templatePath);
//			Environment env = template.createProcessingEnvironment(data, out);
//			// 增加静态变量、枚举值的引入
//			env.setGlobalVariable("statics", BeansWrapper.getDefaultInstance().getStaticModels());
//			env.setGlobalVariable("enums", BeansWrapper.getDefaultInstance().getEnumModels());
//			env.process();
//			out.close();
//		} catch (Exception e) {
//			log.error("模板渲染错误,templatePath=" + templatePath + ", case by " + e.getMessage(), e);
//			throw new RuntimeException("模板渲染错误,templatePath=" + templatePath + ", case by " + e.getMessage());
//		}
//	}

	/**
	 * 字符串替换,使用强大的freemarker
	 *
	 * <pre>
	 * String str = "Hello, ${name}!";
	 * Map map = new HashMap();
	 * map.put("name","world");
	 * replace(str,map); ==> Hello, world!;
	 * </pre>
	 *
	 * @param str 要替换的模板
	 * @param data 数据，可以是javabean、map等
	 * @return
	 * @author heaven.zyc
	 * @since 2011-11-12
	 */
	public static String replace(String str, Object data) {
		try {
			if(data == null) {
				data = new Object();
			}
			Template template = new Template(str, new StringReader(str), config);
			template.setEncoding("utf-8");
			StringWriter out = new StringWriter(str.length());

			// 增加静态变量、枚举值的引入
			Environment env = template.createProcessingEnvironment(data, out);
			env.setGlobalVariable("statics", BeansWrapper.getDefaultInstance().getStaticModels());
			env.setGlobalVariable("enums", BeansWrapper.getDefaultInstance().getEnumModels());
//			template.process(data, out);
			env.process();
			return out.toString();
		} catch (Exception e) {
			log.error("---字符串替换失败---");
			log.error("replace error, str: " + str);
			log.error("replace error, data: " + data);
			log.error("replace error, cause by: " + e.getMessage(), e);
			throw new RuntimeException("字符串替换失败:\n\ttemplate=" + str + ",\n\tdata=" + data + ",\n\tcause by: " + e.getMessage());
		}
	}

	/**
	 * 字符串替换
	 * <pre>
	 * replace("Hello, ${name}!","name","world"); ==> Hello, world!;
	 * </pre>
	 *
	 * @param str 要替换的模板
	 * @param pairs 键值对形式的参数，对应模板的变量。键必须是string类型，值可以是任意类型
	 * @return
	 */
	public static String replace(String str, Object... pairs) {
		KV kv = new KV(pairs);
		return replace(str, kv);
	}

	public static void setFreemarkerConfig(Configuration config) {
		StringTemplate.config = config;
	}

	private static void initFreemarkerConfig() {
		if (config == null) {
			config = new Configuration();
			try {
				config.setSetting("locale","zh_CN");
				config.setSetting("number_format","#");
				config.setSetting("date_format","yyyy-MM-dd");
				config.setSetting("time_format","HH:mm:ss");
				config.setSetting("datetime_format","yyyy-MM-dd HH:mm:ss");
				config.setSetting("template_exception_handler","ignore");
				config.setSetting("whitespace_stripping", "true");
//				config.setEncoding(Locale.CHINA, "utf-8");
			} catch (TemplateException e) {
				log.error("初始化StringTemplate失败,cause by:" + e.getMessage(), e);
			}
		}
//		if (config == null || config.getConfiguration() == null) {
//			throw new RuntimeException("模板处理失败,请先配置 freemarkerConfig");
//		}
	}

	public static void main(String[] args) {
		String str = replace("Hello, ${name}!","name","world");
		System.out.println(str);
	}

}
