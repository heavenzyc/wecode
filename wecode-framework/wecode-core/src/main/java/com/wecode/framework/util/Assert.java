package com.wecode.framework.util;

import com.wecode.framework.exception.BusinessException;

/**
 * @author heaven.zyc 2014年6月27日 下午2:39:13
 */
public class Assert {
	
	public static void notNull(Object object, String message) {
		if (object == null) {
			throw new BusinessException(message);
		}
	}

	public static void isNotBlank(String str, String message) {
		if(StringUtils.isBlank(str)) {
			throw new BusinessException(message);
		}
	}

}
