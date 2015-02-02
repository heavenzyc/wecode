package com.wecode.modules.wbp.project.house_type.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.exception.BusinessException;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.modules.wbp.common.model.Project;

/**
 * Created by heaven.zyc on 14-6-5.
 */
@TableBind(tableName = "project_house_type")
public class ProjectHouseType extends BaseModel<ProjectHouseType,Integer> {

    private static final long serialVersionUID = 1L;

    public static ProjectHouseType dao = new ProjectHouseType();

    public static Page<ProjectHouseType> findHouseTypelist(Integer projectId, Integer curPage){
        String sql = "select * ";
        String sqlExceptSelect = " from project_house_type where status=1 and project_id=? order by create_time desc";
        return dao.paginate(curPage,4,sql,sqlExceptSelect,projectId);
    }

    /**
     * check the project_id of houseType is right
     * @param houseType
     * @param project
     */
    public static void checkSecurity(ProjectHouseType houseType,Project project){
        if (!houseType.get("project_id").equals(project.getId())){
            throw new BusinessException("当前用户没有该楼盘的权限.");
        }
    }
}
