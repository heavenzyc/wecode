package com.wecode.framework.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.time.DateFormatUtils;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DateUtils extends org.apache.commons.lang.time.DateUtils {
	
	private static final Logger log = LoggerFactory.getLogger(DateUtils.class);


    /**
     * 使用预设格式提取字符串日期
     * 
     * @param date
     *            日期字符串
     * @return
     */
    public static Date parse(String str) {
		try {
			return DateUtils.parseDate((String) str, new String[] {
				"yyyy-MM-dd HH:mm:ss.SSS",
				"yyyy-MM-dd HH:mm:ss.S",
				"yyyy-MM-dd HH:mm:ss",
				"yyyy-MM-dd"
			});
		} catch (ParseException e) {
			return null;
		}
    }

    /**
     * 指定指定日期字符串
     * 
     * @param date
     * @param pattern
     * @return
     */
    public static Date parse(String date, String pattern) {
        SimpleDateFormat df = new SimpleDateFormat(pattern);
        try {
            return df.parse(date);
        } catch (ParseException e) {
        	log.error("Can't parse date " + date + " with pattern " + pattern, e);
            return null;
        }
    }
    
    /**
     * 格式化日期
     * @param date
     * @param pattern
     * @return
     */
    public static String format(Date date, String pattern) {
    	return DateFormatUtils.format(date, pattern);
    }

    public static String formatDate(Date date) {
        return format(date, "yyyy-MM-dd");
    }
    
    public static String formatDateTime(Date date) {
    	return format(date, "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * 判断日期的相隔天数
     * 
     * @param startDate
     * @param endDate
     * @return
     */
    public static int getDistDates(Date startDate, Date endDate) {
        long totalDate = 0;
        Calendar startCalendar = Calendar.getInstance();
        startCalendar.setTime(startDate);
        Calendar endalendar = Calendar.getInstance();
        endalendar.setTime(endDate);
        long timestart = startCalendar.getTimeInMillis();
        long timeend = endalendar.getTimeInMillis();
        totalDate = Math.abs((timeend - timestart)) / (1000 * 60 * 60 * 24);
        return Long.valueOf(totalDate).intValue();
    }

    /**
     * 获取传入日期的星期
     * 
     * @param date
     * @return
     */
    public static String getChineseDayWeek(Date date) {
        String[] weeks = { "星期天", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" };
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int dayinweek = cal.get(Calendar.DAY_OF_WEEK) - 1;
        return weeks[dayinweek];
    }

    /**
     * 根据出生日期计算年龄
     */
    public static int getAge(Date birthDay) {
        if (birthDay == null) {
            return 0;
        }
        Calendar cal = Calendar.getInstance();
        if (cal.before(birthDay)) {
            return 0;
        }
        int yearNow = cal.get(Calendar.YEAR);
        int monthNow = cal.get(Calendar.MONTH);
        int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);
        cal.setTime(birthDay);
        int yearBirth = cal.get(Calendar.YEAR);
        int monthBirth = cal.get(Calendar.MONTH);
        int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);
        int age = yearNow - yearBirth;
        if (monthNow <= monthBirth) {
            if (monthNow == monthBirth) {
                if (dayOfMonthNow < dayOfMonthBirth) {
                    age--;
                }
            } else {
                age--;
            }
        }
        return age;
    }

    /**
     * 把当前日期转换为当日的第一秒
     * 
     * @param date
     *            原始日期
     * @return 转换后的日期, xxxx-xx-xx 00:00:00
     */
    public static Date getBeginOfDay(Date date) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(date);
        gc.set(Calendar.HOUR_OF_DAY, 0);
        gc.set(Calendar.MINUTE, 0);
        gc.set(Calendar.SECOND, 0);
        return gc.getTime();
    }

    /**
     * 把当前日期转换为当日的最后一秒
     * 
     * @param date
     *            原始日期
     * @return 转换后的日期, xxxx-xx-xx 23:59:59
     */
    public static Date getEndOfDay(Date date) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(date);
        gc.set(Calendar.HOUR_OF_DAY, 23);
        gc.set(Calendar.MINUTE, 59);
        gc.set(Calendar.SECOND, 59);
        return gc.getTime();
    }

    /**
     * 构建日期
     * 
     * @param year
     * @param month
     * @param day
     * @return
     */
    public static Date buildDate(int year, int month, int day) {
        Calendar c = Calendar.getInstance();
        c.set(Calendar.YEAR, year);
        c.set(Calendar.MONTH, month - 1);
        c.set(Calendar.DAY_OF_MONTH, day);
        return c.getTime();
    }

    /**
     * 获取指定月的
     * 
     * @param date
     * @return
     */
    public static Date getBeginOfMonth(Date date) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(date);
        gc.set(Calendar.DAY_OF_MONTH, 1);
        return getBeginOfDay(gc.getTime());
    }

    /**
     * 获取指定月的月尾
     * 
     * @param date
     * @return
     */
    public static Date getEndOfMonth(Date date) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int maxDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		cal.set(Calendar.DAY_OF_MONTH, maxDay);
        return getEndOfDay(cal.getTime());
    }

    /**
     * 判断日期是否是闰年
     * 
     * @param year
     * @return
     */
    public static boolean isLeapYear(int year) {
        return (year % 4 == 0 && year % 100 != 0 || year % 400 == 0);
    }

    /**
     * 获取当月天数
     * 
     * @param year
     * @param month
     * @return
     */
    public static int getDaysOfMonth(int year, int month) {
        int result = 0;
        switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 4:
        case 6:
        case 9:
        case 11:
            return 30;
        case 2:
            return isLeapYear(year) ? 29 : 28;
        }
        return result;
    }

    /**
     * 获取当年的第一天
     * 
     * @param date
     * @return
     */
    public static Date getBeginOfYear(Date date) {
        GregorianCalendar gc = new GregorianCalendar();
        gc.setTime(date);
        gc.set(Calendar.DAY_OF_YEAR, 1);
        return getBeginOfDay(gc.getTime());
    }

    /**
     * 获取一年最后一天
     * 
     * @param date
     * @return
     */
    public static Date getEndOfYear(Date date) {
    	Date lastDay = new DateTime(date).withDayOfYear(1).toDate();
    	return getEndOfDay(lastDay);
    }
    
    public static Date getBeginOfWeek(Date date) {
    	DateTime dt = new DateTime(date)
    		.dayOfWeek()
    		.withMinimumValue();
    	return getBeginOfDay(dt.toDate());
    }
    
    public static Date getEndOfWeek(Date date) {
    	DateTime dt = new DateTime(date)
    	.dayOfWeek()
    	.withMaximumValue();
    	return getBeginOfDay(dt.toDate());
    }

    /**
     * 微信传入时间转化
     * 
     * @param longTime
     * @return
     */
    public static Date formatWXTimeToDate(Long createTime) {
        long msgCreateTime = createTime * 1000L;
        return new Date(msgCreateTime);
    }
    
    public static void main(String[] args) {
		Date now = new Date();
		System.out.println(getBeginOfWeek(now));
	}

}
