package com.wecode.modules.wbp.project.info;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.controller.BaseController;
import com.wecode.modules.wbp.common.model.Project;

/**
 * @author heaven.zyc 2014年6月13日 下午8:22:32
 */
@ControllerBind(controllerKey = "/admin/project/info", viewPath = "/project/info")
public class ProjectInfoController extends BaseController {

    public void index() {
        Project p = getCurrentProject();
        setAttr("project", p);
        renderFreeMarker("project_info.ftl");
    }

    public void round() {
        Project p = getCurrentProject();
        setAttr("project", p);
        renderFreeMarker("project_round.ftl");
    }

    @Before(Tx.class)
    public void save() {
        Project p = getCurrentProject();

        String name = getPara("name");
        String introduction = getPara("introduction");
        String sales_phone = getPara("sales_phone");
        String gps_x = getPara("gps_x");
        String gps_y = getPara("gps_y");
        String city = getPara("city");
        String address = getPara("address");
        String logo = getPara("logo");
//        String code = getPara("code");
        
        String around = getPara("around");
        if(StringUtils.isNotBlank(around)){
            p.set("around", around);
        }else if(StringUtils.isNotBlank(name)){
            p.set("name", name);
            p.set("introduction", introduction);
            p.set("sales_phone", sales_phone);
            p.set("gps_y",gps_y);
            p.set("gps_x",gps_x);
            p.set("city",city);
            p.set("address",address);
            p.set("logo",logo);
//            p.set("code",code);
        }
        p.update();

        renderJson(JsonResult.success());
    }
}
