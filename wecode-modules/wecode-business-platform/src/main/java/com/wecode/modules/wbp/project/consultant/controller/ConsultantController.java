package com.wecode.modules.wbp.project.consultant.controller;

import com.google.inject.Inject;
import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.exception.BusinessException;
import com.wecode.framework.json.JsonResult;
import com.wecode.modules.wbp.common.controller.BaseController;
import com.wecode.modules.wbp.common.model.Project;
import com.wecode.modules.wbp.project.consultant.model.ProjectConsultant;
import com.wecode.modules.wbp.project.consultant.service.ConsultantService;

import java.util.Date;
import java.util.List;

/**
 * @author heaven.zyc 2014年6月1日 下午4:07:46
 */
@ControllerBind(controllerKey = "/admin/project/consultant", viewPath = "/project/consultant")
public class ConsultantController extends BaseController {

    @Inject
    private ConsultantService consultantService;
//	@ActionKey("/admin/project/consultant/")
	public void index() {
		Project p = getCurrentProject();
		if(p == null) {
			throw new BusinessException("当前用户没有任何楼盘的权限.");
		}
        Integer curPage = getParaToInt(0);
        if (curPage == null) curPage = 1;
        Page<ProjectConsultant> page = consultantService.findConsultantByProjectPage(p.getId(),curPage);
        setAttr("consultants",page.getList());
        setAttr("page",page);
		renderFreeMarker("consultant_index.ftl");
	}

    /**
     * redirect to add consultant page
     */
    @ActionKey("/admin/project/consultant/add_consultant")
    public void add(){
        renderFreeMarker("consultant_add.ftl");
    }

    /**
     * save project_consultant object
     */
    @ActionKey("/admin/project/consultant/save_consultant")
    @Before(Tx.class)
    public void save(){
        ProjectConsultant consultant = createConsultant(null);
        consultant.save();
        consultant.set("seq",consultant.getId());
        consultant.update();
        redirect("/admin/project/consultant/");
    }

    /**
     * redirect to edit consultant page
     */
    @ActionKey("/admin/project/consultant/edit_consultant")
    public void edit(){
        Integer id = getParaToInt("id");
        Integer curPage = getParaToInt("curPage");
        ProjectConsultant consultant = ProjectConsultant.dao.findById(id);
        ProjectConsultant.checkSecurity(consultant,getCurrentProject());
        List<Project> projectList = Project.getProjectByMerchant(null);
        setAttr("consultant",consultant);
        setAttr("projectList",projectList);
        setAttr("curPage",curPage);
        renderFreeMarker("consultant_edit.ftl");
    }

    /**
     * edit consultant object
     */
    @ActionKey("/admin/project/consultant/modify_consultant")
    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        Integer curPage = getParaToInt("curPage");
        ProjectConsultant consultant = createConsultant(id);
        ProjectConsultant.checkSecurity(consultant,getCurrentProject());
        consultant.update();
        redirect("/admin/project/consultant/"+curPage);
    }

    /**
     * build a consultant object
     * @param id when add operating, id allow to null;
     * @return
     */
    public ProjectConsultant createConsultant(Integer id){
        String name = getPara("name");
        String tel = getPara("tel");
        String intro = getPara("intro");
        String picUrl = getPara("path");
        Integer isVisible = getParaToInt("is_visiable");
        ProjectConsultant consultant = null;
        if (id == null){
            consultant = new ProjectConsultant();
            consultant.set("create_time",new Date());
        }else {
            consultant = ProjectConsultant.dao.findById(id);
        }
        consultant.set("name",name);
        consultant.set("tel",tel);
        consultant.set("intro",intro);
        consultant.set("pic_url",picUrl);
        consultant.set("project_id",getCurrentProject().getId());
        consultant.set("is_visiable",isVisible);
        return consultant;
    }

    @ActionKey("/admin/project/consultant/delete_consultant")
    @Before(Tx.class)
    public void delete(){
        Integer id = getParaToInt("id");
        Integer curPage = getParaToInt("curPage");
        Integer count = getParaToInt("count");
        if (count != null && count == 1 && curPage > 1){
            curPage --;
        }
        ProjectConsultant consultant = ProjectConsultant.dao.findById(id);
        ProjectConsultant.checkSecurity(consultant,getCurrentProject());
        if (consultant != null) {
            consultant.set("status",0);
        }
        consultant.update();
        redirect("/admin/project/consultant/"+curPage);

    }

    @ActionKey("/admin/project/consultant/move")
    @Before(Tx.class)
    public void move(){
        Integer currentId = getParaToInt("id");
        Integer targetId = getParaToInt("targetId");
        ProjectConsultant.moveConsultant(currentId,targetId);
        JsonResult json = JsonResult.success();
        renderJson(json.toJson());
    }

    @ActionKey("/admin/project/consultant/move_top")
    @Before(Tx.class)
    public void moveTop(){
        Integer currentId = getParaToInt("id");
        ProjectConsultant.moveTop(currentId);
        redirect("/admin/project/consultant/");
    }
}
