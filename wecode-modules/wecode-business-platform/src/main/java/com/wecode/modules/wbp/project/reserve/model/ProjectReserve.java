package com.wecode.modules.wbp.project.reserve.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.modules.wbp.common.model.Project;
import com.wecode.modules.wbp.project.consultant.model.ProjectConsultant;
import com.wecode.modules.wbp.project.customer.model.ProjectCustomer;

import java.util.List;
import java.util.Map;

/**
 * Created by heaven.zyc on 14-6-5.
 */
@TableBind(tableName = "project_reserve")
public class ProjectReserve extends BaseModel<ProjectReserve,Integer> {

    private static final long serialVersionUID = 1L;

    public static ProjectReserve dao = new ProjectReserve();

    @Override
    protected Map<String, Object> getAttrs() {
        Map<String, Object> map = super.getAttrs();
        if (this.get("consultant_id") == null) return map;
        map.put("consultant_name",getConsultant().getStr("name"));
        return map;
    }

    public Project getProject(){
        return Project.dao.findById(this.get("project_id"));
    }

    public ProjectCustomer getCustomer(){
        return ProjectCustomer.dao.findById(this.get("customer_id"));
    }

    public ProjectConsultant getConsultant(){
        return ProjectConsultant.dao.findById(this.get("consultant_id"));
    }

    public static List<ProjectReserve> getWaitProgressList(Integer projectId){
        String sql = "select * from project_reserve where project_id=? and status=0";
        return dao.find(sql,projectId);
    }
}
