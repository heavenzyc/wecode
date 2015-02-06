package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.DateUtils;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.model.Department;
import com.wecode.modules.wbp.common.model.Loan;
import com.wecode.modules.wbp.common.model.Receive;
import com.wecode.modules.wbp.common.model.Status;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@ControllerBind(controllerKey = "/receive", viewPath = "/receive")
public class ReceiveController extends BaseController{

    public void index(){
        renderFreeMarker("receive.ftl");
    }

    public void list(){
        String receiver = getPara("receiver");
        String approve = getPara("approve");
        String start = getPara("start");
        if (StringUtils.isNotBlank(start)) {
            start = start.trim();
            start += " 00:00:00";
        }
        String end = getPara("end");
        if (StringUtils.isNotBlank(end)){
            end = end.trim();
            end += " 23:59:59";
        }
        Page<Receive> page = Receive.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),start,end,receiver,approve);
        setAttr("infoList",page.getList());
        setAttr("page",page);
        Map root = new HashMap();
        root.put("total", page.getTotalPage());
        root.put("page", page.getPageNumber());
        root.put("records", page.getTotalRow());
        root.put("rows", page.getList());
        renderJson(JsonKit.toJson(root));
    }

    public void add(){
        renderFreeMarker("receive_add.ftl");
    }

    @Before(Tx.class)
    public void save(){
        String merchant = getPara("merchant");
        String receive_person = getPara("receive_person");
        String receive_type = getPara("receive_type");
        String check_num = getPara("check_num");
        String money_capital = getPara("money_capital");
        BigDecimal money_lower = getBigDecimal("money_lower");
        BigDecimal money = getBigDecimal("money");
        BigDecimal arrears = getBigDecimal("arrears");
        String receive_time = getPara("receive_time");
        Date receiveTime = new Date();
        if (StringUtils.isNotBlank(receive_time)) {
            receiveTime = DateUtils.parse(receive_time,"yyyy-MM-dd");
        }
        String approve = getPara("approve");
        String verify = getPara("verify");
        String finance_verify = getPara("finance_verify");
        String dept_verify = getPara("dept_verify");
        String reason = getPara("reason");
        String remark = getPara("remark");
//        File file = getFile("annex").getFile();
        Receive loan = new Receive();
        loan.set("code",currentTimeMillis());
        loan.set("merchant",merchant);
        loan.set("receive_person",receive_person);
        loan.set("receive_time",receiveTime);
        loan.set("money_lower",money_lower);
        loan.set("arrears",arrears);
        loan.set("money",money);
        loan.set("money_capital",money_capital);
        loan.set("reason",reason);
        loan.set("receive_type",receive_type);
        loan.set("check_num",check_num);
        loan.set("approve",approve);
        loan.set("verify",verify);
        loan.set("finance_verify",finance_verify);
        loan.set("dept_verify",dept_verify);
        loan.set("remark",remark);
        loan.set("create_time",new Date());
        loan.set("status",Status.VALID.name());
        loan.save();
        redirect("/receive/index");
    }

    public void update(){
        Integer id = getParaToInt();
        Receive info = Receive.dao.findById(id);
        setAttr("data",info);
        renderFreeMarker("receive_edit.ftl");
    }

    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        Integer loan_dept_id = getParaToInt("loan_dept_id");
        Department department = Department.dao.findById(loan_dept_id);
        String loan_dept_name = "";
        if (department != null) {
            loan_dept_name = department.get("name");
        }
        String loan_person = getPara("loan_person");
        Integer use_dept_id = getParaToInt("use_dept_id");
        department = Department.dao.findById(use_dept_id);
        String use_dept_name = "";
        if (department != null) {
            use_dept_name = department.get("name");
        }
        String loan_type = getPara("loan_type");
        String check_num = getPara("check_num");
        String money_capital = getPara("money_capital");
        BigDecimal money_lower = getBigDecimal("money_lower");
        String loan_time = getPara("loan_time");
        Date loanTime = new Date();
        if (StringUtils.isNotBlank(loan_time)) {
            loanTime = DateUtils.parse(loan_time,"yyyy-MM-dd");
        }
        String repay_method = getPara("repay_method");
        String approve = getPara("approve");
        String verify = getPara("verify");
        String finance_verify = getPara("finance_verify");
        String dept_verify = getPara("dept_verify");
        String reason = getPara("reason");
        String remark = getPara("remark");
//        File file = getFile("annex").getFile();
        Loan loan = Loan.dao.findById(id);
        loan.set("loan_dept_id",loan_dept_id);
        loan.set("loan_dept_name",loan_dept_name);
        loan.set("loan_person",loan_person);
        loan.set("loan_time",loanTime);
        loan.set("money_lower",money_lower);
        loan.set("money_capital",money_capital);
        loan.set("reason",reason);
        loan.set("use_dept_id",use_dept_id);
        loan.set("use_dept_name",use_dept_name);
        loan.set("loan_type",loan_type);
        loan.set("check_num",check_num);
        loan.set("repay_method",repay_method);
        loan.set("approve",approve);
        loan.set("verify",verify);
        loan.set("finance_verify",finance_verify);
        loan.set("dept_verify",dept_verify);
        loan.set("remark",remark);
        loan.update();
        redirect("/receive/index");
    }


    public void delete(){
        Integer id = getParaToInt("id");
        Receive info = Receive.dao.findById(id);
        if (info != null) {
            info.set("status",Status.INVALID);
            info.update();
        }
        renderJson(JsonResult.success());
    }

    public void print(){
        Integer id = getParaToInt();
        Receive info = Receive.dao.findById(id);
        setAttr("data",info);
        renderFreeMarker("receive_print.ftl");
    }

}
