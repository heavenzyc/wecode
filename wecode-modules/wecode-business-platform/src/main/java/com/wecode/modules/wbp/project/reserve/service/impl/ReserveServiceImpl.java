package com.wecode.modules.wbp.project.reserve.service.impl;

import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.project.reserve.model.ProjectReserve;
import com.wecode.modules.wbp.project.reserve.service.ReserveService;
/**
 * Created by heaven.zyc on 14-6-7.
 */
public class ReserveServiceImpl implements ReserveService {

    @Override
    public Page<ProjectReserve> getReserveList(Integer curPage,Integer pageSize, Integer projectId) {
        String sql = "select * ";
        String sqlExceptSelect = " from project_reserve where project_id=? order by status asc,submit_time desc ";
        return ProjectReserve.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,projectId);
    }

    @Override
    public void processReserve(Integer id) {
        ProjectReserve reserve = ProjectReserve.dao.findById(id);
        reserve.set("status",1);
        reserve.update();
    }
}
