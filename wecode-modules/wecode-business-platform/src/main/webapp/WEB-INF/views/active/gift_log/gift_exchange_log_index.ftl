<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
    <@we.breadcrumb/>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <ul class="nav nav-pills" style="margin-left:0;margin-bottom: 20px">
                <li>
                    <a href="/admin/active/gift_exchange_rule">礼品设置</a>
                </li>
                <li class="active">
                    <a href="javascript:void(0)">串号兑换</a>
                </li>

            </ul>
            <div class="col-xs-12" style="text-align: center; margin: 10px">
            <form class="form-inline" role="form">
                <div class="form-group">
                    <input type="text" style="width: 500px" id="exchangeCode" name="exchangeCode"  placeholder="请输入兑换码">
                </div>
                <#--<a class="btn no-border btn-primary">立即兑换</a>-->
                <button class="btn no-border btn-primary" type="button" onclick="exchange()">
                    <#--<i class="icon-ok bigger-110"></i>-->
                    立即兑换
                </button>
            </form>
            </div>

            <div class="row">
                <div class="col-xs-12">

                    <div class="table-responsive">
                        <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>兑换人</th>
                                <th>礼品名称</th>
                                <th>兑换码</th>
                                <th>
                                    <i class="icon-time bigger-110 hidden-480"></i>
                                    兑换时间
                                </th>
                                <th>状态</th>
                            </tr>
                            </thead>

                            <tbody>
                                <#list logList as item>
                                <tr>
                                    <td>${item_index+1}</td>
                                    <td>${item.getCustomerName()}</td>
                                    <td>${item.getGift().name!?html}</td>
                                    <td>${item.exchange_code!?html}</td>
                                    <td>${(item.exchange_time?string("yyyy-MM-dd HH:mm:ss"))!}</td>
                                    <td>
                                        <#if item.status==1><span class="label">已使用</span>
                                        <#else><span class="label label-success arrowed-in">未使用</span>
                                        </#if>
                                    </td>
                                </tr>
                                </#list>
                            </tbody>
                        </table>
                        <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/active/gift_exchange_rule/log/" />
                    </div>

                </div>
            </div>

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">
	/*jQuery(function($){
		$(".process").click(function(){
			var reserveId = $(this).attr("__reserve_id");
			$.ajax({
				type: "POST",
				url: "/admin/project/reserve/process",
				data: {reserveId: reserveId},
				dataType: "json",
				success: function(json){
					if(json.success){
                        window.location.href = "";
					}else{

                    }
				}
			});
		})
	});*/

    function exchange(){
        var code = $("#exchangeCode").val();
        $.ajax({
            type: "get",
            url: "/admin/active/gift_exchange_rule/log/exchangePre",
            data: {code: code},
            dataType: "json",
            success: function(json){
                if(json.success){
                    window.location.href = "/admin/active/gift_exchange_rule/log/exchange?code="+json.code;
                }else {
                    failureTips(json);
                }
            }
        });
    }
    function failureTips(json){
        $.gritter.add({
            title : '信息提示',
            time : 2000,
            text : json.msg,
            class_name : 'gritter-info gritter-center '
        });
    }

</script>

</@we.html>