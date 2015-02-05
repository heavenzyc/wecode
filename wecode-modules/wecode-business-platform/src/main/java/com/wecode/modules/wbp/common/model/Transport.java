package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.interceptor.pageinfo.PageInfo;
import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by heaven.zyc on 2015/2/5.
 */
@TableBind(tableName = "transport")
public class Transport extends BaseModel<Transport,Integer> {

    private static final long serialVersionUID = 1L;

    public static Transport dao = new Transport();

//    按装货、卸货日期查询，运输人，收货人，过磅人
    public static Page<Transport> getPage(Integer curPage,Integer pageSize,String transportTimeStart,String transportTimeEnd, String offTimeStart,String offTimeEnd,String sender, String accepter) {
        String sql = " select * ";
        StringBuffer sqlExceptSelect = new StringBuffer(" from transport where status='VALID' ");
        List<String> params = new ArrayList<String>();
        if (StringUtils.isNotBlank(transportTimeStart) && StringUtils.isNotBlank(transportTimeEnd)){
            sqlExceptSelect.append(" and send_time>=? and send_time<=?");
            params.add(transportTimeStart);
            params.add(transportTimeEnd);
        }
        if (StringUtils.isNotBlank(offTimeStart) && StringUtils.isNotBlank(offTimeEnd)) {
            sqlExceptSelect.append(" and off_time>=? and off_time<=?");
            params.add(offTimeStart);
            params.add(offTimeEnd);
        }
        if (StringUtils.isNotBlank(sender)) {
            sqlExceptSelect.append(" and send_person=?");
            params.add(sender);
        }
        if (StringUtils.isNotBlank(accepter)) {
            sqlExceptSelect.append(" and accept_person=?");
            params.add(accepter);
        }
        sqlExceptSelect.append(" order by create_time desc");
        return dao.paginate(curPage,pageSize,sql,sqlExceptSelect.toString(),params.toArray());
    }
}
