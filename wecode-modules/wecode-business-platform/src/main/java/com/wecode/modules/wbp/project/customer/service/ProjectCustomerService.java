package com.wecode.modules.wbp.project.customer.service;

import com.jfinal.ext.plugin.guice.GuiceService;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.modules.wbp.project.customer.model.ProjectCustomer;
import com.wecode.modules.wbp.project.customer.service.impl.ProjectCustomerServiceImpl;

import java.util.List;

/**
 * Created by heaven.zyc on 14-6-11.
 */
@GuiceService(ProjectCustomerServiceImpl.class)
public interface ProjectCustomerService {

    /**
     * a取得关注客户列表
     * @param curPage
     * @param projectId
     * @return
     */
    Page<ProjectCustomer> findByProjectId(Integer curPage,Integer pageSize,Integer projectId);

    /**
     * 取得意向客户列表
     * @param curPage
     * @param projectId
     * @return
     */
    Page<ProjectCustomer> findIntentionListByProejctId(Integer curPage,Integer pageSize,Integer projectId);

    /**
     * 取得成交客户列表
     * @param curPage
     * @param projectId
     * @return
     */
    Page<ProjectCustomer> findDealListByProejctId(Integer curPage,Integer pageSize,Integer projectId);

    /**
     * 取得邀请链上的父级节点
     * @param customer
     * @return
     */
    List<ProjectCustomer> getAllParents(ProjectCustomer customer);

    /**
     * 任务带来的意向人数
     * @param customer
     * @param taskId
     * @return
     */
    public int spreadIntentionCount(ProjectCustomer customer,Integer taskId);

    /**
     * 任务带来的关注人数
     * @param customer
     * @param taskId
     * @return
     */
    public int spreadAttentionCount(ProjectCustomer customer,Integer taskId);

    /**
     * 根据任务获取传播链
     * @param customer
     * @param taskId
     * @return
     */
    public List<ProjectCustomer> findSpreadList(ProjectCustomer customer, Integer taskId);
}
