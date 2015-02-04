package com.wecode.modules.wbp.common.model;

import java.util.List;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.ext.jfinal.model.BaseModel;

/**
 * 楼盘表
 * 
 * @author heaven.zyc 2014年6月2日 下午1:55:08
 */
@TableBind(tableName = "project")
public class Project extends BaseModel<Project, Integer> {

    private static final long serialVersionUID = 1L;

    public static Project dao = new Project();

    /**
     * 根据商家查找楼盘
     * 
     * @param merchantId
     * @return
     */
    public static List<Project> getProjectByMerchant(Integer merchantId) {
        String sql = "select a.* from project a where a.merchant_id=? and status=0";
        List<Project> projectList = Project.dao.find(sql, merchantId);
        return projectList;
    }

    public String getProjectSite(int projectId) {
        return Db2.queryStr("select wapsite from project_site where project_id=?", projectId);
    }

    /**
     * 获取所有状态正常的楼盘
     * @return
     */
	public static List<Project> findAllNormalProject() {
		String sql = "select * from project where status=1";//获取状态正常的楼盘
		return dao.find(sql);
	}
}