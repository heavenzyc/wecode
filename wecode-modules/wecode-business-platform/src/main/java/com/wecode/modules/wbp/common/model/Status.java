package com.wecode.modules.wbp.common.model;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
public enum Status {
    VALID("有效"),
    INVALID("无效");

    private String desc;

    Status(String desc) {
        this.desc = desc;
    }

    public String getDesc() {
        return desc;
    }

    public static Status indexOf(int i) {
        Status[] statusList = Status.values();
        if (i < 0 || i >= statusList.length) {
            return statusList[0];
        }
        return statusList[i];
    }
}
