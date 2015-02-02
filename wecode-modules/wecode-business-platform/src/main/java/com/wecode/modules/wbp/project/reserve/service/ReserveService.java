package com.wecode.modules.wbp.project.reserve.service;

import com.jfinal.ext.plugin.guice.GuiceService;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.project.reserve.model.ProjectReserve;
import com.wecode.modules.wbp.project.reserve.service.impl.ReserveServiceImpl;

/**
 * Created by heaven.zyc on 14-6-7.
 */
@GuiceService(ReserveServiceImpl.class)
public interface ReserveService {

    /**
     * find reserve record by projectId and with paginate
     * @param curPage
     * @param projectId
     * @return
     */
    Page<ProjectReserve> getReserveList(Integer curPage,Integer pageSize,Integer projectId);

    void processReserve(Integer id);
}
