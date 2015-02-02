package com.jfinal.ext.plugin.guice;

import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import com.google.common.collect.Lists;
import com.google.inject.Binder;
import com.google.inject.Guice;
import com.google.inject.Injector;
import com.google.inject.Module;
import com.google.inject.matcher.Matchers;
import com.jfinal.ext.kit.ClassSearcher;
import com.jfinal.log.Logger;
import com.jfinal.plugin.IPlugin;

public class GuicePlugin implements IPlugin {

    protected final Logger log = Logger.getLogger(getClass());

    private static Injector guice;
    private List<Class<? extends Object>> excludeClasses = Lists.newArrayList();
    private List<String> includeJars = Lists.newArrayList();
    private boolean includeAllJarsInLib;

    // 绑定注入的map
    @SuppressWarnings("rawtypes")
    private HashMap<Class, Class> bindMap;

    /**
     * 默认构造函数 初始化绑定注入map
     */
    @SuppressWarnings("rawtypes")
    public GuicePlugin() {
        bindMap = new HashMap<Class, Class>();
    }

    /**
     * 绑定依赖
     * 
     * @param bindSrc
     * @param bindTo
     */
    public void bind(Class<?> bindSrc, Class<?> bindTo) {
        bindMap.put(bindSrc, bindTo);
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    public GuicePlugin addExcludeClasses(Class<? extends Object>... clazzes) {
        for (Class<? extends Object> clazz : clazzes) {
            excludeClasses.add(clazz);
        }
        return this;
    }

    @SuppressWarnings("rawtypes")
    public GuicePlugin addExcludeClasses(List<Class<? extends Object>> clazzes) {
        if (clazzes != null) {
            excludeClasses.addAll(clazzes);
        }
        return this;
    }

    public GuicePlugin addJars(List<String> jars) {
        if (jars != null) {
            includeJars.addAll(jars);
        }
        return this;
    }

    public GuicePlugin addJars(String... jars) {
        if (jars != null) {
            for (String jar : jars) {
                includeJars.add(jar);
            }
        }
        return this;
    }

    /**
     * 封装guice中的getInstance
     * 
     * @param clazz
     * @return
     */
    public static <T> T getInstance(Class<T> clazz) {
        return guice.getInstance(clazz);
    }

    @Override
    public boolean start() {
        List<Class<? extends Object>> modelClasses = ClassSearcher.of(Object.class).injars(includeJars)
                .includeAllJarsInLib(includeAllJarsInLib).search();
        GuiceService gc = null;
        for (Class modelClass : modelClasses) {
            if (excludeClasses.contains(modelClass)) {
                continue;
            }
            gc = (GuiceService) modelClass.getAnnotation(GuiceService.class);
            String tableName;
            if (gc != null) {
                this.bindMap.put(modelClass, gc.value());
                log.debug("bindMap(" + modelClass.getSimpleName() + ", " + gc.value().getSimpleName() + ")");
            }
        }

        guice = Guice.createInjector(new Module() {
            @SuppressWarnings("unchecked")
            @Override
            public void configure(Binder binder) {
                for (@SuppressWarnings("rawtypes")
                Entry<Class, Class> entry : bindMap.entrySet()) {
                    binder.bind(entry.getKey()).to(entry.getValue());
                }
                binder.bindInterceptor(Matchers.any(), Matchers.annotatedWith(Tx.class), new TxInterceptor());
            }
        });
        return true;
    }

    @Override
    public boolean stop() {
        return true;
    }
}
