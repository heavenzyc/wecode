package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "merchant")
public class Merchant extends BaseModel<Merchant, Integer> {

    private static final long serialVersionUID = 1L;

    public static Merchant dao = new Merchant();

    public static List<Merchant> getList(){
        String sql = " select * from merchant where status='VALID'";
        return dao.find(sql);
    }
}
