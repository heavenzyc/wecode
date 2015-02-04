package com.wecode.framework.ext.p6spy;

import com.p6spy.engine.logging.appender.Log4jLogger;

/**
 * 扩展P6SPY的配置，不打印resultset的SQL
 * @author heaven.zyc 2014年6月9日 下午5:40:09
 */
public class WecodeP6SpyLog4jLogger extends Log4jLogger {

    @Override
    public void logSQL(int connectionId, String now, long elapsed, String category, String prepared, String sql) {
        if ("resultset".equals(category)) {
            return;
        }
        super.logSQL(connectionId, now, elapsed, category, prepared, sql);
//        StringBuilder sqlBuilder = new StringBuilder();
//        sqlBuilder.append("now: ").append(now).append("|");
//        sqlBuilder.append("elapsed: ").append(elapsed).append("|");
//        sqlBuilder.append(connectionId == -1 ? "" : String.valueOf(connectionId) + "|");
//        sqlBuilder.append(category).append("|");
////        sql = new SQLFormatter().format(sql);
//        String logEntity = sqlBuilder.append("|").append(category).append("").append(sql).toString();
//        logText(logEntity);
    }
}