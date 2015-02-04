package com.wecode.modules.wbp.common.interceptor;

import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSONObject;
import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.wecode.framework.exception.BusinessException;

/**
 * @author heaven.zyc 2014年6月3日 上午12:43:49
 */
public class ExceptionInterceptor implements Interceptor {
    private Logger log = LoggerFactory.getLogger(ExceptionInterceptor.class);

    public void intercept(ActionInvocation ai) {
        try {
            ai.invoke();
        } catch (Throwable ex) {
            log.error("业务处理异常:", ex);
            String message = ex.getMessage();
            Throwable cause = ex.getCause();
            if (cause != null && (cause instanceof BusinessException)) {
                BusinessException bizEx = (BusinessException) cause;
                message = bizEx.getMessage();
            }
            if (StringUtils.isBlank(message)) {
                message = "未知错误:" + ex.getClass();
            }

            Controller c = ai.getController();
            HttpServletRequest request = c.getRequest();

            // 判断是否是ajax
            String requestedWith = request.getHeader("X-Requested-With");
            if (StringUtils.isNotBlank(requestedWith) && requestedWith.equals("XMLHttpRequest")) {
                try {
                    // c.getResponse().sendError(500, message);
                    JSONObject json = new JSONObject();
                    json.put("success", false);
                    json.put("message", message);
                    json.put("data", message);
                    c.renderJson(json.toString());
                } catch (Exception e) {
                    log.error(e.getMessage(), e);
                }
            } else {
                c.setAttr("message", message);
                c.setAttr("exception", ex);
                StringWriter sw = new StringWriter();
                ex.printStackTrace(new PrintWriter(sw));
                c.setAttr("detail", sw);
                c.renderFreeMarker("/WEB-INF/views/error.ftl");
            }
        }
    }
}
