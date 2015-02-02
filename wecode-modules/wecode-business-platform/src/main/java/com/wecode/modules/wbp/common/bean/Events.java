package com.wecode.modules.wbp.common.bean;

public enum Events {
    EVENT("event"), SUBSCRIBE("subscribe"), UNSUBSCRIBE("unsubscribe"), CLICK("CLICK"), VIEW("VIEW");

    private String type;

    Events(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
