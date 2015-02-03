package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.Before;
import com.jfinal.ext.route.ControllerBind;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.tx.Tx;
import com.wecode.framework.json.JsonResult;
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
@ControllerBind(controllerKey = "/input", viewPath = "/input")
public class InputController extends BaseController{

    public void index(){
        renderFreeMarker("input.ftl");
    }

    public void list(){
        Page<InputInfo> page = InputInfo.getPage(getParaToInt("page", 1),getParaToInt("rows", 10));
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
        List<ProvideMerchant> merchants = ProvideMerchant.getList();
        List<Material> materials = Material.getList();
        List<AcceptMerchant> accepts = AcceptMerchant.getList();
        setAttr("providers",merchants);
        setAttr("materials",materials);
        setAttr("accepts",accepts);
        renderFreeMarker("input_add.ftl");
    }

    @Before(Tx.class)
    public void save(){
        String code = currentTimeMillis();
        String project_name = getPara("project_name");
        String contract_num = getPara("contract_num");
        String provide_merchant_code = getPara("provide_merchant_code");
        String provide_merchant_name = ProvideMerchant.getByCode(provide_merchant_code).get("name");
        String warehouse = getPara("warehouse");
        String material_code = getPara("material_code");
        Material material = Material.getByCode(material_code);
        String material_name = material.get("name");
        String purchase_type_code = material.get("type_code");
        String purchase_type_name = material.get("type_name");
        String standard_code = material.get("standard_code");
        String standard_name = material.get("standard_name");
        BigDecimal count = getBigDecimal("count");
        String transport_person = getPara("transport_person");
        String car_num = getPara("car_num");
        String weigh_person = getPara("weigh_person");
        String send_person_code = getPara("send_person_code");
        Person person = Person.getByCode(send_person_code);
        String send_person = "";
        if (person != null) {
            send_person = person.get("name");
        }
        String accept_person_code = getPara("accept_person_code");
        person = Person.getByCode(accept_person_code);
        String accept_person = "";
        if (person != null) {
            accept_person = person.get("name");
        }
        String remark = getPara("remark");
        InputInfo info = new InputInfo();
        info.set("code",code);
        info.set("project_name",project_name);
        info.set("contract_num",contract_num);
        info.set("provide_merchant_code",provide_merchant_code);
        info.set("provide_merchant_name",provide_merchant_name);
        info.set("warehouse",warehouse);
        info.set("material_code",material_code);
        info.set("material_name",material_name);
        info.set("purchase_type_code",purchase_type_code);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_code",standard_code);
        info.set("count",count);
        info.set("money",count.multiply(material.getBigDecimal("price")));
        info.set("price",material.getBigDecimal("price"));
        info.set("unit",material.getStr("unit"));
        info.set("transport_person",transport_person);
        info.set("car_num",car_num);
        info.set("weigh_person",weigh_person);
        info.set("send_person_code",send_person_code);
        info.set("send_person",send_person);
        info.set("accept_person_code",accept_person_code);
        info.set("accept_person",accept_person);
        info.set("input_time",new Date());
        info.set("remark",remark);
        info.set("create_time",new Date());
        info.set("status",Status.VALID.name());
        info.save();
        redirect("/input/index");
    }

    public void update(){
        Integer id = getParaToInt();
        InputInfo info = InputInfo.dao.findById(id);
        setAttr("data",info);
        List<ProvideMerchant> merchants = ProvideMerchant.getList();
        List<Material> materials = Material.getList();
        List<AcceptMerchant> accepts = AcceptMerchant.getList();
        setAttr("providers",merchants);
        setAttr("materials",materials);
        setAttr("accepts",accepts);
        renderFreeMarker("input_edit.ftl");
    }

    @Before(Tx.class)
    public void modify(){
        Integer id = getParaToInt("id");
        InputInfo info = InputInfo.dao.findById(id);
        String project_name = getPara("project_name");
        String contract_num = getPara("contract_num");
        String provide_merchant_code = getPara("provide_merchant_code");
        String provide_merchant_name = ProvideMerchant.getByCode(provide_merchant_code).get("name");
        String warehouse = getPara("warehouse");
        String material_code = getPara("material_code");
        Material material = Material.getByCode(material_code);
        String material_name = material.get("name");
        String purchase_type_code = material.get("type_code");
        String purchase_type_name = material.get("type_name");
        String standard_code = material.get("standard_code");
        String standard_name = material.get("standard_name");
        BigDecimal count = getBigDecimal("count");
        String transport_person = getPara("transport_person");
        String car_num = getPara("car_num");
        String weigh_person = getPara("weigh_person");
        String send_person_code = getPara("send_person_code");
        Person person = Person.getByCode(send_person_code);
        String send_person = "";
        if (person != null) {
            send_person = person.get("name");
        }
        String accept_person_code = getPara("accept_person_code");
        person = Person.getByCode(accept_person_code);
        String accept_person = "";
        if (person != null) {
            accept_person = person.get("name");
        }
        String remark = getPara("remark");
        info.set("project_name",project_name);
        info.set("contract_num",contract_num);
        info.set("provide_merchant_code",provide_merchant_code);
        info.set("provide_merchant_name",provide_merchant_name);
        info.set("warehouse",warehouse);
        info.set("material_code",material_code);
        info.set("material_name",material_name);
        info.set("purchase_type_code",purchase_type_code);
        info.set("purchase_type_name",purchase_type_name);
        info.set("standard_name",standard_name);
        info.set("standard_code",standard_code);
        info.set("count",count);
        info.set("money",count.multiply(material.getBigDecimal("price")));
        info.set("price",material.getBigDecimal("price"));
        info.set("unit",material.getStr("unit"));
        info.set("transport_person",transport_person);
        info.set("car_num",car_num);
        info.set("weigh_person",weigh_person);
        info.set("send_person_code",send_person_code);
        info.set("send_person",send_person);
        info.set("accept_person_code",accept_person_code);
        info.set("accept_person",accept_person);
        info.set("remark",remark);
        info.update();
        redirect("/input/index");
    }


    public void delete(){
        Integer id = getParaToInt("id");
        InputInfo info = InputInfo.dao.findById(id);
        if (info != null) {
            info.set("status",Status.INVALID);
            info.update();
        }
        renderJson(JsonResult.success());
    }

    public void getSendPersons(){
        String merchantCode = getPara("merchantCode");
        List<Person> persons = Person.getPersons(merchantCode, Person.PersonType.SEND);
        Map root = new HashMap();
        root.put("data", persons);
        renderJson(JsonKit.toJson(root));
    }

    public void getAcceptPersons(){
        String merchantCode = getPara("merchantCode");
        List<Person> persons = Person.getPersons(merchantCode, Person.PersonType.ACCEPT);
        Map root = new HashMap();
        root.put("data", persons);
        renderJson(JsonKit.toJson(root));
    }

    public void getUnit(){
        String code = getPara("material");
        Material material = Material.getByCode(code);
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
