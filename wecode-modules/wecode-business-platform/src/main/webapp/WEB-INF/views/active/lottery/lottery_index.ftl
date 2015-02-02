<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[
    "/assets/js/My97DatePicker/WdatePicker.js",
    "${jspath}/jsrender/jsrender.js"]>

<@we.breadcrumb/>
<div class="page-content">
	<div class="page-header">
		<form class="form-inline" role="form">
            <div class="form-group">
                <input type="text" style="width: 500px" id="exchangeCode" placeholder="请输入兑换码">
            </div>
            <button class="btn no-border btn-primary" type="button" id="btnExchange">
                立即兑换
            </button>
            <a class="btn no-border btn-primary pull-right" href="${path}/admin/active/lottery/add">新建刮奖活动</a>
        </form>
	</div>

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <ul class="nav nav-pills" style="margin-left:0">
                <li class="active">
                    <a href="javascript:void(0)">活动进行中</a>
                </li>
                <li>
                    <a href="${base}/admin/active/lottery/recordList/">中奖名单</a>
                </li>
            </ul>
            <div class="hr"></div>
            <div class="space-12"></div>

            <#list page.list as action>
            <#if action_index % 2 == 0>
            <div class="col-xs-12">
            </#if>
                <div class="col-xs-6">
                    <div class="timeline-item s-list clearfix">
                        <div class="widget-box ad-box transparent">
                            <div class="widget-body">
                                <div class="widget-body-inner clearfix">
                                    <div class="widget-main">
                                        <div>
                                        <#assign status_desc=action.getActionStatus().getDesc()/>
                                        <#if (action.end_time < .now)>
                                        <span class="label label-lg label-grey arrowed-right">已过期</span>
                                        <#elseif action.status='ACTIVE'>
                                        <span class="label label-lg label-pink arrowed-right">${status_desc}</span>
                                        <#else>
                                        <span class="label label-lg label-grey arrowed-right">${status_desc}</span>
                                        </#if>
                                        </div>
                                        <div class="space-10"></div>
                                        <div class="col-xs-12" style="min-height:87px;">
                                            <div class="col-xs-6">
                                                <#assign activedClass=""/>
                                                <#if action.status=='ACTIVE'><#assign activedClass="text-danger"/></#if>
                                                <#list action.findPrizeList() as prize>
                                                    <#if prize_index<3>
                                                <p>${prize.level!?html}已中奖数：<b class="${activedClass}">${prize.prize_count-prize.prize_stock_count}</b></p>
                                                    </#if>
                                                </#list>
                                            </div>
                                            <div class="col-xs-6">
                                                <p>总中奖数：<b class="${activedClass}">${action.getWinCount()}</b></p>
                                                <p>总刮奖数：<b class="${activedClass}">${action.getScratchCount()}</b></p>
                                            </div>
                                        </div>
                                        <div class="hr" style="clear:both"></div>
                                        <div class="col-xs-12">
                                            <p>活动时间：<span>${(action.start_time?string("yyyy-MM-dd HH:mm:ss"))!}到${(action.end_time?string("yyyy-MM-dd HH:mm:ss"))!}</span></p>
                                            <p>创建时间：<span>${(action.create_time?string("yyyy-MM-dd HH:mm:ss"))!}</span></p>
                                        </div>
                                        <div class="space-6"></div>
                                        <div class="widget-toolbox clearfix">
                                            <div class="pull-right action-buttons">
                                                <#-- <button class="btn btn-inverse btn-xs">详情</button> -->
                                                <#if (action.status!='STOP' && action.end_time >= .now)>
                                                <a href="${base}/admin/active/lottery/edit?action_id=${action.id}" class="btn btn-primary btn-xs">修改</a>
                                                </#if>
                                                <#if action.status=='WAIT'>
                                                    <#if (action.end_time >= .now)>
                                                <a href="javascript:;" class="btn btn-danger btn-xs js_active" data-id="${action.id}">发布</a>
                                                    </#if>
                                                <a href="javascript:;" class="btn btn-danger btn-xs js_remove" data-id="${action.id}">删除</a>
                                                </#if>
                                                <#if action.status=='ACTIVE' && (action.end_time >= .now)>
                                                <a href="javascript:;" class="btn btn-danger btn-xs js_stop" data-id="${action.id}">终止</a>
                                                </#if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>                              
                </div>
            <#if action_index % 2 == 1>
            </div>
            <div class="clearfix"></div>
            </#if>
            </#list>
            <div class="clearfix"></div>
            <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/active/lottery/" />

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script id="exchangeTemplate" type="text/x-jsrender">
<div class="widget-box no-border">
    <div class="widget-header no-border">
    <h4>兑换奖品</h4>
    </div>
    <div class="widget-body no-border">
        <div class="widget-main no-padding">
            <form id="exchangeForm" class="form-horizontal" action="${base}/admin/active/lottery/exchangeLottery" method="post">
                <div class="form-group">
                    <div class="space-10"></div>
                    <label class="col-sm-4 control-label no-padding-right" for="form-field-1">兑换码</label>
                    <div class="col-sm-8">
                        <input type="text" class="col-xs-10 col-sm-8" name="sn_code" readOnly value="{{:sn_code}}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label no-padding-right" for="form-field-1">客户姓名</label>
                    <div class="col-sm-8">
                        <input type="text" id="append_stock_count" class="col-xs-10 col-sm-8" readOnly value="{{:customerName}}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label no-padding-right" for="form-field-1">奖品</label>
                    <div class="col-sm-8">
                        <input type="text" id="append_prize_count" class="col-xs-10 col-sm-8" readOnly value="{{:prize_level}}：{{:prize_name}}"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label no-padding-right" for="form-field-1">刮奖时间</label>
                    <div class="col-sm-8">
                        <input type="text" id="append_prize_count" class="col-xs-10 col-sm-8" readOnly value="{{:scratch_time}}"/>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="button" id="btnSubmit" onclick="doExchangeRecord();">
                            <i class="icon-ok bigger-110"></i>
                            确认兑换
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <a href="javascript:$.fancybox.close();" class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            取消
                        </a>
                    </div>
                </div>
            </form>
       </div>
   </div>
