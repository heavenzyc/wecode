package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "staff")
public class Staff extends BaseModel<Staff, Integer> {

    private static final long serialVersionUID = 1L;

    public static Staff dao = new Staff();

    public static List<Staff> getList(){
        String sql = " select * from staff where status='VALID'";
        return dao.find(sql);
    }
}
