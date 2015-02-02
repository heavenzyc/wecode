<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html
css=[
	"${csspath}/uploadify.css",
	"${csspath}/jquery.Jcrop.css",
	"${csspath}/jquery.fancybox.css"
]
js=[
	"${jspath}/My97DatePicker/WdatePicker.js",
	"${jspath}/common.js",
	"${jspath}/jquery.fancybox.min.js",
	"${jspath}/jquery.uploadify.js",
	"${jspath}/jquery.Jcrop.min.js",
	"${jspath}/uploadavatar.js",
	"${jspath}/upload.config.js",
	"${jspath}/ueditor/ueditor.config.js",
	"${jspath}/ueditor/ueditor.all.min.js",
	"${jspath}/jsrender/jsrender.min.js"
]>

<@we.breadcrumb current="编辑刮奖活动"/>
<#assign canEdit=false/>
<#if action.status='WAIT'><#assign canEdit=true/></#if>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <form class="form-horizontal" consultant="form" action="${path}/admin/active/lottery/update" method="post" id="formEdit">
				<input type="hidden" name="action_id" value="${action.id}"/>
				<div class="space-8"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right js-required">活动时间：</label>
					<div class="col-sm-9">
						<#if canEdit>
						<input type="text" style="width:180px;" id="startTime" name="startTime"
                               onclick="WdatePicker({startDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'endTime\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate js-required" title="活动开始时间" value="${action.start_time?string("yyyy-MM-dd HH:mm:ss")}"/>
                        <#else>
						<input type="text" style="width:180px;" id="startTime" name="startTime" class="Wdate js-required" title="活动开始时间" value="${action.start_time?string("yyyy-MM-dd HH:mm:ss")}" readonly/>
                        </#if>
                               &nbsp;至&nbsp;
                        <#if canEdit>
                        <input type="text" style="width:180px;" id="endTime" name="endTime"
                               onclick="WdatePicker({startDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'startTime\')}',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate js-required" title="活动结束时间" value="${action.end_time?string("yyyy-MM-dd HH:mm:ss")}"/>
                        <#else>
                        <input type="text" style="width:180px;" id="endTime" name="endTime" class="Wdate js-required" title="活动结束时间" value="${action.end_time?string("yyyy-MM-dd HH:mm:ss")}" readonly/>
                        </#if>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right js-required">适用条件：</label>
					<div class="col-sm-9">
						<input type="text" placeholder="如：达到5000${kit.dictValue(current_project.id,'point_name')}才能参加..." class="col-xs-8 col-sm-4 js-required js-integer" name="for_condition" id="for_condition" title="适用条件" maxlength="8" value="${action.for_condition}" <#if !canEdit>readOnly</#if>/>
						<span class="help-inline col-xs-10 col-sm-5"><span class="middle">达到多少${kit.dictValue(current_project.id,'point_name')}才能参加，0表示不设置门槛</span></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right no-padding-left text-left js-required">每日中奖次数：</label>
					<div class="col-sm-9">
						<input type="text" placeholder="每人每日最多中奖次数..." class="col-xs-8 col-sm-4 js-required js-integer" name="max_win_times" id="max_win_times" title="每日中奖次数" maxlength="3" value="${action.max_win_times}" <#if !canEdit>readOnly</#if>/>
						<span class="help-inline col-xs-10 col-sm-5"><span class="middle">每人每日最多中奖次数</span></span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right text-left js-required">每日刮奖次数：</label>
					<div class="col-sm-9">
						<input type="text" placeholder="每人每日最多参与刮奖次数..." class="col-xs-8 col-sm-4 js-required js-integer" name="max_scratch_times" id="max_scratch_times" title="每日刮奖次数" maxlength="3" value="${action.max_scratch_times}" <#if !canEdit>readOnly</#if>/>
						<span class="help-inline col-xs-10 col-sm-5"><span class="middle">每人每日最多参与刮奖次数</span></span>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right js-required">中奖率：</label>
					<div class="col-sm-9">
						<input type="text" placeholder="每次刮奖中奖率..." class="col-xs-8 col-sm-4 js-required" name="ratio" id="ratio" title="中奖率" maxlength="8" value="${action.ratio}" <#if !canEdit>readOnly</#if>/>
						<span class="help-inline col-xs-10 col-sm-5"><span class="middle">%，每次刮奖中奖率，范围：0.0001%-100%</span></span>
					</div>
				</div>
				<div class="space-4"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label no-padding-right js-required">刮奖规则：</label>
					<div class="col-sm-9">
						<textarea class="col-xs-10 col-sm-5 js-required" name="remark" id="remark" rows="4" title="刮奖规则" <#if !canEdit>readOnly</#if>>${action.remark!?html}</textarea>
						<span class="help-inline col-xs-4 col-sm-2"><span class="middle">500个字以内</span></span>
					</div>
				</div>
				<!-- 奖品设置 -->
				<div class="form-group no-margin-bottom">
					<label class="col-sm-3 control-label no-padding-right">奖品设置：</label>
					<div class="col-sm-9" id="js_prize_setting">
						<!-- 奖项开始 -->

						<#list prizeList as prize>
						<div class="space-4"></div>
						<div class="well no-padding-left no-margin-bottom js_prize_group">
							<input type="hidden" name="prize_id" value="${prize.id}"/>
							<input type="hidden" name="stock_count" value="<#if prize.prize_type==1>${prize.prize_stock_count}<#else>${(prize.prize_stock_count*prize.gold_count)!}</#if>"/>
							<div>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">奖品等级：</label>
								<input type="text" placeholder="如：xx等奖..." class="col-xs-6 col-sm-3 js-required" name="level" title="奖品等级" maxlength="20" value="${prize.level!?html}" <#if !canEdit>readOnly</#if>/>
								<input type="hidden" class="js_prize_type_hidden" name="prizeType" value="${prize.prize_type!1}"/>

								<label style="margin-left:15px;" class="col-sm-2">
									<input name="prize_type${prize_index}" type="radio" class="ace js_prize_type" value="1" <#if prize.prize_type==1>checked</#if> <#if !canEdit>disabled</#if>>
									<span class="lbl">实物奖品</span>
								</label>
								<label class="col-sm-2">
									<input name="prize_type${prize_index}" type="radio" class="ace js_prize_type" value="0" <#if prize.prize_type==0>checked</#if> <#if !canEdit>disabled</#if>>
									<span class="lbl">虚拟奖品</span>
								</label>
								<#if canEdit>
								<button class="btn btn-grey no-border btn-sm pull-right js_remove_prize" type="button" data-prize-saved="true">
									<i class="icon-remove"></i>
									删除
								</button>
								<#else>
								<button class="btn btn-grey no-border btn-sm pull-right js_append" type="button">
									<i class="icon-plus"></i>
									追加奖品
								</button>
								</#if>
					        </div>

							<div class="space-4 clear"></div>
							<#if prize.prize_type==1>
							<div>
								<span class="js_physical_group">
									<label class="col-sm-2 control-label no-padding-right no-padding-left">奖品名称：</label>
									<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required" name="name" title="奖品名称" maxlength="50" value="${prize.name!?html}" <#if !canEdit>readOnly</#if>/>
								</span>
								<span class="js_virtual_group" style="display:none;">
									<label class="col-sm-2 control-label no-padding-right no-padding-left">金币数量：</label>
									<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="gold_count" title="金币数量" maxlength="6" value="${prize.gold_count!}" <#if !canEdit>readOnly</#if>/>
								</span>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">总数量：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="prize_count" title="总数量" maxlength="8" value="${prize.prize_count!}" <#if !canEdit>readOnly</#if>/>
					        </div>
							<div class="space-4 clear"></div>
							<div>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">每日限发：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_day" title="每日限发" maxlength="8" value="${prize.limit_per_day!}" <#if !canEdit>readOnly</#if>/>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">每人限发：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_person" title="每人限发" maxlength="6" value="${prize.limit_per_person!}" <#if !canEdit>readOnly</#if>/>
					        </div>
					        <#else>
							<div>
								<span class="js_physical_group" style="display:none;">
									<label class="col-sm-2 control-label no-padding-right no-padding-left">奖品名称：</label>
									<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required" name="name" title="奖品名称" maxlength="50" value="${prize.name!?html}" <#if !canEdit>readOnly</#if>/>
								</span>
								<span class="js_virtual_group">
									<label class="col-sm-2 control-label no-padding-right no-padding-left">金币数量：</label>
									<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="gold_count" title="金币数量" maxlength="6" value="${prize.gold_count!}" <#if !canEdit>readOnly</#if>/>
								</span>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">总数量：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="prize_count" title="总数量" maxlength="8" value="${(prize.prize_count*prize.gold_count)!}" <#if !canEdit>readOnly</#if>/>
					        </div>
							<div class="space-4 clear"></div>
							<div>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">每日限发：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_day" title="每日限发" maxlength="8" value="${(prize.limit_per_day*prize.gold_count)!}" <#if !canEdit>readOnly</#if>/>
								<label class="col-sm-2 control-label no-padding-right no-padding-left">每人限发：</label>
								<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_person" title="每人限发" maxlength="6" value="${(prize.limit_per_person*prize.gold_count)!}" <#if !canEdit>readOnly</#if>/>
					        </div>
					        </#if>
					    	<div class="space-4 clear"></div>

					    </div>
					    </#list>

					    <#if canEdit>
						<!-- 奖项结束 -->
                        <div class="space-4" id="js_space_add_prize"></div>
                        <button class="btn btn-warning no-border btn-sm" type="button" id="js_add_prize">
							<i class="icon-plus bigger-110"></i>
							添加奖品
						</button>
						</#if>

					</div>
				</div>

				<div class="clearfix form-actions">
					<div class="col-md-offset-3 col-md-9">
						<#if canEdit>
						<button class="btn btn-info no-border" type="button" id="btnSave">
							<i class="icon-ok bigger-110"></i>
							保存
						</button>
						</#if>

						&nbsp; &nbsp; &nbsp;
        				<a class="btn no-border btn-primary" href="${path}/admin/active/lottery/">
        					<i class="icon-undo bigger-110"></i>
        					返回
        				</a>
					</div>
				</div>

			</form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->

