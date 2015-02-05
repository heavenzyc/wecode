package com.wecode.modules.wbp.common.controller;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.ActionKey;
import com.jfinal.ext.route.ControllerBind;
import com.wecode.framework.util.RSAUtils;
import com.wecode.framework.util.StringUtils;
import org.apache.commons.codec.binary.Hex;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.interfaces.RSAPublicKey;

/**
 * @author heaven.zyc 2014年5月28日 下午5:58:44
 */
@ControllerBind(controllerKey = "/", viewPath = "/")
public class IndexController extends BaseController{

    private static final Logger log = LoggerFactory.getLogger(IndexController.class);

    public void index() {
        renderFreeMarker("login.ftl");
    }

    @ClearInterceptor(ClearLayer.ALL)
    public void login() {
        // 解出帐户与密码
        /*String[] result = RSAUtils.decryptUsernameAndPwd(getPara("key"));*/
        String username = getPara("username");
        String password = getPara("password");
        if (!"admin".equals(username) || !"admin".equals(password)) {
            forwardAction("密码错误", "/");
            return;
        } else {
            getSession().setAttribute("operator",username);
            renderTop("/input/index");
            return;
        }
    }

    public void logout() {
        try {
            Subject subject = SecurityUtils.getSubject();
            subject.logout();
            renderTop("/");
        } catch (AuthenticationException e) {
            log.error(e.getMessage(), e);
            renderText("异常：" + e.getMessage());
        }
    }

}
