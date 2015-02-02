package com.wecode.modules.wbp.common.bean;

public enum RuleMsgType {
    SUBSCRIBEREPLY("subscribereply"), AUTOREPLY("autoreply"), KEYWORDREPLY("keywordreply");

    private String type;

    RuleMsgType(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
