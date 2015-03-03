package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "material_settle")
public class MaterialSettle extends BaseModel<MaterialSettle, Integer> {

    private static final long serialVersionUID = 1L;

    public static MaterialSettle dao = new MaterialSettle();

    public static List<MaterialSettle> getList(){
        String sql = " select * from material_settle ";
        return dao.find(sql);
    }

    public static Page<MaterialSettle> getPage(Integer curPage,Integer pageSize){
        String sql = "select * ";
        String sqlExceptSelect = " from material_settle order by id desc ";
        return MaterialSettle.dao.paginate(curPage,pageSize,sql,sqlExceptSelect);
    }

}
