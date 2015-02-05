package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.math.BigDecimal;
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

    public static Page getPage(Integer curPage,Integer pageSize,String transport, String accepter, String weighter, String start, String end) {
        String sql = "select * ";
        String sqlExceptSelect = " from input_info where status='VALID' ";
        List<String> params = new ArrayList<String>();
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
        if (StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)) {
            sqlExceptSelect += " and input_time>=? and input_time<=?";
            params.add(start);
            params.add(end);
        }
        sqlExceptSelect += " order by input_time desc ";
        return InputInfo.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }

    public static BigDecimal getTotalCount(){
        String hql = " select sum(count) from input_info where  status='VALID' ";
        return Db2.queryBigDecimal(hql);
    }

    public static BigDecimal getTotalMoney(){
        String hql = " select sum(money) from input_info where  status='VALID' ";
        return Db2.queryBigDecimal(hql);
    }
}
