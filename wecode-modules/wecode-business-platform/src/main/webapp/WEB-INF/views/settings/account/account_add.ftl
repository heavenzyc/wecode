<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js","${jspath}/validform.min.js"]>
<@we.breadcrumb current="创建帐号"/>

<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<form class="form-horizontal" role="form" action="${path}/admin/settings/account/save" method="post" id="formAdd">
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-name">姓名</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-name" placeholder="姓名" class="col-xs-10 col-sm-5" name="name" datatype="s2-20" errormsg="请输入正确的姓名" nullmsg="请输入姓名"/>
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-account">登录帐户</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-account" placeholder="登录帐户" class="col-xs-10 col-sm-5" name="account" datatype="s2-20" errormsg="请输入正确的登录帐户" nullmsg="请输入登录帐户"/>
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-password">登录密码</label>

					<div class="col-sm-9">
						<input type="password" id="form-field-password" placeholder="密码" class="col-xs-10 col-sm-5" name="password"  datatype="s6-12" errormsg="密码在6-12位之间" nullmsg="请输入密码"/>
						<#-- <span class="help-inline col-xs-12 col-sm-7">
							<span class="middle">6-12位之间</span>
						</span> -->
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-roles">角色</label>

					<div class="col-sm-9">
						<select multiple="" class="width-40 chosen-select" id="form-field-select-roles" data-placeholder="选择角色..." name="role">
							<#list roleList as role><option value="${role.code}">${role.name!?html}</option></#list>
						</select>
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-projects">楼盘</label>

					<div class="col-sm-9">
						<select multiple="" class="width-40 chosen-select" id="form-field-select-projects" data-placeholder="选择楼盘..." name="project">
							<#list projectList as p><option value="${p.id}">${p.name!?html}</option></#list>
						</select>
					</div>
				</div>

				<div class="clearfix form-actions">

					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border" type="submit">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>

						&nbsp; &nbsp; &nbsp;
						<a class="btn no-border" href="${path}/admin/settings/account/" id="btnCancel">
							<i class="icon-undo bigger-110"></i>
							取消
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($){
		$(".chosen-select").chosen();

		$("#btnCancel").click(function(){
			if(!confirm("要取消吗?")){
				return false;
			}
		})

		// 验证插件
		$("#formAdd").Validform({
			tiptype:3,
			showAllError:true,
			ajaxPost:false
		})
	});
</script>

</@we.html>