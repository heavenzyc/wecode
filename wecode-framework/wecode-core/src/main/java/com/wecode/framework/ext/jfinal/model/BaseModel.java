package com.wecode.framework.ext.jfinal.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.commons.lang.time.DateUtils;

import com.jfinal.plugin.activerecord.Config;
import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.DbKit;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.TableMapping;
import com.jfinal.plugin.activerecord.cache.ICache;

/**
 * @author heaven.zyc 2014年5月28日 下午11:03:53
 */
public abstract class BaseModel<M extends Model<M>, PK extends Serializable> extends Model<M> {

//	public final String tableName;

	public BaseModel() {
//		TableBind table = this.getClass().getAnnotation(TableBind.class);
//
//		if (table != null) {
//			tableName = table.tableName();
//		} else {
//			throw new RuntimeException("You must using TableBind to annotation the class.");
//		}
	}
	
	/**
	 * 获取ID
	 * @return
	 */
	public PK getId() {
		return this.get("id");
	}
	
	public String getTable() {
		String tableName = TableMapping.me().getTable(getClass()).getName();
		return tableName;
	}
	
	public int asInt(String attr, int defaultValue) {
		Object value = get(attr);
		if(value == null) {
			return defaultValue;
		}
		String str = String.valueOf(value);
		return NumberUtils.toInt(str, defaultValue);
	}
	
	public int asInt(String attr) {
		return asInt(attr,0);
	}

	/**
	 * 将数据作为Double返回(不会抛出异常)，如果无法获取到，则返回null
	 * @param attr
	 * @return
	 */
	private Double toDouble(String attr) {
		Object obj = this.get(attr);
		if(obj == null) {
			return null;
		}
		if (obj instanceof Double) {
			Double value = (Double) obj;
			return value;
		}
		if (obj instanceof BigDecimal) {
			BigDecimal value = (BigDecimal) obj;
			return value.doubleValue();
		}
		if (obj instanceof Number) {
			Number value = (Number) obj;
			return value.doubleValue();
		}
		if (obj instanceof String) {
			String value = (String) obj;
			try {
				return Double.valueOf(value);
			}catch(Exception ex) {
				return null;
			}
		}
		return null;
	}

	/**
	 * 将属性作为double值返回,不会抛出异常.同时根据类型自动转换BigDecimal,避免BigDecimal和double的问题
	 * @param attr
	 * @param defaultValue
	 * @return
	 */
	public double asDouble(String attr, double defaultValue) {
		Double d = toDouble(attr);
		if(d != null) {
			return d;
		}
		return defaultValue;
	}
	
	/**
	 * 获取为时间格式
	 * <br/>尝试以下类型：
	 * yyyy-MM-dd HH:mm:ss.SSS
	 * yyyy-MM-dd HH:mm:ss.S
	 * yyyy-MM-dd HH:mm:ss
	 * yyyy-MM-dd
	 * @param attr
	 * @return
	 */
	public Date asDate(String attr) {
		Object value = this.get(attr);
		if(value instanceof Date) {
			return (Date)value;
		}
		if(value instanceof Timestamp) {
			return (Timestamp)value;
		}
		if(value instanceof java.sql.Date) {
			return (java.sql.Date)value;
		}
		if(value instanceof String) {
			try {
				return DateUtils.parseDate((String) value, new String[] {
					"yyyy-MM-dd HH:mm:ss.SSS",
					"yyyy-MM-dd HH:mm:ss.S",
					"yyyy-MM-dd HH:mm:ss",
					"yyyy-MM-dd"
				});
			} catch (ParseException e) {
				long v = NumberUtils.toLong((String)value,-1);
				if(v != -1) {
					return new Date(v);
				}
				return null;
			}
		}
		if(value instanceof Number) {
			long v = ((Number)value).longValue();
			return new Date(v);
		}
		return null;
	}

	/**
	 * 获取Date类型并转换为字符串
	 * @param string
	 * @param string2
	 * @return
	 */
	public String asDateStr(String attr, String pattern) {
		Date d = asDate(attr);
		if(d == null) {
			return null;
		}
		return com.wecode.framework.util.DateUtils.format(d, pattern);
	}
	
	/**
	 * 从缓存中获取对象,如果不存在,则根据SQL条件获取对象
	 * @param cacheName
	 * @param key
	 * @param sql
	 * @param paras
	 * @return
	 */
	public M findFirstWithCache(String cacheName, Object key, String sql, Object... paras) {
		Config config = DbKit.getConfig(getClass());
		ICache cache = config.getCache();
		M result = cache.get(cacheName, key);
		if (result == null) {
			result = findFirst(sql, paras);
			cache.put(cacheName, key, result);
		}
		return result;
	}

	/**
	 * 根据ID获取对象（如果缓存中有该对象，则通过缓存；如果不存在，则通过数据库，并同时放入缓存）
	 * @param cacheName
	 * @param key
	 * @param id
	 * @return
	 */
	public M findByIdWithCache(String cacheName, Object key, Object id) {
		Config config = DbKit.getConfig(getClass());
		ICache cache = config.getCache();
		M result = cache.get(cacheName, key);
		if (result == null) {
			result = findById(id);
			cache.put(cacheName, key, result);
		}
		return result;
	}

	public boolean updateById(String key, Object value, Object id) {
		return Db.update("update " + getTable() + " set " + key + "=? where id =?", value, id) > 0;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		BaseModel other = (BaseModel) obj;
		if (getId() == null) {
			if (other.getId() != null)
				return false;
		} else if (!getId().equals(other.getId()))
			return false;
		return true;
	}

}
