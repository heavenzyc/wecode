package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "material_standard")
public class MaterialStandard extends BaseModel<MaterialStandard, Integer> {

    private static final long serialVersionUID = 1L;

    public static MaterialStandard dao = new MaterialStandard();

    public static List<MaterialStandard> getList(){
        String sql = " select * from material_standard ";
        return dao.find(sql);
    }
}
