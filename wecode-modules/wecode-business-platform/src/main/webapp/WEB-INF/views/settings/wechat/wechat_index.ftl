<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js","${jspath}/validform.min.js"]>
<@we.breadcrumb/>
<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-4">
			<!-- PAGE CONTENT BEGINS -->
								<ul class="nav nav-pills" style="margin-left:0">
									<li class="active">
										<a href="#">账号绑定</a>
									</li>
									<li>
										<a href="/admin/settings/wechat/commandIndex">命令设置</a>
									</li>
								</ul>
		</div>

		<div class="col-xs-8">
		</div>
	</div><!-- /.page-header -->
	<div class="row">
		<div class="col-xs-12">
			<form class="form-horizontal" role="form" action="${path}/admin/settings/wechat/binding" method="post" id="formAdd">
				<input type="hidden" name="projectId" value="${currentProject.id}"/>
				<input type="hidden" name="wxAccountId" value="${wxAccount.id}"/>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-project-name">项目名称</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-project-name" placeholder="项目名称" class="col-xs-10 col-sm-5" name="projectName" value="${currentProject.name!}" readonly />
					</div>
				</div>

				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-account">公众账号名称</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-account" placeholder="公众账号名称" class="col-xs-10 col-sm-5" name="accountName"  value="${wxAccount.account_name!}" datatype="s2-20" errormsg="请输入正确的公众账号名称" nullmsg="请输入公众账号名称"/>
					</div>
				</div>

				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-name">微信号</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-name" placeholder="微信号" class="col-xs-10 col-sm-5" name="account"  value="${wxAccount.account!}" datatype="s2-20" errormsg="请输入正确的微信号" nullmsg="请输入微信号称"/>
					</div>
				</div>
				
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-url">公众平台接口配置信息</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-url" placeholder="公众平台接口配置信息" class="col-xs-10 col-sm-5" name="validUrl"  value="${wxAccount.valid_url!}" readonly/>
					</div>
				</div>
				
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-token">TOKEN</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-token" placeholder="公众平台接口配置信息" class="col-xs-10 col-sm-5" name="validToken"  value="${wxAccount.valid_token!}" readonly/>
					</div>
				</div>
				
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-appid">微信AppId:</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-appid" placeholder="微信AppId" class="col-xs-10 col-sm-5" name="appid"  value="${wxAccount.appid!}"/>
					</div>
				</div>
				
				<div class="space-4"></div>
				
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-appid">微信Secret:</label>
					<div class="col-sm-9">
						<input type="text" id="form-field-appid" placeholder="微信Secret" class="col-xs-10 col-sm-5" name="secret"  value="${wxAccount.secret!}"/>
					</div>
				</div>
				
				<div class="clearfix form-actions">

					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border" type="submit">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>
						<!--
						&nbsp; &nbsp; &nbsp;
						<a class="btn no-border" href="${path}/admin/settings/wechat/" id="btnCancel">
							<i class="icon-undo bigger-110"></i>
							取消
						</a>
						-->
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<script type="text/javascript">
	jQuery(function($){

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