package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
import com.wecode.framework.util.DateUtils;
import com.wecode.framework.util.StringUtils;
import com.wecode.modules.wbp.common.model.*;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@ControllerBind(controllerKey = "/transport", viewPath = "/transport")
public class TransportController extends BaseController{

    public void index(){
        renderFreeMarker("transport.ftl");
    }

    public void list(){
//        String transportTimeStart,String transportTimeEnd, String offTimeStart,String offTimeEnd,String sender, String accepter) {
        String sender = getPara("sender");
        String accepter = getPara("accepter");
        String transportTimeStart = getPara("transportTimeStart");
        if (StringUtils.isNotBlank(transportTimeStart)) {
            transportTimeStart = transportTimeStart.trim();
            transportTimeStart += " 00:00:00";
        }
        String transportTimeEnd = getPara("transportTimeEnd");
        if (StringUtils.isNotBlank(transportTimeEnd)){
            transportTimeEnd = transportTimeEnd.trim();
            transportTimeEnd += " 23:59:59";
        }
        String offTimeStart = getPara("offTimeStart");
        if (StringUtils.isNotBlank(offTimeStart)) {
            offTimeStart = offTimeStart.trim();
            offTimeStart += " 00:00:00";
        }
        String offTimeEnd = getPara("offTimeEnd");
        if (StringUtils.isNotBlank(offTimeEnd)){
            offTimeEnd = offTimeEnd.trim();
            offTimeEnd += " 23:59:59";
        }
        Page<Transport> page = Transport.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),transportTimeStart,transportTimeEnd,offTimeStart,offTimeEnd,sender,accepter);
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
        List<TransportMerchant> transportMerchants = TransportMerchant.getList();
        setAttr("transportMerchants",transportMerchants);
        List<Material> materials = Material.getList();
        setAttr("materials",materials);
        renderFreeMarker("transport_add.ftl");
    }

    @Before(Tx.class)
    public void save(){
        String code = getPara("code");
        String transport_merchant_id = getPara("transport_merchant_id");
        TransportMerchant merchant = TransportMerchant.dao.findById(transport_merchant_id);
        String transport_merchant_name = "";
        if (merchant != null) {
            transport_merchant_name = merchant.get("name");
        }
        String send_address = getPara("send_address");
        String send_person = getPara("send_person");
        String send_person_phone = getPara("send_person_phone");
        String accept_merchant = getPara("accept_merchant");
        String accept_address = getPara("accept_address");
        String accept_person = getPara("accept_person");
        String accept_person_phone = getPara("accept_person_phone");
        String material_id = getPara("material_id");
        Material material = Material.dao.findById(material_id);
        String material_name = "";
        String material_code = "";
        if (material != null) {
            material_name = material.get("name");
            material_code = material.get("code");
        }
        String unit = material.get("unit");
        String shipping_address = getPara("shipping_address");
        String shipping_person_phone = getPara("shipping_person_phone");
        String send_time = getPara("send_time");
        String off_time = getPara("off_time");
        String car_num = getPara("car_num");
        Transport info = new Transport();
        info.set("code",code);
        info.set("transport_merchant_id",transport_merchant_id);
        info.set("transport_merchant_name",transport_merchant_name);
        info.set("send_address",send_address);
        info.set("send_person",send_person);
        info.set("send_person_phone",send_person_phone);
        info.set("accept_merchant",accept_merchant);
        info.set("accept_address",accept_address);
        info.set("material_id",material_id);
        info.set("material_name",material_name);
        info.set("material_code",material_code);
        info.set("accept_person",accept_person);
        info.set("accept_person_phone",accept_person_phone);
        info.set("unit",unit);
        info.set("shipping_address",shipping_address);
        info.set("shipping_person_phone",shipping_person_phone);
        info.set("car_num",car_num);
        if (StringUtils.isNotBlank(send_time)) {
            info.set("send_time",DateUtils.parse(send_time,"yyyy-MM-dd"));
        }
        if (StringUtils.isNotBlank(off_time)) {
            info.set("off_time",DateUtils.parse(off_time,"yyyy-MM-dd"));
        }
        info.set("create_time",new Date());
        info.set("status",Status.VALID.name());
        info.set("input_output_code",currentTimeMillis());
        info.save();
        redirect("/transport/index");
    }

    public void update(){
        Integer id = getParaToInt();
        Transport info = Transport.dao.findById(id);
        setAttr("data",info);
        List<TransportMerchant> transportMerchants = TransportMerchant.getList();
        setAttr("transportMerchants",transportMerchants);
        List<Material> materials = Material.getList();
        setAttr("materials",materials);
        renderFreeMarker("transport_edit.ftl");
    }

    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        Transport info = Transport.dao.findById(id);
        String code = getPara("code");
        String transport_merchant_id = getPara("transport_merchant_id");
        TransportMerchant merchant = TransportMerchant.dao.findById(transport_merchant_id);
        String transport_merchant_name = "";
        if (merchant != null) {
            transport_merchant_name = merchant.get("name");
        }
        String send_address = getPara("send_address");
        String send_person = getPara("send_person");
        String send_person_phone = getPara("send_person_phone");
        String accept_merchant = getPara("accept_merchant");
        String accept_address = getPara("accept_address");
        String accept_person = getPara("accept_person");
        String accept_person_phone = getPara("accept_person_phone");
        String material_id = getPara("material_id");
        Material material = Material.dao.findById(material_id);
        String material_name = "";
        String material_code = "";
        if (material != null) {
            material_name = material.get("name");
            material_code = material.get("code");
        }
        String unit = material.get("unit");
        String shipping_address = getPara("shipping_address");
        String shipping_person_phone = getPara("shipping_person_phone");
        String send_time = getPara("send_time");
        String off_time = getPara("off_time");
        String car_num = getPara("car_num");
        info.set("code",code);
        info.set("transport_merchant_id",transport_merchant_id);
        info.set("transport_merchant_name",transport_merchant_name);
        info.set("send_address",send_address);
        info.set("send_person",send_person);
        info.set("send_person_phone",send_person_phone);
        info.set("accept_merchant",accept_merchant);
        info.set("accept_address",accept_address);
        info.set("material_id",material_id);
        info.set("material_name",material_name);
        info.set("material_code",material_code);
        info.set("accept_person",accept_person);
        info.set("accept_person_phone",accept_person_phone);
        info.set("unit",unit);
        info.set("shipping_address",shipping_address);
        info.set("shipping_person_phone",shipping_person_phone);
        info.set("car_num",car_num);
        if (StringUtils.isNotBlank(send_time)) {
            info.set("send_time",DateUtils.parse(send_time,"yyyy-MM-dd"));
        }
        if (StringUtils.isNotBlank(off_time)) {
            info.set("off_time",DateUtils.parse(off_time,"yyyy-MM-dd"));
        }
        info.update();
        redirect("/transport/index");
    }


    public void delete(){
        Integer id = getParaToInt("id");
        Transport info = Transport.dao.findById(id);
        if (info != null) {
            info.set("status",Status.INVALID);
            info.update();
        }
        renderJson(JsonResult.success());
    }

    public void print(){
        Integer id = getParaToInt();
        Transport info = Transport.dao.findById(id);
        setAttr("data",info);
        renderFreeMarker("transport_print.ftl");
    }

}
