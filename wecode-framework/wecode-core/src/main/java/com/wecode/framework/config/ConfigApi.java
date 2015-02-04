package com.wecode.framework.config;

import java.util.Iterator;

/**
 * @author heaven.zyc 2014年5月29日 下午2:06:29
 */
public interface ConfigApi {
	
	public String getStr(String name, String defaultValue);
	
	public String getStr(String name);
	
	public int getInt(String name, int defaultValue);
	
	public int getInt(String name);
	
	public long getLong(String name, long defaultValue);
	
	public long getLong(String name);
	
	public boolean getBoolean(String name, boolean defaultValue);
	
	public boolean getBoolean(String name);
	
	public Iterator<String> getKeys();
}
