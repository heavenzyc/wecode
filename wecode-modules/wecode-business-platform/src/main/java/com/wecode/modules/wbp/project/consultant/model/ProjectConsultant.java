package com.wecode.modules.wbp.project.consultant.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.exception.BusinessException;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.modules.wbp.common.model.Project;

import java.util.List;

/**
 * @author heaven.zyc 2014年6月2日 下午1:01:28
 */
@TableBind(tableName = "project_consultant")
public class ProjectConsultant extends BaseModel<ProjectConsultant, Integer> {

	private static final long serialVersionUID = 1L;

	public static ProjectConsultant dao = new ProjectConsultant();

    public static Page<ProjectConsultant> findConsultantByProjectPage(Integer projectId, Integer currentPage) {
        String sql = "select * ";
        String sqlCount = " from project_consultant where status=1 and project_id=? order by seq desc";
        return dao.paginate(currentPage, 3, sql, sqlCount, projectId);
    }


    /**
     * move consultant position in the list
     * @param currentId
     * @param targetId
     */
    public static void moveConsultant(Integer currentId, Integer targetId){
        ProjectConsultant curConsultant = dao.findById(currentId);
        ProjectConsultant targetConsultant = dao.findById(targetId);
        Integer curSeq = curConsultant.get("seq");
        Integer targetSeq = targetConsultant.get("seq");
        curConsultant.set("seq",targetSeq);
        targetConsultant.set("seq",curSeq);
        curConsultant.update();
        targetConsultant.update();
    }

    public static void moveTop(Integer id){
        ProjectConsultant curConsultant = dao.findById(id);
        String sql = "select * from project_consultant where project_id=? and seq>? order by seq desc ";
        List<ProjectConsultant> consultantList = dao.find(sql,curConsultant.get("project_id"),curConsultant.get("seq"));
        if (consultantList.size() > 1){
            ProjectConsultant targetConsultant = consultantList.get(0);
            curConsultant.set("seq",targetConsultant.get("seq"));
            curConsultant.update();
            for (ProjectConsultant temp : consultantList){
                Integer seq = temp.get("seq");
                temp.set("seq", seq - 1);
                temp.update();
            }
        }
        if (consultantList.size() ==1) {
            moveConsultant(id,consultantList.get(0).getId());
        }
    }

    public static void checkSecurity(ProjectConsultant consultant, Project project){
        if (!consultant.get("project_id").equals(project.getId())){
            throw new BusinessException("当前用户没有该楼盘的权限.");
        }
    }
}