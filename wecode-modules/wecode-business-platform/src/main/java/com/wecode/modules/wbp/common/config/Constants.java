package com.wecode.modules.wbp.common.config;

import java.util.HashMap;
import java.util.Map;

import com.jfinal.ext.plugin.config.ConfigKit;
import com.jfinal.kit.PathKit;
import com.wecode.framework.util.FileUtils;

public class Constants {

    // public static final String SESSION_USER = "__user__";
    public static final String SESSION_PROJECT_ID = "current_project_id";

    public static final String WXROBOT_DOMAIN = ConfigKit.getStr("app.wxrobot.domain");

    public static String TMP_FS_PATH = PathKit.getWebRootPath() + "/temp";

    public static int MAX_POST_SIZE = 5 * 1024 * 1024;

    public static Map<String, Integer> UPLOAD_TYPE = new HashMap<String, Integer>();

    static {
        UPLOAD_TYPE.put("config", 0);
        UPLOAD_TYPE.put("uploadimage", 1);
        UPLOAD_TYPE.put("listimage", 2);

        TMP_FS_PATH = ConfigKit.getStr("app.constants.tmp_fs_path", PathKit.getWebRootPath() + "/temp");
        MAX_POST_SIZE = ConfigKit.getInt("app.constants.max_post_size", 5 * 1024 * 1024);

        createTmpDirectory(TMP_FS_PATH);
    }

    private static void createTmpDirectory(String path) {
        boolean flag = FileUtils.isDirectory(path);
        if (!flag) {
            FileUtils.createDirectory(path);
        }
    }
}
