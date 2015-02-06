package com.wecode.modules.wbp.common.config;

import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.wecode.framework.util.FileUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zkdu on 2015/2/6.
 */
public class FileUpload {

    public static String upload(File source){
        String path = new SimpleDateFormat("yyyyMMdd").format(new Date());
        String fileName = source.getName();
        try {
            FileInputStream fis = new FileInputStream(source);
            File targetDir = new File(PathKit.getWebRootPath() + File.separator + "upload"+File.separator+ path);
            if (!targetDir.exists()) {
                targetDir.mkdirs();
            }
            File target = new File(targetDir, fileName);
            if (!target.exists()) {
                target.createNewFile();
            }
            FileOutputStream fos = new FileOutputStream(target);
            byte[] bts = new byte[300];
            while (fis.read(bts, 0, 300) != -1) {
                fos.write(bts, 0, 300);
            }
            fos.close();
            fis.close();
            source.delete();
            return "/upload/"+ path;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }
}
