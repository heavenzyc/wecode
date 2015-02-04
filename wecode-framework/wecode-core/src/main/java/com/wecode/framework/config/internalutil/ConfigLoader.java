package com.wecode.framework.config.internalutil;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.configuration.AbstractConfiguration;
import org.apache.commons.configuration.CompositeConfiguration;
import org.apache.commons.configuration.ConfigurationException;
import org.apache.commons.configuration.XMLConfiguration;
import org.apache.commons.configuration.XMLPropertiesConfiguration;
import org.apache.commons.configuration.reloading.FileChangedReloadingStrategy;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.util.ResourceUtils;

import com.wecode.framework.exception.SystemException;

/**
 * 用于载入配置文件，并且会自动刷新。如：
 *
 * <pre>
 * XMLPropertiesConfiguration config = ConfigLoader.loadXMLPropertiesConfiguration("classpath:config.xml",60);
 * int sysuserid = config.getInt("sys.userid", 10001);
 * boolean devmode = config.getBoolean("dev.mode",false);
 * double xxx = config.getDouble("xxxx");
 * ...
 * </pre>
 *
 * @author heaven.zyc 2011-5-5 下午04:25:26
 */
public class ConfigLoader {

	private static final Logger log = LoggerFactory.getLogger(ConfigLoader.class);

	/**
	 * 载入指定路径的配置文件
	 *
	 * @param configFile
	 *            文件路径，如"classpath:config.xml"、"classpath: config/*.config.xml"<br>
	 *            该文件形如：
	 *
	 *            <pre>
	 * &lt;?xml version="1.0" encoding="UTF-8"?&gt;
	 * &lt;!DOCTYPE properties SYSTEM "http://java.sun.com/dtd/properties.dtd"&gt;
	 * &lt;properties&gt;
	 * &lt;comment&gt;配置文件说明&lt;/comment&gt;
	 * &lt;entry key="jspath"&gt;/html/js&lt;/entry&gt;
	 * &lt;entry key="csspath"&gt;/html/css&lt;/entry&gt;
	 * &lt;entry key="sys.userid"&gt;100001&lt;/entry&gt;
	 * &lt;entry key="dev.mode"&gt;true&lt;/entry&gt;
	 * &lt;/properties&gt;
	 * </pre>
	 * @param refreshSeconds
	 *            刷新配置文件的时间，单位是秒
	 * @return XMLPropertiesConfiguration
	 * @throws RuntimeException
	 *             当无法找到配置文件、或者读取错误时
	 */
	public static XMLPropertiesConfiguration loadXMLPropertiesConfiguration(String configFiles, int refreshSeconds) throws SystemException {
		// 最少是1秒钟刷新一次
		if (refreshSeconds < 1) {
			refreshSeconds = 1;
		}
		XMLPropertiesConfiguration config = new XMLPropertiesConfiguration();
		Resource[] resources = getResources(configFiles);
		for (Resource res : resources) {
			XMLPropertiesConfiguration cfg = loadConfig(res, refreshSeconds);
			config.append(cfg);
		}
		return config;
	}

	/**
	 * 载入指定路径的单个配置文件
	 * @param configFile
	 * @param refreshSeconds
	 * @return
	 * @throws SystemException
	 */
	public static XMLPropertiesConfiguration loadSingleXMLPropertiesConfiguration(String configFile, int refreshSeconds) throws SystemException {
		//最少是1秒钟刷新一次
		if(refreshSeconds < 1) {
			refreshSeconds = 1;
		}
		URL url;
		try {
			url = ResourceUtils.getURL(configFile);
		} catch (FileNotFoundException e) {
			log.error("缺少" + configFile,e);
			throw new SystemException("缺少配置文件:" + configFile);
		}
		XMLPropertiesConfiguration config;
		try {
			config = new XMLPropertiesConfiguration(url);
		} catch (ConfigurationException e) {
			log.error("配置文件错误, file: " + configFile + ", cause :" + e.getMessage(),e);
			throw new SystemException("配置文件错误, file: " + configFile + ", cause :" + e.getMessage());
		}
		FileChangedReloadingStrategy reloadingStrategy = new FileChangedReloadingStrategy();
		long refreshDelay = 1000 * refreshSeconds;
		reloadingStrategy.setRefreshDelay(refreshDelay);
		config.setReloadingStrategy(reloadingStrategy);
		return config;
	}

	public static AbstractConfiguration loadXMLConfiguration(String configFiles) throws RuntimeException {
		CompositeConfiguration config = new CompositeConfiguration();

		Resource[] resources = getResources(configFiles);
		for (Resource res : resources) {
			XMLConfiguration cfg = loadXmlConfig(res, -1);//不自动刷新
			config.append(cfg);
		}
		return config;
	}

	private static XMLConfiguration loadXmlConfig(Resource res, int refreshSeconds) {
		URL url;
		try {
			url = res.getURL();
		} catch (FileNotFoundException e) {
			log.error("缺少配置文件: " + res, e);
			return null;
		} catch (IOException e) {
			log.error("配置文件错误: " + res, e);
			return null;
		}
		XMLConfiguration config;
		try {
			config = new XMLConfiguration(url);
		} catch (ConfigurationException e) {
			log.error("配置文件错误, file: " + url + ", cause :" + e.getMessage(), e);
			return null;
		}
		if(refreshSeconds >= 0) {
			FileChangedReloadingStrategy reloadingStrategy = new FileChangedReloadingStrategy();
			long refreshDelay = 1000 * refreshSeconds;
			reloadingStrategy.setRefreshDelay(refreshDelay);
			config.setReloadingStrategy(reloadingStrategy);
		}
		return config;
	}

	private static XMLPropertiesConfiguration loadConfig(Resource res, int refreshSeconds) {
		URL url;
		try {
			url = res.getURL();
		} catch (FileNotFoundException e) {
			log.error("缺少配置文件: " + res, e);
			return null;
		} catch (IOException e) {
			log.error("配置文件错误: " + res, e);
			return null;
		}
		XMLPropertiesConfiguration config;
		try {
			config = new XMLPropertiesConfiguration(url);
		} catch (ConfigurationException e) {
			log.error("配置文件错误, file: " + url + ", cause :" + e.getMessage(), e);
			return null;
		}
		FileChangedReloadingStrategy reloadingStrategy = new FileChangedReloadingStrategy();
		long refreshDelay = 1000 * refreshSeconds;
		reloadingStrategy.setRefreshDelay(refreshDelay);
		config.setReloadingStrategy(reloadingStrategy);
		return config;
	}

	public static Resource[] getResources(String configLocations) {
		String[] configs = StringUtils.split(configLocations, ",");
		List<Resource> list = new ArrayList<Resource>();
		for (String config : configs) {
			ResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
			try {
				Resource[] resources = resolver.getResources(config.trim());
				list.addAll(Arrays.asList(resources));
			} catch (IOException e) {
				log.error("无法读取配置文件:" + config, e);
			}
		}
		if(list.isEmpty()) {
			log.warn("没有有效的配置文件，location=" + configLocations);
		}
		return list.toArray(new Resource[0]);
	}
}