<script id="prizeTemplate" type="text/x-jsrender">
	<div class="space-4"></div>
	<div class="well no-padding-left no-margin-bottom js_prize_group">
		<div>
			<label class="col-sm-2 control-label no-padding-right no-padding-left">奖品等级：</label>
			<input type="text" placeholder="如：{{:prizeName}}..." class="col-xs-6 col-sm-3 js-required" name="level" id="level" title="奖品等级" maxlength="20"/>
			<input type="hidden" class="js_prize_type_hidden" name="prizeType"/>
			<label style="margin-left:15px;" class="col-sm-2">
				<input name="prize_type{{:index}}" type="radio" class="ace js_prize_type" value="1" checked>
				<span class="lbl">实物奖品</span>
			</label>
			<label class="col-sm-2">
				<input name="prize_type{{:index}}" type="radio" class="ace js_prize_type" value="0">
				<span class="lbl">虚拟奖品</span>
			</label>
			<button class="btn btn-grey no-border btn-sm pull-right js_remove_prize" type="button">
				<i class="icon-remove"></i>
				删除
			</button>
        </div>
		<div class="space-4 clear"></div>
		<div>
			<span class="js_physical_group">
				<label class="col-sm-2 control-label no-padding-right no-padding-left">奖品名称：</label>
				<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required" name="name" title="奖品名称" maxlength="50"/>
			</span>
			<span class="js_virtual_group" style="display:none;">
				<label class="col-sm-2 control-label no-padding-right no-padding-left">金币数量：</label>
				<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="gold_count" title="金币数量" maxlength="6"/>
			</span>
			<label class="col-sm-2 control-label no-padding-right no-padding-left">总数量：</label>
			<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="prize_count" title="总数量" maxlength="8"/>
        </div>
		<div class="space-4 clear"></div>
		<div>
			<label class="col-sm-2 control-label no-padding-right no-padding-left">每日限发：</label>
			<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_day" title="每日限发" maxlength="8"/>
			<label class="col-sm-2 control-label no-padding-right no-padding-left">每人限发：</label>
			<input type="text" placeholder="" class="col-xs-6 col-sm-3 js-required js-integer" name="limit_per_person" title="每人限发" maxlength="6"/>
        </div>
    	<div class="space-4 clear"></div>
    </div>
