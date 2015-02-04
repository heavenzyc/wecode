package com.wecode.modules.wbp.common.test;

import org.junit.After;
import org.junit.Before;

import com.jfinal.ext.plugin.config.ConfigKit;
import com.jfinal.ext.plugin.config.ConfigPlugin;
import com.jfinal.ext.plugin.tablebind.AutoTableBindPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.plugin.ehcache.EhCachePlugin;

/**
 * @author heaven.zyc 2014年6月4日 下午2:23:36
 */
public abstract class BaseTest {
	
	private DruidPlugin druidPlugin;
	private AutoTableBindPlugin dbPlugin;
	private EhCachePlugin ehCachePlugin;

	@Before
	public void setUp() throws Exception {
		try {
			new ConfigPlugin("config.xml").reload(true).start();
			//初始化数据库连接池
	    	String url = ConfigKit.getStr("jdbc.url");
	    	String username = ConfigKit.getStr("jdbc.username");
	    	String password = ConfigKit.getStr("jdbc.password");
	    	String driverClassName = ConfigKit.getStr("jdbc.driverClassName");
	        druidPlugin = new DruidPlugin(url,username,password,driverClassName);
	        druidPlugin.start();
	
	        // 配置AutoTableBindPlugin插件
	        dbPlugin = new AutoTableBindPlugin(druidPlugin);
	        dbPlugin.setShowSql(false);
	        dbPlugin.autoScan(false);
	        dbPlugin.basePackage("com.wecode");
	        dbPlugin.start();
	
	        // add EhCache
	        ehCachePlugin = new EhCachePlugin();
	        ehCachePlugin.start();
		}catch(Throwable t) {
			t.printStackTrace();
			throw new RuntimeException(t.getMessage(),t);
		}
		
	}

	@After
	public void tearDown() throws Exception {
		if(druidPlugin != null) {
			druidPlugin.stop();
		}
		if(dbPlugin != null) {
			dbPlugin.stop();
		}
		if(ehCachePlugin != null) {
			ehCachePlugin.stop();
		}
	}
}
