package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;

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

    public static Page getPage(Integer curPage,Integer pageSize) {
        String sql = "select * ";
        String sqlExceptSelect = " from input_info where status='VALID' order by input_time desc ";
        return InputInfo.dao.paginate(curPage,pageSize,sql,sqlExceptSelect);
    }
}
