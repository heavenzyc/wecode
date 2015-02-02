package com.wecode.modules.wbp.common.bean.event;

/**
 * 普通按钮
 * 
 * @author lk215
 * 
 */
public class CommonButton extends Button {
    private String type;
    private String key;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }
}
