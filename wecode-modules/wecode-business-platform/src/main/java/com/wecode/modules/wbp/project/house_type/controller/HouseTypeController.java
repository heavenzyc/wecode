package com.wecode.modules.wbp.project.house_type.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.exception.BusinessException;
import com.wecode.modules.wbp.common.controller.BaseController;
import com.wecode.modules.wbp.common.model.Project;
import com.wecode.modules.wbp.project.house_type.model.ProjectHouseType;

import java.util.Date;
import java.util.List;

/**
 * Created by heaven.zyc on 14-6-5.
 */
@ControllerBind(controllerKey = "/admin/project/house_type",viewPath = "/project/house_type")
public class HouseTypeController extends BaseController {

    public void index(){
        Project project = getCurrentProject();
        if (project == null){
            throw new BusinessException("当前用户没有任何楼盘的权限.");
        }
        Integer curPage = getParaToInt(0);
        if (curPage == null) curPage = 1;
        Page<ProjectHouseType> page = ProjectHouseType.findHouseTypelist(project.getId(),curPage);
        setAttr("houseTypeList",page.getList());
        setAttr("page",page);
        renderFreeMarker("house_type_index.ftl");
    }

    @ActionKey("/admin/project/house_type/add_house_type")
    public void add(){
        List<Project> projectList = Project.dao.getProjectByMerchant(null);
        setAttr("projectList",projectList);
        renderFreeMarker("house_type_add.ftl");
    }

    @ActionKey("/admin/project/save_house_type")
    public void save(){
        ProjectHouseType houseType = buildHouseType(null);
        houseType.set("create_time",new Date());
        houseType.set("update_time",new Date());
        houseType.set("status",1);
        houseType.save();
        redirect("/admin/project/house_type/");
    }

    @ActionKey("/admin/project/house_type/edit_house_type")
    public void edit(){
        Integer id = getParaToInt("id");
        Integer curPage = getParaToInt("curPage");
        ProjectHouseType houseType = ProjectHouseType.dao.findById(id);
        ProjectHouseType.checkSecurity(houseType,getCurrentProject());
        setAttr("houseType",houseType);
        setAttr("curPage",curPage);
        List<Project> projectList = Project.getProjectByMerchant(null);
        setAttr("projectList",projectList);
        Integer projectId = houseType.get("project_id");
        // Project.dao.findById(projectId);
        setAttr("project",Project.dao.findById(projectId));
        renderFreeMarker("house_type_edit.ftl");
    }

    @ActionKey("/admin/project/house_type/modify_house_type")
    @Before(Tx.class)
    public void modify(){
        Integer curPage = getParaToInt("curPage");
        Integer id = getParaToInt("id");
        ProjectHouseType houseType = buildHouseType(id);
        ProjectHouseType.checkSecurity(houseType,getCurrentProject());
        houseType.update();
        redirect("/admin/project/house_type/" + curPage);
    }

    private ProjectHouseType buildHouseType(Integer id){
        String name = getPara("name");
        String area = getPara("area");
        String giftArea = getPara("gift_area");
        String structure = getPara("structure");
        String price = getPara("price");
        String description = getPara("description");
    //    String listPic = getPara("list_pic");
        String topPic = getPara("top_pic");
        ProjectHouseType houseType = null;
        if (id == null) {
            houseType = new ProjectHouseType();
        }else {
            houseType = ProjectHouseType.dao.findById(id);
        }
        houseType.set("name",name);
        houseType.set("area",area);
        houseType.set("gift_area",giftArea);
        houseType.set("description",description);
        houseType.set("project_id",getCurrentProject().getId());
    //    houseType.set("list_pic_url",listPic);
        houseType.set("top_pic_url",topPic);
        houseType.set("structure",structure);
        houseType.set("price",price);
        return houseType;
    }

    @ActionKey("/admin/project/house_type/delete_house_type")
    @Before(Tx.class)
    public void delete(){
        Integer id = getParaToInt("id");
        Integer curPage = getParaToInt("curPage");
        Integer itemCount = getParaToInt("itemCount");
        ProjectHouseType houseType = ProjectHouseType.dao.findById(id);
        ProjectHouseType.checkSecurity(houseType,getCurrentProject());
        if (itemCount == 1 && curPage > 1){
            curPage--;
        }
        houseType.set("status",0);
        houseType.set("update_time", new Date());
        houseType.update();
        redirect("/admin/project/house_type/"+curPage);
    }
}
