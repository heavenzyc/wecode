package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.jfinal.upload.UploadFile;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.DateUtils;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.config.FileUpload;
import com.wecode.modules.wbp.common.model.Department;
import com.wecode.modules.wbp.common.model.Loan;
import com.wecode.modules.wbp.common.model.Receive;
import com.wecode.modules.wbp.common.model.Status;

import java.io.File;
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
        String annex_name = getPara("annex_name");
        String annex_url = getPara("annex_url");
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
        if (StringUtils.isNotBlank(annex_name) && StringUtils.isNotBlank(annex_url)) {
            loan.set("annex",annex_name);
            loan.set("annex_url",annex_url);
        }
        loan.save();
        renderJson(JsonResult.success().toJson());
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
        String annex_name = getPara("annex_name");
        String annex_url = getPara("annex_url");
        Receive loan = Receive.dao.findById(id);
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
        if (StringUtils.isNotBlank(annex_name) && StringUtils.isNotBlank(annex_url)) {
            loan.set("annex",annex_name);
            loan.set("annex_url",annex_url);
        }
        loan.update();
        renderJson(JsonResult.success().toJson());
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

    public void upload(){
        UploadFile fileUpload = getFile("annex");
        if (fileUpload == null) {
            JsonResult json = JsonResult.success();
            renderJson(json.toJson());
            return;
        }
        File file = getFile("annex").getFile();
        String path = FileUpload.upload(file);
        path = path + File.separator + file.getName();
        JsonResult json = JsonResult.success();
        json.data("annex","!"+file.getName()+"!");
        json.data("annex_url","#"+path+"#");
        renderJson(json.toJson());
    }

}