</script>

<script type="text/javascript">
   jQuery(function($){
   		//初始化图片上传
	    uploadPic().init();

	    //奖品类型切换
	    $("#js_prize_setting").on("change", '.js_prize_type', function(){
	    	var value = $(this).val();
	    	var group = $(this).closest(".js_prize_group");
	    	if(value == 1){//显示实物奖品
	    		group.find(".js_physical_group").show();
	    		group.find(".js_virtual_group").hide();
	    	}else{//显示虚拟奖品
	    		group.find(".js_physical_group").hide();
	    		group.find(".js_virtual_group").show();
	    	}
	    });

	    //删除奖品
	    $("#js_prize_setting").on("click", '.js_remove_prize', function(){
	    	var isSaved = $(this).data("prize-saved");
	    	if(isSaved){
	    		if(!confirm("确认删除吗?")){
	    			return;
	    		}
	    	}
	    	var prizeCount = $("#js_prize_setting .js_prize_group").size();
	    	if(prizeCount == 1){
	    		showToast("必须设置至少一个奖项.");
	    		return;
	    	}
	    	var group = $(this).closest(".js_prize_group");
	    	group.remove();
	    });

	    //添加奖品
	    $("#js_add_prize").click(function(){
	    	addPrize("xx奖");
	    });

	    function addPrize(prizeName){
	    	var index = $("#js_prize_setting .js_prize_group").size();
	    	var html = $("#prizeTemplate").render({
	    		index: new Date().getTime(),
	    		prizeName: prizeName || ""
	    	});
	    	$(html).insertBefore('#js_space_add_prize');
	    }

	    //添加提示文字
	    $("label.js-required").prepend('<span style="color:#f00;font-weight: bold; padding-right: 3px;">*</span>');

		$("#btnSave").click(function(){
			//获取奖品类型，写入hidden
			$("#js_prize_setting .js_prize_group").each(function(idx,item){
				var prizeType = $(item).find(".js_prize_type:checked").val();
				$(item).find(".js_prize_type_hidden").val(prizeType);
				// if(prizeType == 0){
				// 	$(item).find("")
				// }
			});

			//开始验证表单
			$.validity.start();
            $("input.js-required:visible").require();
            $("input.js-integer:visible").match("integer");
            $("textarea.js-required").require();
            $("#remark").maxLength(500,"500个字以内");
            $("#ratio").match("number").range(0.0001,100,"中奖率必须在0.0001%至100%之间");
            $("#ratio").match(/^\d{1,3}([.]\d{4})?$/,"中奖率只能在0-100之间，小数点后最多4位.");
            var result = $.validity.end().valid;
            if(result == false){
                return false;
            }

            var prizeCount = $("#js_prize_setting .js_prize_group").size();
            if(!prizeCount){
            	showToast("请添加奖品.");
            	return;
            }

            var data = $("#formEdit").serialize();
            $.ajax({
                url: $("#formEdit").attr("action"),
                type:'post',
                data: data,
                success:function(json){
                    if(json.success){
                        showToast("保存成功");
                        window.location.href = "${base}/admin/active/lottery/";
                    }else{
                        showToast(json.message || "保存失败");
                    }
                }
            });
		});

		//追加
		$(".js_append").click(function(){
			var group = $(this).closest('.js_prize_group');
			var action_id = ${action.id};
			var prize_type = group.find(".js_prize_type:checked").val();
			var prizeName;
			if(prize_type == 1){
				prizeName = group.find("[name='name']").val();
			}else{
				prizeName = "${kit.dictValue(current_project.id,'point_name')}";
			}
			var level = group.find("[name='level']").val();
			var title = "追加" + level + ":" + prizeName;
			var prize_id = group.find(":input[name='prize_id']").val();
			var total_count = group.find(":input[name='prize_count']").val();
			var stock_count = group.find(":input[name='stock_count']").val();
			appendPrizeCount(title,action_id, prize_id, total_count, stock_count);
		});
		function appendPrizeCount(title,action_id, prize_id, total_count, stock_count) {
			var _html = [
			'<div class="widget-box no-border">',
			'	<div class="widget-header no-border">',
			'		<h4>' + title + '</h4>',
			'	</div>',
			'	<div class="widget-body no-border">',
			'		<div class="widget-main no-padding">',
			'			<form id="append_form" class="form-horizontal" action="${base}/admin/active/lottery/appendPrizeCount" method="post">',
			'			<input type="hidden" id="append_action_id" name="action_id" value="' + action_id + '"/>',
			'			<input type="hidden" id="append_prize_id" name="prize_id" value="' + prize_id + '"/>',
			'    <div class="form-group"><div class="space-10"></div>',
			'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">总数量</label>',
			'        <div class="col-sm-8">',
			'            <input type="text" id="append_total_count" class="col-xs-10 col-sm-8" readOnly value="' + total_count + '"/>',
			'        </div>',
			'    </div>',
			'    <div class="form-group">',
			'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">当前剩余</label>',
			'        <div class="col-sm-8">',
			'            <input type="text" id="append_stock_count" class="col-xs-10 col-sm-8" readOnly value="' + stock_count + '"/>',
			'        </div>',
			'    </div>',
			'    <div class="form-group">',
			'        <label class="col-sm-4 control-label no-padding-right" for="form-field-1">追加数量</label>',
			'        <div class="col-sm-8">',
			'            <input type="text" id="append_prize_count" class="col-xs-10 col-sm-8" name="prize_count" value="1"/>',
			'        </div>',
			'    </div>',
			'    <div class="clearfix form-actions">',
			'        <div class="col-md-offset-2 col-md-9">',
			'            <button class="btn btn-info" type="button" id="btnSubmit" onclick="onAppendPrizeCount();">',
			'                <i class="icon-ok bigger-110"></i>',
			'                保存',
			'            </button>',
			'',
			'            &nbsp; &nbsp; &nbsp;',
			'            <a href="javascript:$.fancybox.close();" class="btn" type="reset">',
			'                <i class="icon-undo bigger-110"></i>',
			'                取消',
			'            </a>',
			'        </div>',
			'    </div>',
			'</form>',
			'		</div>',
			'	</div>',
			'</div>'].join("");
			
			$.fancybox({
		        width : 400,
		        height : 'auto',
		        autoSize : false,
		        padding : 0,
		        scrolling : 'no',
		        content: _html,
		        afterShow : function(){
		            $.fn.qtip.zindex = 9000;
		        },
		        beforeClose:function(){
		        	$(".we-error").qtip("destroy");
		        }
		    })
		}

	});

function onAppendPrizeCount(){
	$.validity.start();
    $("#append_prize_count").require("请输入追加数量!");
    $("#append_prize_count").match("integer").greaterThan(0,"追加的数量需大于0");
    
    var result = $.validity.end().valid;
    if(result == false){
        return false;
    }
    
    var data = $("#append_form").serialize();
    $.ajax({
        url: $("#append_form").attr("action"),
        type:'post',
        data: data,
        success:function(json){
            if(json.success){
                showToast("保存成功");
            }else{
                showToast(json.message || "保存失败");
            }
            $.fn.qtip.zindex = 7000;
            $.fancybox.close();
        }
    });
}
</script>
</@we.html>
