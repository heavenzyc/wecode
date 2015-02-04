package com.wecode.modules.wbp.common.ext.freemarker;

import java.util.Date;

/**
 * freemarker帮助类
 * @author heaven.zyc 2014年6月10日 下午2:58:06
 */
public class FreemarkerKit {
	
	private static final FreemarkerKit me = new FreemarkerKit();
	
	/**
	 * 获取当前时间
	 * <blockquote>
	 * <pre>
	 * ${kit.now()?string("yyyy-MM-dd HH:mm:ss")}
	 * ==> 2014-06-10 15:16:18
	 * </pre>
	 * </blockquote>
	 * @return
	 */
	public Date now() {
		return new Date();
	}
	
	public static FreemarkerKit me() {
		return me;
	}
}
