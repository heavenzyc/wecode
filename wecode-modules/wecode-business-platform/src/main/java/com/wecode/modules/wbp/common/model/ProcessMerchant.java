package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "process_merchant")
public class ProcessMerchant extends BaseModel<ProcessMerchant, Integer> {

    private static final long serialVersionUID = 1L;

    public static ProcessMerchant dao = new ProcessMerchant();

    public static List<ProcessMerchant> getList(){
        String sql = " select * from process_merchant ";
        return dao.find(sql);
    }
}
