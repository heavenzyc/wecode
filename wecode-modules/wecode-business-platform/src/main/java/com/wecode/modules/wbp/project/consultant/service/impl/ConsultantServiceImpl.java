package com.wecode.modules.wbp.project.consultant.service.impl;

import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.project.consultant.model.ProjectConsultant;
import com.wecode.modules.wbp.project.consultant.service.ConsultantService;

/**
 * Created by heaven.zyc on 14-6-7.
 */
public class ConsultantServiceImpl implements ConsultantService {
    @Override
    public Page<ProjectConsultant> findConsultantByProjectPage(Integer projectId, Integer currentPage) {
        String sql = "select * ";
        String sqlCount = " from project_consultant where status=1 and project_id=? order by seq desc";
        return ProjectConsultant.dao.paginate(currentPage, 3, sql, sqlCount, projectId);
    }
}
