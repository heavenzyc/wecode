package com.wecode.framework.ext.jfinal.controller;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.jfinal.ext.render.FreeMarkerXMLRender;
import com.jfinal.ext.render.excel.PoiRender;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.render.Render;
import com.wecode.framework.util.StringUtils;

public class Controller<T> extends com.jfinal.core.Controller {
    /**
     * 默认 jsp 视图
     */
    public static final String VIEW_TYPE = ".ftl";

    ControllerBind controll;

    public Controller() {
        controll = this.getClass().getAnnotation(ControllerBind.class);
    }

    /***
     * 默认读取 注解来 转发到 约定的 视图
     * 
     * 其他人最好别用
     */
    public void index() {
        if (controll != null) {
            String key = controll.controllerKey();
            String viewpath = controll.viewPath();
            if (!StringUtils.isEmpty(key, viewpath) && key.contains("/")) {
                String index = key.split("/")[key.split("/").length - 1] + VIEW_TYPE;
                render(viewpath + "/" + index);
            }
        }
    }

    public T getModel() {
        ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
        Class modelClass = (Class) pt.getActualTypeArguments()[0];

        return (T) super.getModel(modelClass);
    }

    public void renderExcel(List<?> data, String fileName, String[] headers) {

        PoiRender excel = PoiRender.me(data);
        excel.fileName(fileName);
        excel.headers(headers);
        excel.cellWidth(5000);
        render(excel);
    }

    public void renderJsonResult(boolean result) {
        if (result)
            renderJson200();
        else
            renderJson500();
    }

    public void renderJson500() {
        renderText("{\"msg\":\"没有任何修改或 服务器错误\"}");
    }

    public void renderJsonError(String msg) {
        renderText("{\"msg\":\" " + msg + " \"}");
    }

    public void renderJson200() {
        renderText("{\"code\":200}");
    }

    public void delete() {
    }

    public void list() {
    }

    public void saveOrUpdate() {
    }

    public void add() {

    }

    public void edit() {

    }

    public void forwardAction(String msg, String url) {

        setAttr("msg", msg);
        forwardAction(url);
    }

    public void render(String msg, String url) {
        setAttr("msg", msg);
        render(url);
    }

    // public void renderBeetl(String view)

    // {

    //

    // render(new BeetlRender(BeetlRenderFactory.groupTemplate, view));

    // }

    public void renderTop(String url) {

        renderHtml("<html><script> window.open('" + url + "','_top') </script></html>");

    }

    /***
     * 
     * 什么时候用 gson 呐
     * 
     * 如果是 原生的 List<Model> 直接返回即可 用 renderJson
     * 
     * 
     * @param obj
     */
    public void renderGson(Object obj) {

        renderJson(new Gson().toJson(obj));
    }

    /***
     * 
     * 好像有个问题
     * 
     * @param obj
     */
    public void renderFastJson(Object obj) {
        renderJson(JSON.toJSONString(obj));
    }
    
    public Render getFreeMarkerXMLRender(String view) {
        return new FreeMarkerXMLRender(view);
    }
}
