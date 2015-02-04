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
        Date start = null;
        if (StringUtils.isNotBlank(startStr)) {
            startStr += " 00:00:00";
            start = DateUtils.parse(startStr, "yyyy/MM/dd 00:00:00");
        }
        Date end = null;
        String endStr = getPara("end");
        if (StringUtils.isNotBlank(endStr)){
            endStr += " 23:59:59";
            end = DateUtils.parse(endStr,"yyyy/MM/dd 23:59:59");
        }
        Page<OutputInfo> page = OutputInfo.getPage(getParaToInt("page", 1),getParaToInt("rows", 10),transport,accepter,weighter,start,end);
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
        info.set("warehouse",warehouse);
        info.set("material_id",material_id);
        info.set("material_name",material_name);
        info.set("purchase_type_id",purchase_type_id);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_id",standard_id);
        info.set("count",count);
        info.set("money",count.multiply(material.getBigDecimal("price")));
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
        info.set("purchase_type_id",purchase_type_id);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_id",standard_id);
        info.set("count",count);
        info.set("money",count.multiply(material.getBigDecimal("price")));
        info.set("price",material.getBigDecimal("price"));
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
// 第一步，创建一个webbook，对应一个Excel文件
        XSSFWorkbook wb = new XSSFWorkbook();
        // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet
        XSSFSheet sheet = wb.createSheet("订单");
        sheet.setColumnWidth(0, 5000);
        sheet.setColumnWidth(1, 5000);
        sheet.setColumnWidth(2, 5000);
        sheet.setColumnWidth(3, 5000);
        sheet.setColumnWidth(4, 5000);
        // 第三步，在sheet中添加表头第0行,注意老版本poi对Excel的行数列数有限制short
        XSSFRow row = sheet.createRow((int) 0);
        // 第四步，创建单元格，并设置值表头 设置表头居中
        XSSFCellStyle style = wb.createCellStyle();
        style.setAlignment(XSSFCellStyle.ALIGN_CENTER); // 创建一个居中格式

        XSSFCell cell = row.createCell(0);
        cell.setCellValue("预定人");
        cell.setCellStyle(style);
        cell = row.createCell(1);
        cell.setCellValue("电话");
        cell.setCellStyle(style);
        cell = row.createCell(2);
        cell.setCellValue("入住时间");
        cell.setCellStyle(style);
        cell = row.createCell(3);
        cell.setCellValue("离店时间");
        cell.setCellStyle(style);
        cell = row.createCell(4);
        cell.setCellValue("订单状态");
        cell.setCellStyle(style);
        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，
        for (int i = 0; i < 2; i++) {
            row = sheet.createRow((int) i + 1);
            // 第四步，创建单元格，并设置值
            row.createCell(0).setCellValue(1);
            row.createCell(1).setCellValue(2);
            row.createCell(2).setCellValue(3);
            row.createCell(3).setCellValue(4);
            row.createCell(4).setCellValue(5);

            try {
                getResponse().reset(); // 非常重要
                getResponse().setContentType("application/vnd.ms-excel");
                String fileName = "预约订单-" + new SimpleDateFormat("MMddHHmmSSS").format(new Date()) + ".xls";
                getResponse().setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes(), "iso-8859-1"));
                //创建输出流对象
                OutputStream outStream = getResponse().getOutputStream();
                wb.write(outStream);
                outStream.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}