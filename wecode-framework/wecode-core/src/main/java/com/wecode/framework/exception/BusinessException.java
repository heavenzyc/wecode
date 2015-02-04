package com.wecode.framework.exception;

/**
 * 业务异常
 *
 * @author heaven.zyc 2014-2-17 下午2:53:27
 */
public class BusinessException extends RuntimeException {

	public static enum ActionType {
		INDEX("返回首页"), BACK("返回上一页");

		private String desc;

		ActionType(String desc) {
			this.desc = desc;
		}

		public String getDesc() {
			return desc;
		}
	}

	private static final long serialVersionUID = 1L;
	private ActionType actionType;

	public BusinessException(String message, Throwable cause, ActionType actionType) {
		super(message, cause);
		this.actionType = actionType;
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
		this.actionType = ActionType.INDEX;
	}

	public BusinessException(String message) {
		super(message);
		this.actionType = ActionType.INDEX;
	}

	/**
	 * 构造业务异常
	 * @param message
	 * @param actionType 处理方式
	 * @see ActionType
	 */
	public BusinessException(String message, ActionType actionType) {
		super(message);
		this.actionType = actionType;
	}

	public ActionType getActionType() {
		return actionType;
	}

}
