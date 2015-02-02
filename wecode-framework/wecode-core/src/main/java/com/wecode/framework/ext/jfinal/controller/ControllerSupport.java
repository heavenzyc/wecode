package com.wecode.framework.ext.jfinal.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.core.Controller;
import com.wecode.framework.json.JsonResult;

/**
 * @author heaven.zyc 2014年6月2日 下午4:13:33
 */
public class ControllerSupport extends Controller {
	
	private static final Logger log = LoggerFactory.getLogger(ControllerSupport.class);
	
	/**
	 * 获取shiro的session值（比普通的httpsession具备更多特性，如分布式）
	 * @param key
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected <T> T getShiroSessionAttr(String key) {
		Subject subject = SecurityUtils.getSubject();
		Session s = subject.getSession(false);
		if(s == null) {
			return null;
		}
		return (T) s.getAttribute(key);
	}
	
	/**
	 * 设置shiro的session值（比普通的httpsession具备更多特性，如分布式）
	 * @param key
	 * @return
	 */
	protected void setShiroSessionAttr(String key, Object value) {
		Subject subject = SecurityUtils.getSubject();
		Session s = subject.getSession(false);
		if(s == null) {
			return;
		}
		s.setAttribute(key, value);
	}
	
	/**
	 * 渲染json
	 * @param jsonResult
	 */
	public void renderJson(JsonResult jsonResult) {
		String js = jsonResult.toJson();
		log.debug("renderJson:" + js);
		super.renderJson(js);
	}
	
	@Override
	public Integer[] getParaValuesToInt(String name) {
		String[] values = getRequest().getParameterValues(name);
		if (values == null)
			return null;
		Integer[] result = new Integer[values.length];
		for (int i=0; i<result.length; i++)
			result[i] = NumberUtils.toInt(values[i]);
		return result;
	}
	
	@Override
	public Integer getParaToInt() {
		try {
			return super.getParaToInt();
		}catch(Exception ex) {
			return null;
		}
	}
	
	/**
	 * 获取为时间格式
	 * <br/>尝试以下类型：
	 * yyyy-MM-dd HH:mm:ss.SSS
	 * yyyy-MM-dd HH:mm:ss.S
	 * yyyy-MM-dd HH:mm:ss
	 * yyyy-MM-dd
	 * @param para
	 * @return
	 */
	public Date asDate(String para) {
		Object value = this.getPara(para);
		if(value instanceof Date) {
			return (Date)value;
		}
		if(value instanceof Timestamp) {
			return (Timestamp)value;
		}
		if(value instanceof java.sql.Date) {
			return (java.sql.Date)value;
		}
		if(value instanceof String) {
			try {
				return DateUtils.parseDate((String) value, new String[] {
					"yyyy-MM-dd HH:mm:ss.SSS",
					"yyyy-MM-dd HH:mm:ss.S",
					"yyyy-MM-dd HH:mm:ss",
					"yyyy-MM-dd"
				});
			} catch (ParseException e) {
				long v = NumberUtils.toLong((String)value,-1);
				if(v != -1) {
					return new Date(v);
				}
				return null;
			}
		}
		if(value instanceof Number) {
			long v = ((Number)value).longValue();
			return new Date(v);
		}
		return null;
	}

	public BigDecimal getBigDecimal(String para){
		String value = super.getPara(para);
		try {
			BigDecimal big = new BigDecimal(value);
			return big;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return BigDecimal.ZERO;
	}
}
