package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
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
@TableBind(tableName = "output_info")
public class OutputInfo extends BaseModel<OutputInfo, Integer> {

    private static final long serialVersionUID = 1L;

    public static OutputInfo dao = new OutputInfo();

    public static List<OutputInfo> getList(){
        String sql = " select * from output_info where status='VALID'";
        return dao.find(sql);
    }

    public static Page getPage(Integer curPage,Integer pageSize,String transport, String accepter, String weighter, String start, String end) {
        String sql = "select * ";
        String sqlExceptSelect = " from output_info where status='VALID' ";
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
        if (StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)) {
            sqlExceptSelect += " and output_time>=? and output_time<=?";
            params.add(start);
            params.add(end);
        }
        sqlExceptSelect += " order by output_time desc ";
        return OutputInfo.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }

    public static BigDecimal getTotalCount(){
        String hql = " select sum(count) from output_info where  status='VALID' ";
        return Db2.queryBigDecimal(hql);
    }

    public static BigDecimal getTotalMoney(){
        String hql = " select sum(money) from output_info where  status='VALID' ";
        return Db2.queryBigDecimal(hql);
    }
}
