package com.wecode.modules.wbp.common.bean;

public enum MsgTypes {
    TEXT("text"), LOCATION("location"), IMAGE("image"), LINK("link"), VOICE("voice"), EVENT("event"), VIDEO("video"), NEWS(
            "news"), MUSIC("music"), VERIFY("verify"); 
    private String type;

    MsgTypes(String type) {
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
