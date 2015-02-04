package com.jfinal.ext.plugin.guice;

import java.sql.SQLException;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jfinal.plugin.activerecord.ActiveRecordException;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.IAtom;

/**
 * @author heaven.zyc 2014年6月15日 上午11:56:35
 */
public class TxInterceptor implements MethodInterceptor{
	
	@SuppressWarnings("unused")
	private static final Logger log = LoggerFactory.getLogger(TxInterceptor.class);

	@Override
	public Object invoke(final MethodInvocation invocation) throws Throwable {
		final Holder holder = new Holder();
		DbPro.use().tx(new IAtom(){
			public boolean run() throws SQLException {
				try {
					holder.result = invocation.proceed();
				} catch (RuntimeException e) {
//					log.error(e.getMessage(),e);
					throw e;
				} catch (Throwable e) {
//					log.error(e.getMessage(),e);
					throw new ActiveRecordException(e);
				}
				return true;
			}});
		return holder.result;
	}
	
	private static class Holder{
		private Object result;
	}

}
