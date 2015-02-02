<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css"] js=["${jspath}/chosen.jquery.min.js"]>

<@we.breadcrumb/>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">

            <div class="space-12"></div>
            <!-- PAGE CONTENT BEGINS -->
            <div class="table-responsive">
                <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>序号</th>
                        <th>任务名称</th>
                        <th>奖励方式</th>
                        <th>累计参与人数</th>
                        <th>累计完成次数</th>
                        <th>累计回访人数</th>
                        <th>计关注人数</th>
                        <th>累计意向购房人数</th>
                        <th>操作</th>
                    </tr>
                    </thead>

                    <tbody>
                        <#list taskList as item>
                        <tr>
                            <td>${item_index+1}</td>
                            <td>${item.getName()}</td>
                            <td>${item.getRewardMethod()}</td>
                            <#--<td>
                                <#if item.getStatus() == true>
                                    <span class="label">已上线</span>
                                <#else >
                                    <span class="label label-success arrowed-in">已下线</span>
                                </#if>
                            </td>-->
                            <td>${item.getJoinPeopleNumber()}</td>
                            <td>${item.getCompleteCount()}</td>
                            <td>${item.getCallBackCount()}</td>
                            <td>${item.getAttintionCount()}</td>
                            <td>${item.getIntentionCouont()}</td>
                            <td>
                                <a href="${item.getSettingUrl()}" class="btn no-border btn-minier btn-warning process">设置</a>
                            </td>
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