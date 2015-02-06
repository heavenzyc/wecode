package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "receive")
public class Receive extends BaseModel<Receive, Integer> {

    private static final long serialVersionUID = 1L;

    public static Receive dao = new Receive();

    public static List<Receive> getList(){
        String sql = " select * from receive where status='VALID'";
        return dao.find(sql);
    }

    public static Page<Receive> getPage(Integer curPage,Integer pageSize,String start, String end, String reciever, String approve) {
        String sql = "select * ";
        String sqlExceptSelect = " from receive where status='VALID' ";
        List<String> params = new ArrayList<String>();
        if (StringUtils.isNotBlank(reciever)) {
            sqlExceptSelect += " and receive_person=? ";
            params.add(reciever);
        }
        if (StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)) {
            sqlExceptSelect += " and receive_time>=? and receive_time<=?";
            params.add(start);
            params.add(end);
        }
        if (StringUtils.isNotBlank(approve)) {
            sqlExceptSelect += " and approve=?";
            params.add(approve);
        }
        sqlExceptSelect += " order by receive_time desc ";
        return Receive.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }
}
