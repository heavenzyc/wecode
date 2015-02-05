package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "transport_merchant")
public class TransportMerchant extends BaseModel<TransportMerchant, Integer> {

    private static final long serialVersionUID = 1L;

    public static TransportMerchant dao = new TransportMerchant();

    public static List<TransportMerchant> getList(){
        String sql = " select * from transport_merchant ";
        return dao.find(sql);
    }
}
