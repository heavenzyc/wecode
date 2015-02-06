package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.jfinal.plugin.activerecord.Page;
import com.wecode.framework.ext.jfinal.db.Db2;
import com.wecode.framework.ext.jfinal.model.BaseModel;
import com.wecode.framework.util.StringUtils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "loan")
public class Loan extends BaseModel<Loan, Integer> {

    private static final long serialVersionUID = 1L;

    public static Loan dao = new Loan();

    public static List<Loan> getList(){
        String sql = " select * from loan where status='VALID'";
        return dao.find(sql);
    }

    public static Page<Loan> getPage(Integer curPage,Integer pageSize,String start, String end, String loaner, String approve) {
        String sql = "select * ";
        String sqlExceptSelect = " from loan where status='VALID' ";
        List<String> params = new ArrayList<String>();
        if (StringUtils.isNotBlank(loaner)) {
            sqlExceptSelect += " and loan_person=? ";
            params.add(loaner);
        }
        if (StringUtils.isNotBlank(start) && StringUtils.isNotBlank(end)) {
            sqlExceptSelect += " and loan_time>=? and loan_time<=?";
            params.add(start);
            params.add(end);
        }
        if (StringUtils.isNotBlank(approve)) {
            sqlExceptSelect += " and approve=?";
            params.add(approve);
        }
        sqlExceptSelect += " order by loan_time desc ";
        return Loan.dao.paginate(curPage,pageSize,sql,sqlExceptSelect,params.toArray());
    }
}
