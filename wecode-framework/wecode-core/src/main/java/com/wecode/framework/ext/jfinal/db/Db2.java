package com.wecode.framework.ext.jfinal.db;

import java.util.ArrayList;
import java.util.List;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;

/**
 * @author heaven.zyc 2014年5月29日 下午5:31:05
 */
public class Db2 extends Db{

	/**
	 * 查询int的列表，如查询一堆ID
	 * @param sql
	 * @param paras
	 * @return
	 */
	public static List<Integer> queryIntList(String sql, Object... paras){
		List<Integer> result = new ArrayList<Integer>();
		List<Record> list = Db.find(sql, paras);
		for (Record record : list) {
			String[] colNames = record.getColumnNames();
			if(colNames.length != 1) {
				continue;
			}
			String col = colNames[0];
			Integer value = record.getInt(col);
			result.add(value);
		}
		return result;
	}
	
	/**
	 * 查询int数据
	 * @param sql
	 * @param paras
	 * @return
	 */
	public static Integer queryInt(String sql, Object...paras) {
		Object obj = Db.queryColumn(sql, paras);
		if(obj == null) {
			return 0;
		}
		if (obj instanceof Number) {
			Number value = (Number) obj;
			return value.intValue();
		}
		return 0;
	}
}
