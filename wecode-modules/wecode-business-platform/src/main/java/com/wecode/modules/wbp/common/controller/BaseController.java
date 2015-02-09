package com.wecode.modules.wbp.common.controller;

import com.wecode.framework.ext.jfinal.controller.ControllerSupport;
import com.wecode.framework.json.JsonResult;

/**
 * @author heaven.zyc 2014年5月29日 下午4:52:33
 */
public class BaseController extends ControllerSupport{

	/**
	 * 渲染json
	 * @param jsonResult
	 */
	public void renderJson(JsonResult jsonResult) {
		super.renderJson(jsonResult.toJson());
	}
	
    public void forwardAction(String msg, String url) {
        setAttr("msg", msg);
        forwardAction(url);
    }
    
    public void renderTop(String url) {

        renderHtml("<html><script> window.open('" + url + "','_top') </script></html>");

    }

    public String currentTimeMillis(){
        return System.currentTimeMillis()+"";
    }

}
