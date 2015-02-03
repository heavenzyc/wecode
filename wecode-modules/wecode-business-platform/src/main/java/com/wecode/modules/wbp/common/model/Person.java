package com.wecode.modules.wbp.common.model;

import com.jfinal.ext.plugin.tablebind.TableBind;
import com.wecode.framework.ext.jfinal.model.BaseModel;

import java.util.List;

/**
 * Created by heaven.zyc on 2015/2/2.
 */
@TableBind(tableName = "person")
public class Person extends BaseModel<Person, Integer> {

    private static final long serialVersionUID = 1L;

    public static Person dao = new Person();

    public static enum PersonType {
        SEND("发货人"),
        ACCEPT("收货人");

        private String desc;

        PersonType(String desc) {
            this.desc = desc;
        }

        public String getDesc() {
            return desc;
        }

        public static PersonType indexOf(int i) {
            PersonType[] statusList = PersonType.values();
            if (i < 0 || i >= statusList.length) {
                return statusList[0];
            }
            return statusList[i];
        }
    }

    public PersonType getPersonType() {
        String i = getStr("type");
        return PersonType.valueOf(i);
    }

    public static List<Person> getPersons(String merchantCode) {
        String sql = "select * from person where merchant_id=?";
        return dao.find(sql,merchantCode);
    }
}
