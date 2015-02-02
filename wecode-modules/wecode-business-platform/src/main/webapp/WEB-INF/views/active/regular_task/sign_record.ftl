<#--签到记录列表-->
<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js"]>

<@we.breadcrumb/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <ul class="nav nav-pills" style="margin-left:0">
                <li>
                    <a href="/admin/active/sign/">签到设置</a>
                </li>
                <li class="active">
                    <a href="javascript:void(0)">签到记录</a>
                </li>
            </ul>
            <div class="space-12"></div>
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-responsive">
                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>客户姓名</th>
                        <th>奖励${kit.dictValue(current_project.id,'point_name')}</th>
                        <th><i class="icon-time bigger-110 hidden-480"></i>
                            签到时间
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                        <#list signRecordList as item>
                        <tr>
                            <td>${item_index+1}</td>
                            <td>${item.getCustomerName()!?html}</td>
                            <td>${item.reward_gold!?html}</td>
                            <td>${(item.create_time?string("yyyy-MM-dd HH:mm"))!}</td>
                        </tr>
                        </#list>
                    </tbody>
                </table>
                <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/active/sign/record/" />
            </div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">
    $(function(){
        // 验证插件
        $("#add_sign_rule_form").validity(function(){
            $("#cycle").match("number");
            $("#gold_base").match("number");
            $("#increase").match("number");
            $("#lottery_count").match("number");
        });
    })

    $(function(){
        sumMoney();
    });

    function sumMoney(){
        var cycle = $("#cycle").val();
        var goldBase = $("#gold_base").val();
        var increase = $("#increase").val();
        var sumIncrease = 0;
        for (var i = 0 ; i<cycle; i++){
            sumIncrease += increase * i;
        }
        var sum = cycle * goldBase + sumIncrease;
        $("#sum").html("").html(sum);
    }

</script>

</@we.html>