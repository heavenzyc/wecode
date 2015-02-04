package com.wecode.modules.wbp.common;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

/**
 * @author heaven.zyc 2014年7月11日 下午1:05:17
 */
public class WebKit {

	@SuppressWarnings("unchecked")
	public static <T> T getShiroSessionAttr(String key) {
		Subject subject = SecurityUtils.getSubject();
		Session s = subject.getSession(false);
		if(s == null) {
			return null;
		}
		return (T) s.getAttribute(key);
	}

}