</div>
</script>
<script>
jQuery(function($){
    $(".js_remove").click(function(){
        if(!confirm("确定删除吗，删除后数据无法恢复!")){
            return false;
        }
        var action_id = $(this).data("id");
        $.ajax({
            url: "${base}/admin/active/lottery/remove",
            type:'post',
            data: {action_id: action_id},
            success:function(json){
                if(json.success){
                    showToast("删除成功");
                    window.location.href = "${base}/admin/active/lottery/";
                }else{
                    showToast(json.message || "删除失败");
                }
            }
        });
    });
    $(".js_active").click(function(){
        if(!confirm("确定发布吗，发布后不能再修改!")){
            return false;
        }
        var action_id = $(this).data("id");
        $.ajax({
            url: "${base}/admin/active/lottery/active",
            type:'post',
            data: {action_id: action_id},
            success:function(json){
                if(json.success){
                    showToast("发布成功");
                    window.location.href = "${base}/admin/active/lottery/";
                }else{
                    showToast(json.message || "发布失败");
                }
            }
        });
    });
    $(".js_stop").click(function(){
        if(!confirm("确定下线吗，下线后用户不能再刮奖!")){
            return false;
        }
        var action_id = $(this).data("id");
        $.ajax({
            url: "${base}/admin/active/lottery/stop",
            type:'post',
            data: {action_id: action_id},
            success:function(json){
                if(json.success){
                    showToast("下线成功");
                    window.location.href = "${base}/admin/active/lottery/";
                }else{
                    showToast(json.message || "下线失败");
                }
            }
        });
    });

    $("#btnExchange").click(function(){
        $.ajax({
            url: "${base}/admin/active/lottery/getLotterRecordInfo",
            type:'get',
            data: {sn_code: $("#exchangeCode").val()},
            success:function(json){
                if(!json.success){
                    showToast(json.message || "获取兑换码信息失败");
                }else{
                    showExchangeInfo(json);
                }
            }
        });
    });

    //兑奖
    function showExchangeInfo(json) {
        json.data.customerName = json.data.customerName || "未填写";
        //console.debug(json.data);
        var _html = $("#exchangeTemplate").render(json.data);
        
        $.fancybox({
            width : 400,
            height : 'auto',
            autoSize : false,
            padding : 0,
            scrolling : 'no',
            content: _html,
            afterShow : function(){
            },
            beforeClose:function(){
            }
        })
    }
});

function doExchangeRecord(){
    
    var data = $("#exchangeForm").serialize();
    $.ajax({
        url: $("#exchangeForm").attr("action"),
        type:'post',
        data: data,
        success:function(json){
            if(json.success){
                showToast("兑换成功");
                //window.location.reload(true);
            }else{
                showToast(json.message || "保存失败");
            }
            $.fancybox.close();
        }
    });
}



</script>

</@we.html>