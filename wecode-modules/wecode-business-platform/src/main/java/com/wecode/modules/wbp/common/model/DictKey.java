package com.wecode.modules.wbp.common.model;

/**
 * Created by heaven.zyc on 14-6-6.
 */
public enum DictKey {

    point_name("积分"),
    ac_title("我的账户信息"), //账户信息页面标题名称
    ac_ad_pic(""), //账户信息页面广告图片
    ac_right_pic(""), //账户信息右侧图配置
    ac_point_pic(""), //账户信息页面可用找房币右侧图配置

    task_title("我的活动任务"), //账户信息页面可用找房币右侧图配置
    task_ad_pic(""), //呼朋唤友广告图片
    invite_right_pic(""), //呼朋唤友右侧配图
    lottery_right_pic(""), //每日一刮右侧配图
    rank_ad_pic("") //找房币排行页面顶部图片
    ;

    private String desc;

    private DictKey(String desc){
        this.desc = desc;
    }
    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Class getType() {
        return null;
    }

    public static DictKey get(int value) {
        for (DictKey item : DictKey.values()) {
            if (item.ordinal() == value) {
                return item;
            }
        }
        throw new IllegalArgumentException("argument error: " + value);
    }
}
