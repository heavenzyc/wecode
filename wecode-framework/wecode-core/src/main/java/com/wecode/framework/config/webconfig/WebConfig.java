package com.wecode.framework.config.webconfig;


import java.io.IOException;
import java.util.Iterator;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.commons.lang.StringUtils;

import com.wecode.framework.config.Config;


/**
 * 把常量设置到request中,供jsp等页面使用(如csspath,jspath等)，使用方法如下：
 * <ol>
 * <li><b>修改web.xml</b></li>
 * <pre>
 * &lt;filter&gt;
 *     &lt;filter-name&gt;WebConfig&lt;/filter-name&gt;
 *     &lt;filter-class&gt;com.example.common.filter.WebConfig&lt;/filter-class&gt;
 *     &lt;init-param&gt;
 *         &lt;param-name&gt;configFile&lt;/param-name&gt;
 *         &lt;param-value&gt;classpath:webconfig.xml&lt;/param-value&gt;
 *     &lt;/init-param&gt;
 * &lt;/filter&gt;
 * &lt;filter-mapping&gt;
 *     &lt;filter-name&gt;WebConfig&lt;/filter-name&gt;
 *     &lt;url-pattern&gt;/*&lt;/url-pattern&gt;
 * &lt;/filter-mapping&gt;
 * </pre>
 * <li><b>添加配置文件</b></li>
 * 放到/WEB-INF/classes/webconfig.xml
 * <pre>
 * &lt;?xml version="1.0" encoding="UTF-8"?&gt;
 * &lt;!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd"&gt;
 * &lt;properties&gt;
 *	&lt;comment&gt;配置文件说明&lt;/comment&gt;
 *	&lt;entry key="jspath"&gt;/html/js&lt;/entry&gt;
 *	&lt;entry key="csspath"&gt;/html/css&lt;/entry&gt;
 *	&lt;entry key="imgpath"&gt;/html/css&lt;/entry&gt;
 *	&lt;entry key="maxUploadSize"&gt;4096&lt;/entry&gt;
 * &lt;/properties&gt;
 * </pre>
 * <li><b>使用</b></li>
 * 	<ul>
 * 		<li>jsp使用:</li>
 * <pre>
 * &lt;script type="text/javascript" src="&lt;%=request.getAttribute("jspath")/test.js%&gt;"&gt;&lt;/script&gt;
 * 实际生成后即变成：
 * &lt;script type="text/javascript" src="/html/js/test.js&gt;&lt;/script&gt;
 * </pre>
 * 		<li>jsp的EL语言、freemarker：</li>
 * <pre>
 * &lt;img src="${imgpath}/user/avatar.jpg"/&gt;
 * </pre>
 * 		<li>java使用</li>
 * <pre>
 * WebConfig.me().getStr("csspath");
 * WebConfig.me().getInt("maxUploadSize");
 * </pre>
 * 	</ul>
 * </ol>
 * @author heaven.zyc 2011-5-5 下午04:17:11
 */
public class WebConfig implements Filter {

	private static final String DEFAULT_WEB_CONFIG = "classpath:webconfig.xml";

	public static final int DEFAULT_REFRESH_INTERVAL = 60;
	
	private static Config me;

	public void init(FilterConfig filterConfig) throws ServletException {
		String f = filterConfig.getInitParameter("configFile");
		if(StringUtils.isBlank(f)) {
			f = DEFAULT_WEB_CONFIG;
			System.err.println(WebConfig.class.getName() + "使用默认配置" + f);//NOSONAR 为了避免在容器启动时无法输出日志
		}
		final String configFile = f;
		int refreshInterval = DEFAULT_REFRESH_INTERVAL;
		String refreshIntervalStr = filterConfig.getInitParameter("refreshInterval");
		if(refreshIntervalStr != null && refreshIntervalStr.trim().length() > 0) {
			try {
				refreshInterval = Integer.valueOf(refreshIntervalStr);
			}catch(Exception ex) {
				System.err.println("refreshInterval参数配置错误，使用默认值:" + DEFAULT_REFRESH_INTERVAL); //NOSONAR 为了避免在容器启动时无法输出日志
			}
		}
		loadConfig(configFile, refreshInterval);
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		Config conf = WebConfig.me();
		for(Iterator<String> it = conf.getKeys(); it.hasNext();) {
			String key = it.next();
			String value = conf.getStr(key);
			request.setAttribute(key,value);
		}
		chain.doFilter(request,response);
	}

	/**
	 * 载入配置
	 * @param configFile
	 * @param refreshInterval
	 */
	public static void loadConfig(String configFile, int refreshInterval) {
		Config config = new Config();
		config.reload(configFile, refreshInterval);
		WebConfig.me = config;
	}

	/**
	 * 获取配置
	 * @return
	 */
	public static Config me() {
		return me;
	}

	public void destroy() {
		me = null;
	}
}
