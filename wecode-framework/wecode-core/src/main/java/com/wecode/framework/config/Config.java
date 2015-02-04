package com.wecode.framework.config;

import java.util.Iterator;

import org.apache.commons.configuration.XMLPropertiesConfiguration;

import com.wecode.framework.config.internalutil.ConfigLoader;
import com.wecode.framework.exception.SystemException;

/**
 * @author heaven.zyc 2014年5月29日 下午4:07:30
 */
public class Config implements ConfigApi{
	
	private XMLPropertiesConfiguration config;

	public void reload(String xmlPropertiesFile, int refreshInterval) {
		XMLPropertiesConfiguration conf = ConfigLoader.loadSingleXMLPropertiesConfiguration(xmlPropertiesFile, refreshInterval);
		this.config = conf;
	}
	
	private void assertInit() {
		if(config == null) {
			throw new SystemException("Please init the Config first.");
		}
	}

	@Override
	public String getStr(String name, String defaultValue) {
		assertInit();
		return config.getString(name, defaultValue);
	}

	@Override
	public String getStr(String name) {
		return this.getStr(name, null);
	}

	@Override
	public int getInt(String name, int defaultValue) {
		assertInit();
		return config.getInt(name, defaultValue);
	}

	@Override
	public int getInt(String name) {
		return this.getInt(name, 0);
	}

	@Override
	public long getLong(String name, long defaultValue) {
		assertInit();
		return config.getLong(name, defaultValue);
	}

	@Override
	public long getLong(String name) {
		return this.getLong(name, 0);
	}

	@Override
	public boolean getBoolean(String name, boolean defaultValue) {
		assertInit();
		return config.getBoolean(name, defaultValue);
	}

	@Override
	public boolean getBoolean(String name) {
		return this.getBoolean(name, false);
	}

	@Override
	public Iterator<String> getKeys() {
		return config.getKeys();
	}

}
