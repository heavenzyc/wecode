package com.wecode.modules.wbp.common.model;

import java.util.List;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.ext.jfinal.model.BaseModel;

/**
 *
 * @author heaven.zyc 2014年6月2日 下午1:55:08
 */
@TableBind(tableName = "project")
public class Project extends BaseModel<Project, Integer> {

    private static final long serialVersionUID = 1L;

    public static Project dao = new Project();

    public static List<Project> getList() {
        String sql = "select * from project ";
        List<Project> projectList = Project.dao.find(sql);
        return projectList;
    }
}