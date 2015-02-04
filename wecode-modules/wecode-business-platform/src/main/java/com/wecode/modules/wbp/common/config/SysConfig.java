package com.wecode.modules.wbp.common.config;

import com.jfinal.config.Constants;
import com.jfinal.config.*;
import com.jfinal.ext.handler.UrlSkipHandler;
import com.jfinal.ext.interceptor.SessionInViewInterceptor;
import com.jfinal.ext.kit.ResourceKit;
import com.jfinal.ext.plugin.config.ConfigKit;
import com.jfinal.ext.plugin.config.ConfigPlugin;
import com.jfinal.ext.plugin.guice.GuiceInterceptor;
import com.jfinal.ext.plugin.guice.GuicePlugin;
import com.jfinal.ext.plugin.tablebind.AutoTableBindPlugin;
import com.jfinal.ext.route.AutoBindRoutes;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.FreeMarkerRender;
import com.jfinal.render.ViewType;
import com.wecode.framework.ext.jfinal.config.BaseConfig;
import com.wecode.framework.ext.jfinal.db.MysqlDialectExt;
import com.wecode.framework.ext.jfinal.handler.SessionHandler;
import com.wecode.modules.wbp.common.ext.freemarker.FreemarkerKit;
import com.wecode.modules.wbp.common.interceptor.ExceptionInterceptor;
import freemarker.template.TemplateModelException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.Properties;

/**
 * @author heaven.zyc 2014年5月28日 下午4:28:45
 */
public class SysConfig extends BaseConfig {
	
	private static final Logger log = LoggerFactory.getLogger(SysConfig.class);
	
	private static SysConfig me;
	
	public SysConfig() {
		me = this;
	}
	
	public static SysConfig me() {
		return me;
	}

    private Routes routes;

    @Override
    public void configConstant(Constants me) {
        new ConfigPlugin("config.xml").reload(true).start();

        me.setDevMode(isDevMode());
        me.setViewType(ViewType.FREE_MARKER);
        FreeMarkerRender.setProperties(loadPropertyFile("freemarker.properties"));
        me.setBaseViewPath(ConfigKit.getStr("app.baseviewpath", "/WEB-INF/views"));
    }

	public boolean isDevMode() {
		return ConfigKit.getBoolean("app.devMode", false);
	}
	
	@Override
	public Properties loadPropertyFile(String file) {
		try {
			return super.loadPropertyFile(file);
		}catch(Exception ex) {
			Properties p = new Properties();
			p.putAll(ResourceKit.readProperties(file));
			return p;
		}
	}

    @Override
    public void configRoute(Routes me) {
        this.routes = me;
        // 自动扫描 建议用注解
        AutoBindRoutes autoBindRoutes = new AutoBindRoutes();
        me.add(autoBindRoutes.autoScan(false));
    }

    @Override
    public void configPlugin(Plugins me) {
    	//初始化数据库连接池
    	String url = ConfigKit.getStr("jdbc.url");
    	String username = ConfigKit.getStr("jdbc.username");
    	String password = ConfigKit.getStr("jdbc.password");
    	String driverClassName = ConfigKit.getStr("jdbc.driverClassName");
        DruidPlugin druidPlugin = new DruidPlugin(url,username,password,driverClassName);
        me.add(druidPlugin);

        // 配置AutoTableBindPlugin插件
        AutoTableBindPlugin atbp = new AutoTableBindPlugin(druidPlugin);
        if (isDevMode()) {
//            atbp.setShowSql(true);
        }
        atbp.basePackage("com.wecode");
        atbp.autoScan(false);
        atbp.setDialect(new MysqlDialectExt());
        me.add(atbp);

        GuicePlugin guicePlugin = new GuicePlugin();
        me.add(guicePlugin);
    }

    @Override
    public void configInterceptor(Interceptors me) {
        // 让 模版 可以使用session
        me.add(new SessionInViewInterceptor());
        
//        me.add(new SysInfoInterceptor());
        
        me.add(new ExceptionInterceptor());
        me.add(new GuiceInterceptor());

    }

    @Override
    public void configHandler(Handlers me) {
    	//对于api开头的，不使用jfinal进行处理
    	me.add(new UrlSkipHandler("/api.*", false));
        // 去掉 jsessionid 防止找不到action
        me.add(new SessionHandler());
    }
    
    @Override
    public void afterJFinalStart() {
    	//文件路径处理
        try {
			FreeMarkerRender.getConfiguration().setSharedVariable("kit", FreemarkerKit.me());
		} catch (TemplateModelException e) {
			log.error("初始化freemarker变量失败:" + e.getMessage(), e);
		}
    }

}
