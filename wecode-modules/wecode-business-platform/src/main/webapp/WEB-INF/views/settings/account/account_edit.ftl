<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js"]>
<@we.breadcrumb current="修改帐号"/>

<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<form class="form-horizontal" role="form" action="${path}/admin/settings/account/update" method="post">
				<input type="hidden" name="userId" value="${editUser.id}"/>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-name">姓名</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-name" placeholder="姓名" class="col-xs-10 col-sm-5" name="name" value="${editUser.name!}"/>
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-account">登录帐户</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-account" placeholder="登录帐户" class="col-xs-10 col-sm-5" name="account"  value="${editUser.account!}" readonly />
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-roles">角色</label>

					<div class="col-sm-9">
						<select multiple="" class="width-40 chosen-select" id="form-field-select-roles" data-placeholder="选择角色..." name="role">
							<#list roleList as role><option value="${role.code}" <#if (userRoles?seq_contains(role))>selected</#if>>${role.name!?html}</option></#list>
						</select>
					</div>
				</div>

				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-projects">楼盘</label>

					<div class="col-sm-9">
						<select multiple="" class="width-40 chosen-select" id="form-field-select-projects" data-placeholder="选择楼盘..." name="project">
							<#list projectList as p><option value="${p.id}" <#if (userProjects?seq_contains(p))>selected</#if>>${p.name!?html}</option></#list>
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
			// if(!confirm("要取消吗?")){
			// 	return false;
			// }
		})
	});
</script>

</@we.html>