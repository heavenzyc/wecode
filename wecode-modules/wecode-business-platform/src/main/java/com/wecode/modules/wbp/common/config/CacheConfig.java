package com.wecode.modules.wbp.common.config;


/**
 * @author heaven.zyc 2014年6月9日 下午6:30:07
 */
public class CacheConfig {
	
    public static final String CACHE_QUERY = "queryCache";
	
	public static String getFileConfigCacheKey(String code) {
		return code;
	}
	
	public static String getFileConfigCacheName() {
		return "queryCache";
	}

}
