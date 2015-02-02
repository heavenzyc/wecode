package com.wecode.modules.wbp.project.customer.service.impl;

import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.project.customer.model.ProjectCustomer;
import com.wecode.modules.wbp.project.customer.service.ProjectCustomerService;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by heaven.zyc on 14-6-11.
 */
public class ProjectCustomerServiceImpl implements ProjectCustomerService {
    @Override
    public Page<ProjectCustomer> findByProjectId(Integer curPage, Integer pageSize,Integer projectId) {
        String sql = "select *";
        String sqlExceptSelect = " from project_customer where status=1" +
                " and project_id=? and type='ATTENTION' order by create_time desc";
        return ProjectCustomer.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,projectId);
    }

    @Override
    public Page<ProjectCustomer> findIntentionListByProejctId(Integer curPage, Integer pageSize,Integer projectId) {
        String sql = "select *";
        String sqlExceptSelect = " from project_customer where status=1" +
                " and project_id=? and type='INTENTION' order by create_time desc";
        return ProjectCustomer.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,projectId);
    }

    @Override
    public Page<ProjectCustomer> findDealListByProejctId(Integer curPage,Integer pageSize, Integer projectId) {
        String sql = "select *";
        String sqlExceptSelect = " from project_customer where status=1" +
                " and project_id=? and deal=1 order by create_time desc";
        return ProjectCustomer.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,projectId);
    }

    @Override
    public List<ProjectCustomer> getAllParents(ProjectCustomer customer) {
        List<ProjectCustomer> list = new ArrayList<ProjectCustomer>();
        String path = customer.get("path");
        if (StringUtils.isBlank(path)) return list;
        String[] idStr = path.split("/");
        if (idStr.length > 2){
            for (int i=1;i<idStr.length-1;i++){
                ProjectCustomer parent = ProjectCustomer.dao.findById(Integer.parseInt(idStr[i]));
                if (parent != null){
                    list.add(parent);
                }
            }
        }
        return list;
    }

    @Override
    public int spreadIntentionCount(ProjectCustomer customer, Integer taskId) {
        String sql = "select * from project_customer where type='INTENTION' and path like ? and task_id=?";
        String customerId = "%/"+customer.getId()+"/%";
        return ProjectCustomer.dao.find(sql,customerId,taskId).size();
    }

    @Override
    public int spreadAttentionCount(ProjectCustomer customer, Integer taskId) {
        String sql = "select * from project_customer where type='ATTENTION' and path like ? and task_id=?";
        String customerId = "%/"+customer.getId()+"/%";
        return ProjectCustomer.dao.find(sql,customerId,taskId).size();
    }

    @Override
    public List<ProjectCustomer> findSpreadList(ProjectCustomer customer, Integer taskId) {
        String sql = "select * from project_customer where path like ? and task_id=?";
        String customerId = "%/"+customer.getId()+"/%";
        return ProjectCustomer.dao.find(sql,customerId,taskId);
    }
}
