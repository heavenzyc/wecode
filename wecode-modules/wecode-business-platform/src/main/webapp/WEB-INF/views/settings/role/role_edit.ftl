<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js"]>
<@we.breadcrumb current="修改角色"/>

<div class="page-content">
	<div class="row">
		<div class="col-xs-12">
			<form class="form-horizontal" role="form" action="${path}/admin/settings/role/updateRole" method="post" id="formAdd">
				<div class="form-group">
					<label class="col-sm-1 control-label no-padding-left" for="form-field-name">角色名称</label>

					<div class="col-sm-11">
						<input type="text" autocomplete="off" placeholder="角色名称" class="col-xs-10 col-sm-5 js-required" name="name" id="name" onblur="checkName();" value="${name}" disabled="true"/>
						<input type="hidden" name="id" id="id" value="${id}" />
					</div>
				</div>
				<!--
				<div class="space-4"></div>

				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right" for="form-field-code">角色编码</label>

					<div class="col-sm-9">
						<input type="text" id="form-field-code" placeholder="角色编码" class="col-xs-10 col-sm-5" name="code"  datatype="s6-12" errormsg="角色编码在6-12位之间" nullmsg="请输入角色编码"/>
					</div>
				</div>
				-->
				<div class="space-10"></div>
				<#list list as menu1>
				<div class="step-box">
					<div class="first-step">
						<label>
							<input name="form-field-checkbox" type="checkbox" class="ace Js_check_first" <#if map.get(menu1.id)??&&map.get(menu1.id)==true>checked<#else></#if> value="${menu1.id}"/>
							<span class="lbl"> <b>${menu1.name}</b></span>
						</label>
					</div>
					<div class="hr hr-dotted"></div>
					<#list menu1.getChildren() as menu2>
					<div class="widget-box transparent" style="padding-left:15px;">
						<div class="widget-header widget-header-flat">
							<h4 class="lighter">
								<label>
									<input name="form-field-checkbox" type="checkbox" class="ace Js_check_f" <#if map.get(menu2.id)??&&map.get(menu2.id)==true>checked<#else></#if> value="${menu2.id}" />
									<span class="lbl">${menu2.name}</span>
								</label>
							</h4>
							<#if menu2.getChildren()?? && (menu2.getChildren()?size>0)>
							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="icon-chevron-up"></i>
								</a>
							</div>
							</#if>
						</div>
						<#if menu2.getChildren()?? && (menu2.getChildren()?size>0)>
						<div class="widget-body">
							<div class="widget-body-inner" style="display: block;">
								<div class="widget-main padding-4 clearfix">
									<div class="form-group col-sm-10">
										<#list menu2.getChildren() as menu3>
										<label style="margin-right:20px">
											<input name="form-field-checkbox" type="checkbox" class="ace Js_check_s" <#if map.get(menu3.id)??&&map.get(menu3.id)==true>checked<#else></#if> value="${menu3.id}" />
											<span class="lbl">${menu3.name}</span>
										</label>
										</#list>
									</div>
								</div><!-- /widget-main -->
							</div>
						</div><!-- /widget-body -->
						</#if>
					</div>
					</#list>
				</div>
				</#list>
				
				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<button class="btn btn-info no-border Js_form_submit" type="button">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>

						&nbsp; &nbsp; &nbsp;
						<a class="btn no-border" href="${path}/admin/settings/role/" id="btnCancel">
							<i class="icon-undo bigger-110"></i>
							取消
						</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$(function(){
		$(document).on("click",".Js_check_first",function(){
			var firstobj = $(this);
			var fobj = $(this).parents(".step-box").find(".Js_check_f");
			var son = $(this).parents(".step-box").find(".Js_check_s");
			son.each(function(index, el) {
				if(firstobj.is(":checked")){
					el.checked = true;
				}else{
					el.checked = false;
				};
			});
			fobj.each(function(index, el) {
				if(firstobj.is(":checked")){
					el.checked = true;
				}else{
					el.checked = false;
				};
			});
		});

		$(document).on("click",".Js_check_f",function(event) {
			var fobj = $(this);
			var firstobj = $(this).parents(".step-box").find(".Js_check_first");
			var s_far = $(this).parents(".step-box").find(".Js_check_f");

			var son = $(this).parents(".widget-box").find(".Js_check_s");
			var far = $(this).parents(".widget-box").find(".Js_check_f");
			son.each(function(index, el) {
				if(fobj.is(":checked")){
					el.checked = true;
				}else{
					el.checked = false;
				};
			});

			if (s_far.parent().has(":checked").length > 0){ 
				firstobj[0].checked = true
			}else{
				firstobj[0].checked = false
			}
		});

		$(document).on("click",".Js_check_s",function(){
			var sobj = $(this);
			var firstobj = $(this).parents(".step-box").find(".Js_check_first");
			var s_far = $(this).parents(".step-box").find(".Js_check_f");
			var s_son = $(this).parents(".step-box").find(".Js_check_s");
			var far = $(this).parents(".widget-box").find(".Js_check_f");
			var son = $(this).parents(".widget-box").find(".Js_check_s");
			// son.each(function(index, el) {
			// 	$(this).is(":checked")
			// });
			if (son.parent().has(":checked").length > 0){ 
				far[0].checked = true;
				firstobj[0].checked = true;
			}else{
				far[0].checked = false;
				if(s_son.parent().has(":checked").length > 0){
					return
				}else{
					firstobj[0].checked = false;
				}
			}

		})
	})
</script>
<script type="text/javascript">
	jQuery(function($){
		$(".chosen-select").chosen();

		$("#btnCancel").click(function(){
			if(!confirm("要取消吗?")){
				return false;
			}
		})

		$(".Js_form_submit").click(function(){
			var result = false;
			//开始验证表单
			$.validity.start();
            $("input.js-required:visible").require();
            $(".Js_form_submit").assert($("input:checked").length > 0,"没有选择权限");
            
            result = $.validity.end().valid;
            if(result == false){
                return false;
            }
            
            var data = $("#formAdd").serialize();
            $.ajax({
                url: $("#formAdd").attr("action"),
                type:'post',
                data: data,
                success:function(json){
                    if(json.success){
                        showToast("保存成功");
                        window.location.href = "${base}/admin/settings/role/";
                    }else{
                        showToast(json.msg || "保存失败");
                    }
                }
            });
		});
	});
	
	function checkName(){
        var name = $("#name").val();
        $.ajax({
            url:'/admin/settings/role/nameUnique',
            asnyc:'true',
            type:'post',
            data:{name:name},
            success:function(json){
                if(!json.success){
                    $.validity.start();
                    $("#name").fail("该角色名称已存在");
                    $.validity.end();
                }
            }
        });
    }
	
</script>
 
</@we.html>