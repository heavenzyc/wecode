package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "provide_merchant")
public class ProvideMerchant  extends BaseModel<ProvideMerchant, Integer> {

    private static final long serialVersionUID = 1L;

    public static ProvideMerchant dao = new ProvideMerchant();

    public static List<ProvideMerchant> getList(){
        String sql = " select * from provide_merchant where status='VALID'";
        return dao.find(sql);
    }

    public static ProvideMerchant getByCode(String code){
        String sql = "select * from provide_merchant where code=?";
        return dao.findFirst(sql,code);
    }
}
