package com.wecode.modules.wbp.project.customer.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;
import java.util.Map;

/**
 * Created by heaven.zyc on 14-6-5.
 */
@TableBind(tableName = "project_customer")
public class ProjectCustomer extends BaseModel<ProjectCustomer,Integer> {

    private static final long serialVersionUID = 1L;

    public static ProjectCustomer dao = new ProjectCustomer();
    public static enum SourceType {
        DIRECT("直接关注"),
        INVITE_CALLBACK("邀请回访关注"),
        SHARE_CALLBACK("分享回访关注");

        private String desc;

        SourceType(String desc) {
            this.desc = desc;
        }

        public String getDesc() {
            return desc;
        }

        public static SourceType indexOf(int i) {
            SourceType[] statusList = SourceType.values();
            if (i < 0 || i >= statusList.length) {
                return statusList[0];
            }
            return statusList[i];
        }
    }

    public SourceType getSourceType() {
        int i = asInt("source_type");
        return SourceType.indexOf(i);
    }

    public static enum CustomerType {
        ATTENTION("关注客户"),
        INTENTION("意向客户"),
        /**未关注的*/
        GUEST("游客");

        private String desc;

        CustomerType(String desc) {
            this.desc = desc;
        }

        public String getDesc() {
            return desc;
        }

        public static CustomerType indexOf(int i) {
            CustomerType[] statusList = CustomerType.values();
            if (i < 0 || i >= statusList.length) {
                return statusList[0];
            }
            return statusList[i];
        }
    }

    public CustomerType getCustomerType() {
        int i = asInt("type");
        return CustomerType.indexOf(i);
    }

    @Override
    protected Map<String, Object> getAttrs() {
        Map<String, Object> map = super.getAttrs();
        if (this.get("wx_id") == null) return map;

        map.put("influenceCount",influenceCount());
        map.put("intentionCustomerCount",intentionCustomerCount());
        map.put("attentionCustomerCount",attentionCustomerCount());
        map.put("callbackCount",getCallbackCount());
        map.put("rate",getConversionRate());
        map.put("spreadCount",influenceCount());
        map.put("customerType",getCustomerTypeDesc());
        if (this.get("share_customer_id") == null) return map;
        return map;
    }

    /**
     * z影响力(传播人数)
     * @return
     */
    public int influenceCount(){
        String sql = "select * from project_customer where status=1 " +
                " and path like ? ";
        String id = "%/"+this.getId()+"/%";
        return ProjectCustomer.dao.find(sql, id).size();
    }

    /**
     * z带来的意向人数
     * @return
     */
    public int intentionCustomerCount(){
        String sql = "select * from project_customer where status=1 " +
                " and share_customer_id=? and type='INTENTION' ";
        return ProjectCustomer.dao.find(sql,this.getId()).size();
    }

    /**
     * z带来的关注人数
     * @return
     */
    public int attentionCustomerCount() {
        String sql = "select * from project_customer where status=1 " +
                " and share_customer_id=? and type='ATTENTION' ";
        return ProjectCustomer.dao.find(sql,this.getId()).size();
    }

    /**
     * z回访人数
     * @return
     */
    public int getCallbackCount(){
        String sql = "select * from project_customer where status=1 " +
                " and share_customer_id=?";
        return ProjectCustomer.dao.find(sql,this.getId()).size();
    }

    /**
     * z转化率
     * @return
     */
    public String getConversionRate(){
        if (this.influenceCount() == 0) return 0+"";
        double rate = (double)this.intentionCustomerCount()/(double)this.influenceCount();
        return ((rate * 100)+"").substring(0,2);
    }

    public ProjectCustomer getShareCustomer(){
        return ProjectCustomer.dao.findById(this.get("share_customer_id"));
    }


    /**
     * s直接邀请的客户列表
     * @return
     */
    public List<ProjectCustomer> directInviteList() {
        String sql = "select * from project_customer where status=1 " +
                " and share_customer_id=? ";
        return ProjectCustomer.dao.find(sql, this.getId());
    }

    /**
     * 获取客户分享的任务传播人数
     * @return
     */
    public int getCustomerTaskSpreadCount(){
        String sql = "select count(*) from project_customer where path like ? and " +
                "task_id in (select DISTINCT(task_id) from act_share_record where share_customer_id=?)";
        String id = "%/"+this.getId()+"/%";
        return Db2.queryInt(sql, id, this.getId());
    }

    /**
     * s获得客户类型
     * @return
     */
    public String getCustomerTypeDesc(){
        return getCustomerType().valueOf(this.getStr("type")).desc;
    }
}
