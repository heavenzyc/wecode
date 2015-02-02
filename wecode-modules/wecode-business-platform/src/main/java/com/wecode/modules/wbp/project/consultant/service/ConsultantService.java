package com.wecode.modules.wbp.project.consultant.service;

import com.jfinal.ext.plugin.guice.GuiceService;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.project.consultant.model.ProjectConsultant;
import com.wecode.modules.wbp.project.consultant.service.impl.ConsultantServiceImpl;

/**
 * Created by heaven.zyc on 14-6-7.
 */
@GuiceService(ConsultantServiceImpl.class)
public interface ConsultantService {

    Page<ProjectConsultant> findConsultantByProjectPage(Integer projectId, Integer currentPage);
}
