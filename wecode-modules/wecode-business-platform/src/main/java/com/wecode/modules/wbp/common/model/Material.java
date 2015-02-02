package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "material")
public class Material extends BaseModel<Material, Integer> {

    private static final long serialVersionUID = 1L;

    public static Material dao = new Material();

    public static List<Material> getList(){
        String sql = " select * from material where status='VALID'";
        return dao.find(sql);
    }

    public static Material getByCode(String code){
        String sql = "select * from material where code=?";
        return dao.findFirst(sql,code);
    }
}
