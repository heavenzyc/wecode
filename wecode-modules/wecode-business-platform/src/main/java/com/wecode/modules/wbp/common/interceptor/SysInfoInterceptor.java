package com.wecode.modules.wbp.common.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.wecode.modules.wbp.common.config.SysConfig;
import com.wecode.modules.wbp.common.controller.BaseController;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.AntPathMatcher;
import org.apache.shiro.util.PatternMatcher;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 将菜单信息注入，待优化代码
 * @author heaven.zyc 2014年5月30日 上午1:32:59
 */
public class SysInfoInterceptor implements Interceptor {
	
	private static final Logger log = LoggerFactory.getLogger(SysInfoInterceptor.class);
	
	private final static PatternMatcher matcher = new AntPathMatcher();

	@Override
	public void intercept(ActionInvocation ai) {
		ai.invoke();
		BaseController c = (BaseController) ai.getController();
		Subject subject = SecurityUtils.getSubject();
		String account = (String) subject.getPrincipal();
		if(account == null) {
			c.setAttr("msg", "请重新登录");
//	        c.forwardAction("/");
			return;
		}
		//写入配置信息对象
		c.setAttr("sysconfig", SysConfig.me());
	}


	
	public static void main(String[] args) {
		String pattern = "/admin/project/consultant/**";
		String url = "/admin/project/consultant/";
		boolean isMatch = matcher.matches(pattern, url);
		System.out.println(isMatch);
	}

}
