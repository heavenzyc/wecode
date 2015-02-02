<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=["/assets/js/My97DatePicker/WdatePicker.js","${jspath}/jsrender/jsrender.js"]>

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
                <li>
                    <a href="${base}/admin/active/lottery/">活动进行中</a>
                </li>
                <li class="active">
                    <a href="javascript:void(0)">中奖名单</a>
                </li>
            </ul>
            <div class="hr"></div>
            <div class="space-12"></div>

            <div class="table-responsive">
                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>客户</th>
                        <th>奖品</th>
                        <th>名称</th>
                        <th>兑换码</th>
                        <th>
                            <i class="icon-time bigger-110 hidden-480"></i>
                            刮奖时间
                        </th>
                        <th>
                            <i class="icon-time bigger-110 hidden-480"></i>
                            兑奖时间
                        </th>
                        <th>状态</th>
                    </tr>
                    </thead>

                    <tbody>
                        <#list recordList as record>
                        <#assign prize = record.getPrize()/>
                        <#assign customer = record.getCustomer()/>
                        <tr>
                            <td>${record_index+1}</td>
                            <td>${customer.name!"未填写姓名，客户:" + customer.id}</td>
                            <td>${prize.level!?html}</td>
                            <td><#if prize.prize_type==1>${prize.name!?html}<#else>${prize.gold_count}${kit.dictValue(current_project.id,'point_name')}</#if></td>
                            <td>${record.sn_code!?html}</td>
                            <td>${(record.scratch_time?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td>${(record.fetch_time?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                            <td>
                                <#if record.fetch_status==1><span class="label">已领取</span>
                                <#else><span class="label label-success arrowed-in">未领取</span>
                                </#if>
                            </td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
                <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="${base}/admin/active/lottery/recordList/" />
            </div>

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
        console.debug(json.data);
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
                window.location.reload(true);
            }else{
                showToast(json.message || "保存失败");
            }
            $.fancybox.close();
        }
    });
}
</script>
</@we.html>