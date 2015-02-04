package com.wecode.framework.exception;

/**
 * 系统级别的错误，比如当发现缺少配置文件、启动参数错误等，系统出现致命错误，无法启动等情况。
 * 
 * @author heaven.zyc 2014-2-17 下午2:45:41
 */
public class SystemException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	public SystemException(String message) {
		super(message);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}
}