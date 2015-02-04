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
import org.apache.poi.xssf.usermodel.*;

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
 * Created by zkdu on 2015/2/2.
 */
@ControllerBind(controllerKey = "/output", viewPath = "/output")
public class OutputController extends BaseController{

    public void index(){
        renderFreeMarker("output.ftl");
    }

    public void list(){
        String transport = getPara("transport");
        String accepter = getPara("accepter");
        String weighter = getPara("weighter");
        String startStr = getPara("start");
        if (StringUtils.isNotBlank(startStr)) {
            startStr = startStr.trim();
            startStr += " 00:00:00";
        }
        String endStr = getPara("end");
        if (StringUtils.isNotBlank(endStr)){
            endStr = endStr.trim();
            endStr += " 23:59:59";
        }
        Page<OutputInfo> page = OutputInfo.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),transport,accepter,weighter,startStr,endStr);
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
        List<Merchant> merchants = Merchant.getList();
        List<Material> materials = Material.getList();
        List<Merchant> accepts = Merchant.getList();
        List<Staff> staffs = Staff.getList();
        setAttr("providers",merchants);
        setAttr("materials",materials);
        setAttr("accepts",accepts);
        setAttr("staffs",staffs);
        renderFreeMarker("output_add.ftl");
    }

    @Before(Tx.class)
    public void save(){
        String code = currentTimeMillis();
        String project_name = getPara("project_name");
        String contract_num = getPara("contract_num");
        String merchant_id = getPara("merchant_id");
        String merchant_name = Merchant.dao.findById(merchant_id).get("name");
        String warehouse = getPara("warehouse");
        String material_id = getPara("material_id");
        Material material = Material.dao.findById(material_id);
        String material_name = material.get("name");
        String material_code = material.get("code");
        String purchase_type_id = material.get("type_id");
        String purchase_type_name = material.get("type_name");
        String standard_id = material.get("standard_id");
        String standard_name = material.get("standard_name");
        BigDecimal count = getBigDecimal("count");
        String transport_person = getPara("transport_person");
        String car_num = getPara("car_num");
        String weigh_person = getPara("weigh_person");
        String send_person_id = getPara("send_person_id");
        Person person = Person.dao.findById(send_person_id);
        String send_person = "";
        if (person != null) {
            send_person = person.get("name");
        }
        String accept_person_id = getPara("accept_person_id");
        person = Person.dao.findById(accept_person_id);
        String accept_person = "";
        if (person != null) {
            accept_person = person.get("name");
        }
        String remark = getPara("remark");
        OutputInfo info = new OutputInfo();
        info.set("code",code);
        info.set("project_name",project_name);
        info.set("contract_num",contract_num);
        info.set("merchant_id",merchant_id);
        info.set("merchant_name",merchant_name);
        info.set("material_code",material_code);
        info.set("warehouse",warehouse);
        info.set("material_id",material_id);
        info.set("material_name",material_name);
        info.set("purchase_type_id",purchase_type_id);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_id",standard_id);
        info.set("count",count);
        BigDecimal percent = new BigDecimal(1);
        if (material.getBigDecimal("discount") != null) {
            percent = (new BigDecimal(100).subtract(material.getBigDecimal("discount"))).divide(new BigDecimal(100));
            info.set("discount",material.getBigDecimal("discount"));
        }else{
            info.set("discount",BigDecimal.ZERO);
        }
        if (material.getBigDecimal("price")!= null) {
            info.set("money",(count.multiply(material.getBigDecimal("price"))).multiply(percent));
        }else {
            info.set("money",BigDecimal.ZERO);
        }
        if (material.getBigDecimal("price") != null) {
            info.set("price",material.getBigDecimal("price"));
        }else {
            info.set("price",BigDecimal.ZERO);
        }
        info.set("price",material.getBigDecimal("price"));
        info.set("unit",material.getStr("unit"));
        info.set("transport_person",transport_person);
        info.set("car_num",car_num);
        info.set("weigh_person",weigh_person);
        info.set("send_person_id",send_person_id);
        info.set("send_person",send_person);
        info.set("accept_person_id",accept_person_id);
        info.set("accept_person",accept_person);
        info.set("output_time",new Date());
        info.set("remark",remark);
        info.set("create_time",new Date());
        info.set("status",Status.VALID.name());
        info.set("is_clear",0);
        info.save();
        redirect("/output/index");
    }

    public void update(){
        Integer id = getParaToInt();
        OutputInfo info = OutputInfo.dao.findById(id);
        setAttr("data",info);
        List<Merchant> merchants = Merchant.getList();
        List<Material> materials = Material.getList();
        List<Merchant> accepts = Merchant.getList();
        List<Staff> staffs = Staff.getList();
        setAttr("providers",merchants);
        setAttr("materials",materials);
        setAttr("accepts",accepts);
        setAttr("staffs",staffs);
        renderFreeMarker("output_edit.ftl");
    }

    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        OutputInfo info = OutputInfo.dao.findById(id);
        String project_name = getPara("project_name");
        String contract_num = getPara("contract_num");
        String merchant_id = getPara("merchant_id");
        String merchant_name = Merchant.dao.findById(merchant_id).get("name");
        String warehouse = getPara("warehouse");
        String material_id = getPara("material_id");
        Material material = Material.dao.findById(material_id);
        String material_name = material.get("name");
        String material_code = material.get("code");
        String purchase_type_id = material.get("type_id");
        String purchase_type_name = material.get("type_name");
        String standard_id = material.get("standard_id");
        String standard_name = material.get("standard_name");
        BigDecimal count = getBigDecimal("count");
        String transport_person = getPara("transport_person");
        String car_num = getPara("car_num");
        String weigh_person = getPara("weigh_person");
        String send_person_id = getPara("send_person_id");
        Person person = Person.dao.findById(send_person_id);
        String send_person = "";
        if (person != null) {
            send_person = person.get("name");
        }
        String accept_person_id = getPara("accept_person_id");
        person = Person.dao.findById(accept_person_id);
        String accept_person = "";
        if (person != null) {
            accept_person = person.get("name");
        }
        String remark = getPara("remark");
        info.set("project_name",project_name);
        info.set("contract_num",contract_num);
        info.set("merchant_id",merchant_id);
        info.set("merchant_name",merchant_name);
        info.set("warehouse",warehouse);
        info.set("material_id",material_id);
        info.set("material_name",material_name);
        info.set("material_code",material_code);
        info.set("purchase_type_id",purchase_type_id);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_id",standard_id);
        info.set("count",count);
        BigDecimal percent = new BigDecimal(1);
        if (material.getBigDecimal("discount") != null) {
            percent = (new BigDecimal(100).subtract(material.getBigDecimal("discount"))).divide(new BigDecimal(100));
            info.set("discount",material.getBigDecimal("discount"));
        }else{
            info.set("discount",BigDecimal.ZERO);
        }
        if (material.getBigDecimal("price")!= null) {
            info.set("money",(count.multiply(material.getBigDecimal("price"))).multiply(percent));
        }else {
            info.set("money",BigDecimal.ZERO);
        }
        if (material.getBigDecimal("price") != null) {
            info.set("price",material.getBigDecimal("price"));
        }else {
            info.set("price",BigDecimal.ZERO);
        }
        info.set("unit",material.getStr("unit"));
        info.set("transport_person",transport_person);
        info.set("car_num",car_num);
        info.set("weigh_person",weigh_person);
        info.set("send_person_id",send_person_id);
        info.set("send_person",send_person);
        info.set("accept_person_id",accept_person_id);
        info.set("accept_person",accept_person);
        info.set("remark",remark);
        info.update();
        redirect("/output/index");
    }


    public void delete(){
        Integer id = getParaToInt("id");
        OutputInfo info = OutputInfo.dao.findById(id);
        if (info != null) {
            info.set("status",Status.INVALID);
            info.update();
        }
        renderJson(JsonResult.success());
    }

    public void getSendPersons(){
        String merchantId = getPara("merchantId");
        List<Person> persons = Person.getPersons(merchantId);
        Map root = new HashMap();
        root.put("data", persons);
        renderJson(JsonKit.toJson(root));
    }

    public void getUnit(){
        String id = getPara("material");
        Material material = Material.dao.findById(id);
        if (material != null) {
            renderJson(material.get("unit"));
        }

    }

    public void importExcel(){
        try {
            InputStream in = new FileInputStream(getFile("excel").getFile());
//            HSSFWorkbook hssfWorkbook = new HSSFWorkbook(in);
            XSSFWorkbook xssfSheets = new XSSFWorkbook(in);
            // 循环工作表Sheet
            for (int numSheet = 0; numSheet < xssfSheets.getNumberOfSheets(); numSheet++) {
                XSSFSheet xssfSheet = xssfSheets.getSheetAt(numSheet);
                if (xssfSheet == null) {
                    continue;
                }
                // 循环行Row
                for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
                    XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                    if (xssfRow == null) {
                        continue;
                    }
                    XSSFCell xh = xssfRow.getCell(0);
                    if (xh == null) {
                        continue;
                    }
                    XSSFCell xm = xssfRow.getCell(1);
                    if (xm == null) {
                        continue;
                    }
                    XSSFCell yxsmc = xssfRow.getCell(2);
                    if (yxsmc == null) {
                        continue;
                    }
                    XSSFCell kcm = xssfRow.getCell(3);
                    if (kcm == null) {
                        continue;
                    }
                }
            }
            JsonResult json = JsonResult.success();
            json.msg("导入成功!");
            renderJson(json.toJson());
        } catch (Exception e) {
            e.printStackTrace();
            JsonResult json = JsonResult.fail();
            json.msg("导入失败!");
            renderJson(json.toJson());
        }
    }

    public void exportExcel() {
        XSSFWorkbook wb = new XSSFWorkbook();
        XSSFSheet sheet = wb.createSheet("入库单");
        sheet.setColumnWidth(0, 5000);
        sheet.setColumnWidth(1, 5000);
        sheet.setColumnWidth(2, 5000);
        sheet.setColumnWidth(3, 5000);
        sheet.setColumnWidth(4, 5000);
        sheet.setColumnWidth(5, 5000);
        sheet.setColumnWidth(6, 5000);
        sheet.setColumnWidth(7, 5000);
        sheet.setColumnWidth(8, 5000);
        sheet.setColumnWidth(9, 5000);
        sheet.setColumnWidth(10, 5000);
        sheet.setColumnWidth(11, 5000);
        sheet.setColumnWidth(12, 5000);
        sheet.setColumnWidth(13, 5000);
        sheet.setColumnWidth(14, 5000);
        sheet.setColumnWidth(15, 5000);
        sheet.setColumnWidth(16, 10000);
        XSSFRow row = sheet.createRow(0);
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式
        XSSFCell cell = row.createCell(0);
        cell.setCellValue("出库日期");
        cell.setCellStyle(style);

        cell = row.createCell(1);
        cell.setCellValue("出库单号");
        cell.setCellStyle(style);

        cell = row.createCell(2);
        cell.setCellValue("物品编号");
        cell.setCellStyle(style);

        cell = row.createCell(3);
        cell.setCellValue("物品名称");
        cell.setCellStyle(style);

        cell = row.createCell(4);
        cell.setCellValue("物品类别");
        cell.setCellStyle(style);

        cell = row.createCell(5);
        cell.setCellValue("物品计量单位");
        cell.setCellStyle(style);

        cell = row.createCell(6);
        cell.setCellValue("物品计量单价");
        cell.setCellStyle(style);

        cell = row.createCell(7);
        cell.setCellValue("规格");
        cell.setCellStyle(style);

        cell = row.createCell(8);
        cell.setCellValue("折扣");
        cell.setCellStyle(style);

        cell = row.createCell(9);
        cell.setCellValue("物品数量");
        cell.setCellStyle(style);

        cell = row.createCell(10);
        cell.setCellValue("物品总额");
        cell.setCellStyle(style);

        cell = row.createCell(11);
        cell.setCellValue("所出仓库");
        cell.setCellStyle(style);

        cell = row.createCell(12);
        cell.setCellValue("收货人");
        cell.setCellStyle(style);

        cell = row.createCell(13);
        cell.setCellValue("发货人");
        cell.setCellStyle(style);

        cell = row.createCell(14);
        cell.setCellValue("司机车号");
        cell.setCellStyle(style);

        cell = row.createCell(15);
        cell.setCellValue("过磅人");
        cell.setCellStyle(style);

        cell = row.createCell(16);
        cell.setCellValue("备注");
        cell.setCellStyle(style);
        List<OutputInfo> infos = OutputInfo.getList();
        for (int i = 0; i < infos.size(); i++) {
            OutputInfo info = infos.get(i);
            row = sheet.createRow(i + 1);
            if (info.getDate("input_time") != null) {
                row.createCell(0).setCellValue(DateUtils.format(info.getDate("output_time"), "yyyy/MM/dd"));
            }
            row.createCell(1).setCellValue(info.getStr("code"));
            row.createCell(2).setCellValue(info.getStr("material_code"));
            row.createCell(3).setCellValue(info.getStr("material_name"));
            row.createCell(4).setCellValue(info.getStr("purchase_type_name"));
            row.createCell(5).setCellValue(info.getStr("unit"));
            row.createCell(6).setCellValue(info.getBigDecimal("price")+"/"+info.get("unit"));
            row.createCell(7).setCellValue(info.getStr("standard_name"));
            row.createCell(8).setCellValue(info.getBigDecimal("discount")+"");
            row.createCell(9).setCellValue(info.getBigDecimal("count")+"");
            row.createCell(10).setCellValue(info.getBigDecimal("money")+"");
            row.createCell(11).setCellValue(info.getStr("warehouse"));
            row.createCell(12).setCellValue(info.getStr("accept_person"));
            row.createCell(13).setCellValue(info.getStr("send_person"));
            row.createCell(14).setCellValue(info.getStr("car_num"));
            row.createCell(15).setCellValue(info.getStr("weigh_person"));
            row.createCell(16).setCellValue(info.getStr("remark"));
        }
        try {
            getResponse().reset();
            getResponse().setContentType("application/vnd.ms-excel");
            String fileName = "出库单-" + new SimpleDateFormat("MMddHHmmSSS").format(new Date()) + ".xls";
            getResponse().setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes(), "iso-8859-1"));
            OutputStream outStream = getResponse().getOutputStream();
            wb.write(outStream);
            outStream.close();
            renderNull();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
