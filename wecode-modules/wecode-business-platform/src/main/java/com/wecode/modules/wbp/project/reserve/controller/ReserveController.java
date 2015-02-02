package com.wecode.modules.wbp.project.reserve.controller;

import com.google.inject.Inject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.exception.BusinessException;
import com.wecode.framework.json.JsonResult;
import com.wecode.modules.wbp.common.controller.BaseController;
import com.wecode.modules.wbp.common.model.Project;
import com.wecode.modules.wbp.project.reserve.model.ProjectReserve;
import com.wecode.modules.wbp.project.reserve.service.ReserveService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by heaven.zyc on 14-6-5.
 */
@ControllerBind(controllerKey = "/admin/project/reserve", viewPath = "/project/reserve")
public class ReserveController extends BaseController {
    @Inject
    private ReserveService reserveService;

    public void index(){
        Project project = getCurrentProject();
        if(project == null) {
            throw new BusinessException("当前用户没有任何楼盘的权限.");
        }
        renderFreeMarker("reserve_index.ftl");
    }

    public void list(){
        Project project = getCurrentProject();
        if(project == null) {
            throw new BusinessException("当前用户没有任何楼盘的权限.");
        }
        Page<ProjectReserve> page = reserveService.getReserveList(getParaToInt("page", 1),getParaToInt("rows", 10),project.getId());
        //ProjectReserve.findReserveList(project.getId(), curPage);
        setAttr("reserveList",page.getList());
        setAttr("page",page);

        Map root = new HashMap();
        root.put("total", page.getTotalPage());
        root.put("page", page.getPageNumber());
        root.put("records", page.getTotalRow());

        root.put("rows", page.getList());

        renderJson(JsonKit.toJson(root));
        //    renderFreeMarker("reserve_index.ftl");
    }

    @ActionKey("/admin/project/reserve/process")
    @Before(Tx.class)
    public void process(){
        Integer id = getParaToInt("reserveId");
        /*ProjectReserve reserve = ProjectReserve.dao.findById(id);
        reserve.set("status",1);
        reserve.update();*/
        reserveService.processReserve(id);
        JsonResult json = JsonResult.success();
        renderJson(json.toJson());
    }
}
