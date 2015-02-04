package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "input_info")
public class InputInfo extends BaseModel<InputInfo, Integer> {

    private static final long serialVersionUID = 1L;

    public static InputInfo dao = new InputInfo();

    public static List<InputInfo> getList(){
        String sql = " select * from input_info where status='VALID'";
        return dao.find(sql);
    }

    public static Page getPage(Integer curPage,Integer pageSize,String transport, String accepter, String weighter, Date start, Date end) {
        String sql = "select * ";
        String sqlExceptSelect = " from input_info where status='VALID' ";
        List<Object> params = new ArrayList<Object>();
        if (StringUtils.isNotBlank(transport)) {
            sqlExceptSelect += " and transport_person=? ";
            params.add(transport);
        }
        if (StringUtils.isNotBlank(accepter)){
            sqlExceptSelect += " and accept_person=? ";
            params.add(accepter);
        }
        if (StringUtils.isNotBlank(weighter)){
            sqlExceptSelect += " and weigh_person=? ";
            params.add(weighter);
        }
        if (start != null && end != null) {
            sqlExceptSelect += " and input_time>=? and input_time<=?";
            params.add(start);
            params.add(end);
        }
        sqlExceptSelect += " order by input_time desc ";
        return InputInfo.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }
}
