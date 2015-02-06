package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "department")
public class Department extends BaseModel<Department, Integer> {

    private static final long serialVersionUID = 1L;

    public static Department dao = new Department();

    public static List<Department> getList(){
        String sql = " select * from department ";
        return dao.find(sql);
    }
}
