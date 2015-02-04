package com.wecode.framework.ext.jfinal.db;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.commons.collections.MapUtils;

import com.jfinal.plugin.activerecord.Table;
import com.jfinal.plugin.activerecord.dialect.MysqlDialect;

/**
 * 自定义的mysql方言，实现乐观锁功能
 * @author heaven.zyc 2014年6月19日 下午2:36:36
 */
public class MysqlDialectExt extends MysqlDialect {
	
//	private String dataVersionField = "data_version";
	
	public MysqlDialectExt() {
	}
	
//	/**
//	 * 自定义乐观锁版本字段名字
//	 * @param dataVersionField
//	 */
//	public MysqlDialectExt(String dataVersionField) {
//		this.dataVersionField = dataVersionField;
//	}

	/**
	 * 增加对乐观锁的支持
	 */
	@Override
	public void forModelUpdate(Table table, Map<String, Object> attrs, Set<String> modifyFlag, String primaryKey, Object id, StringBuilder sql,
			List<Object> paras) {
		DataVersion dataVersion = table.getModelClass().getAnnotation(DataVersion.class);
		//如果没有含乐观锁版本字段，使用父类的实现.
		if(dataVersion == null) {
//		if(!attrs.containsKey(dataVersionField)) {
			super.forModelUpdate(table, attrs, modifyFlag, primaryKey, id, sql, paras);
			return;
		}
		String field = dataVersion.value();
		
		final int oldVersion = MapUtils.getIntValue(attrs,field);
		final int newVersion = oldVersion + 1;
		
		sql.append("update `").append(table.getName()).append("` set ");
		for (Entry<String, Object> e : attrs.entrySet()) {
			String colName = e.getKey();
			if (!primaryKey.equalsIgnoreCase(colName) && modifyFlag.contains(colName) && table.hasColumnLabel(colName)) {
				if (paras.size() > 0)
					sql.append(", ");
				sql.append("`").append(colName).append("` = ? ");
				paras.add(e.getValue());
			}
		}
		sql.append(", `").append(field).append("` = ? ");
		paras.add(newVersion);
		
		sql.append(" where `").append(primaryKey).append("` = ?");	// .append(" limit 1");
		paras.add(id);
		
		sql.append(" and `").append(field).append("` = ?");
		paras.add(oldVersion);
	}
	
	/**
	 * 增加对枚举值的支持
	 */
	@SuppressWarnings("rawtypes")
	@Override
	public void fillStatement(PreparedStatement pst, Object... paras) throws SQLException {
		for (int i=0; i<paras.length; i++) {
			Object value = paras[i];
			if (value instanceof Enum) {
				Enum v = (Enum)value;
				String val = v.name();
				pst.setObject(i + 1, val);
			} else {
				pst.setObject(i + 1, value);
			}
		}
	}

}
