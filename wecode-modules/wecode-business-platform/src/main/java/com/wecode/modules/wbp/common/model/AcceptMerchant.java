package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "accept_merchant")
public class AcceptMerchant extends BaseModel<AcceptMerchant, Integer> {

    private static final long serialVersionUID = 1L;

    public static AcceptMerchant dao = new AcceptMerchant();

    public static List<AcceptMerchant> getList(){
        String sql = " select * from accept_merchant where status='VALID'";
        return dao.find(sql);
    }
}
