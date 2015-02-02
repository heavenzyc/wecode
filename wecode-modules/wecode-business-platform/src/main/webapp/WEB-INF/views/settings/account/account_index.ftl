<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
<@we.breadcrumb/>

<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-4">
			<h1>
				帐号管理
			</h1>
		</div>

		<div class="col-xs-8">
		<a class="btn no-border btn-primary pull-right" href="${path}/admin/settings/account/add">新建帐号</a>
		</div>
	</div><!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">

			<div class="table-responsive">
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>帐号</th>
							<th>姓名</th>
							<th class="hidden-480">状态</th>
							<th class="hidden-480">角色</th>
							<th class="hidden-480">楼盘</th>
							<th>
								<i class="icon-time bigger-110 hidden-480"></i>
								创建时间
							</th>
							<th>
								<i class="icon-time bigger-110 hidden-480"></i>
								最后登录时间
							</th>
							<th></th>
						</tr>
					</thead>

					<tbody>
						<#list userList as user>
						<tr>
							<td>${user_index+1}</td>
							<td>${user.account!?html}</td>
							<td>${user.name!?html}</td>
							<td class="hidden-480">
								<#if user.status==1><span class="label">已冻结</span>
								<#else><span class="label label-success arrowed-in">正常</span>
								</#if>
							</td>
							<td class="hidden-480">
								<#list user.getRoles() as role>
								${role.name!?html}<#if role_has_next>,</#if>
								</#list>
							</td>
							<td class="hidden-480">
								<#list user.getProjectList() as p>
								${p.name!?html}<#if p_has_next>,</#if>
								</#list>
							</td>
							<td>
								${(user.create_time?string("yyyy-MM-dd HH:mm:ss"))!}
							</td>
							<td>
								${(user.last_login_time?string("yyyy-MM-dd HH:mm:ss"))!}
							</td>
							<td>
								<button class="btn no-border btn-minier btn-primary btnResetPwd" __user_id="${user.id}">重置密码</button>
								<a class="btn no-border btn-minier btn-primary" href="${path}/admin/settings/account/edit?id=${user.id}">修改</a>
								<#if user.status==0>
								<button class="btn no-border btn-minier btn-warning btnFreeze" __user_id="${user.id}">冻结</button>
								<#else>
								<button class="btn no-border btn-minier btn-warning btnUnfreeze" __user_id="${user.id}">解冻</button>
								</#if>
							</td>
						</tr>
						</#list>
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($){

		$(".btnResetPwd").click(function(){
			if(!confirm("将密码重置为‘123456’吗?")){
				return false;
			}
			var userId = $(this).attr("__user_id");
			$.ajax({
				type: "POST",
				url: "${path}/admin/settings/account/resetpwd",
				data: {userId: userId},
				dataType: "json",
				success: function(json){
					if(!json.success){
						alert(json.message || "重置密码错误");
					}else{
						alert("密码已重置为123456");
						window.location.reload();
					}
				}
			});
		})

		$(".btnFreeze").click(function(){
			if(!confirm("确定吗?")){
				return false;
			}
			var userId = $(this).attr("__user_id");
			$.ajax({
				type: "POST",
				url: "${path}/admin/settings/account/freeze",
				data: {userId: userId},
				dataType: "json",
				success: function(json){
					if(!json.success){
						alert(json.message || "冻结用户错误");
					}else{
						window.location.reload();
					}
				}
			});
		})

		$(".btnUnfreeze").click(function(){
			if(!confirm("确定吗?")){
				return false;
			}
			var userId = $(this).attr("__user_id");
			$.ajax({
				type: "POST",
				url: "${path}/admin/settings/account/unfreeze",
				data: {userId: userId},
				dataType: "json",
				success: function(json){
					if(!json.success){
						alert(json.message || "解冻用户错误");
					}else{
						window.location.reload();
					}
				}
			});
		})
	});
</script>

</@we.html>