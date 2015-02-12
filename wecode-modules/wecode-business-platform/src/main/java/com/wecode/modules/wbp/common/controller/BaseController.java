package com.wecode.modules.wbp.common.controller;

import com.jfinal.plugin.activerecord.Record;
import com.wecode.framework.ext.jfinal.controller.ControllerSupport;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.DateUtils;
import com.wecode.framework.util.StringUtils;

import java.text.SimpleDateFormat;
import java.util.Date;

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

    public String getSerialNum(String tableName, String prefix){
        Date date = new Date();
        String start = DateUtils.format(date, "yyyy-MM-dd 00:00:00");
        String end = DateUtils.format(date, "yyyy-MM-dd 23:59:59");
        String sql = " select * from " + tableName + " where create_time>=? and create_time<=? order by id desc ";
        Record record = Db2.findFirst(sql,start,end);
        String dateStr = DateUtils.format(date,"yyyyMMdd");
        if (record == null) return prefix+dateStr+"001";
        String code = record.getStr("code");
        Integer num = 0;
        String numStr = "001";
        if (StringUtils.isNotBlank(code) && code.length() > 3) {
            code = code.substring(code.length()-3,code.length());
            num = Integer.parseInt(code);
            num++;
            if (num < 10) {
                numStr = "00"+num;
            }else if (num >= 10 && num < 100){
                numStr = "0"+num;
            } else {
                numStr = num+"";
            }
        }
        return prefix+dateStr+numStr;
    }

    public static void main(String[] args) {
        String code = "we20140102134";
        code = code.substring(code.length()-3,code.length());
        System.out.println(Integer.parseInt(code));
    }
}
