package com.wecode.modules.wbp.common.controller;

import com.jfinal.ext.route.ControllerBind;
import com.wecode.framework.json.JsonResult;
import org.apache.poi.xssf.usermodel.*;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zkdu on 2015/2/2.
 */
@ControllerBind(controllerKey = "/input", viewPath = "/input")
public class InputController extends BaseController{

    public void index(){
        renderFreeMarker("input.ftl");
    }

    public void add(){
        renderFreeMarker("input_add.ftl");
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
