<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css",
"${csspath}/ui.jqgrid.css",
"${csspath}/daterangepicker.css"]
js=["${jspath}/date-time/bootstrap-datepicker.min.js",
"${jspath}/jqGrid/jquery.jqGrid.min.js",
"${jspath}/jqGrid/i18n/grid.locale-cn.js",
"${jspath}/modules/exporting.js",

"${jspath}/date-time/moment.min.js",
"${jspath}/date-time/daterangepicker.min.js",
"${jspath}/highcharts.js"]>


    <@we.breadcrumb/>
<div class="page-content">
<div class="row">
<div class="col-xs-12">
<!-- PAGE CONTENT BEGINS -->
<div class="widget-box transparent">
    <div class="widget-header widget-header-flat">
        <input type="hidden" id="cycle" value="${cycle}">
        <input type="hidden" id="startDate" value="${startDate}">
        <input type="hidden" id="endDate" value="${endDate}">
        <h4 class="lighter">
            <b>赛选条件：</b>
        </h4>
        <div class="">
            <div class="pull-left">
                <a <#if cycle??&&cycle=="yesterday">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/expand/?cycle=yesterday">昨天</a>
                <a <#if !cycle??||cycle=="today">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/expand/?cycle=today">今天</a>
                <a <#if cycle??&&cycle=="seven_day">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/expand/?cycle=seven_day">最近7天</a>
                <a <#if cycle??&&cycle=="thirty_day">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/expand/?cycle=thirty_day">最近30天</a>
            </div>
            <div class="pull-left">
                <div class="input-group" style="width:250px; margin-left:20px;">
													<span class="input-group-addon">
														<i class="icon-calendar bigger-110"></i>
													</span>
                    <input class="form-control" type="text" name="date-range-picker" id="id-date-range-picker-1" value="">
                </div>
            </div>
        </div>
        <div class="widget-toolbar">
            <a href="#" data-action="collapse">
                <i class="icon-chevron-up"></i>
            </a>
        </div>
    </div>
    <div class="space-10"></div>

    <div class="widget-body index"><div class="widget-body-inner" style="display: block;">
        <div class="widget-main no-padding">
            <table class="table table-bordered table-striped">
                <thead class="thin-border-bottom">
                <tr>
                    <th><i class="icon-caret-right blue"></i>
                        统计渠道
                    </th>
                    <th>
                        <i class="icon-caret-right blue"></i>
                        新增关注人数
                    </th>

                    <th class="hidden-480">
                        <i class="icon-caret-right blue"></i>
                        取消关注人数
                    </th>
                    <th class="hidden-480">
                        <i class="icon-caret-right blue"></i>
                        累计关注人数
                    </th>
                    <th class="hidden-480">
                        <i class="icon-caret-right blue"></i>
                        新增意向购房人数
                    </th>
                    <th class="hidden-480">
                        <i class="icon-caret-right blue"></i>
                        累计意向购房人数
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td><b class="green">全网统计</b></td>
                    <td><b class="green">${subTotal.new_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.cancel_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.total_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.new_intention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.total_intention}</b></td>
                </tr>
                <tr>
                    <td><b class="green">传播统计</b></td>
                    <td><b class="green">${subTotal.spread_new_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.spread_cancel_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.spread_total_attention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.spread_new_intention}</b></td>
                    <td class="hidden-480"><b class="green">${subTotal.spread_total_intention}</b></td>
                </tr>
                <tr>
                    <td><b class="green">传播数据占比</b></td>
                    <td><b class="green">
                        <#if subTotal.new_attention==0>
                                    ${(subTotal.spread_new_attention/1)?string.percent}
                                    <#else >
                        ${(subTotal.spread_new_attention/subTotal.new_attention)?string.percent}
                        </#if>
                    </b></td>
                    <td class="hidden-480"><b class="green">
                        <#if subTotal.cancel_attention==0>
                                    ${(subTotal.spread_cancel_attention/1)?string.percent}
                                    <#else>
                        ${(subTotal.spread_cancel_attention/subTotal.cancel_attention)?string.percent}
                        </#if>
                    </b></td>
                    <td class="hidden-480"><b class="green">
                        <#if subTotal.total_attention==0>
                                    ${(subTotal.spread_total_attention/1)?string.percent}
                                    <#else>
                        ${(subTotal.spread_total_attention/subTotal.total_attention)?string.percent}
                        </#if>
                    </b>
                    </td>

                    <td class="hidden-480"><b class="green">
                        <#if subTotal.new_intention==0>
                                    ${(subTotal.spread_new_intention/1)?string.percent}
                                    <#else>
                        ${(subTotal.spread_new_intention/subTotal.new_intention)?string.percent}
                        </#if>
                    </b>
                    </td>

                    <td class="hidden-480"><b class="green">
                        <#if subTotal.total_intention==0>
                                    ${(subTotal.spread_total_intention/1)?string.percent}
                                    <#else>
                        ${(subTotal.spread_total_intention/subTotal.total_intention)?string.percent}
                        </#if>
                    </b>
                    </td>

                </tr>
                </tbody>
            </table>
        </div><!-- /widget-main -->
    </div></div><!-- /widget-body -->
</div>
<div class="space-20"></div>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<div class="space-20"></div>

<div class="table-responsive">
    <h4 class="smaller lighter orange">
        <b>数据详细查看：</b>
    </h4>
    <table id="sample-table-1" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th rowspan="2">日期</th>
            <th colspan="2">新增关注人数</th>
            <th colspan="2">取消关注人数</th>
            <th colspan="2">累计关注人数</th>
            <th colspan="2">新增意向购房人数</th>
            <th colspan="2">累计意向购房人数</th>
        </tr>
        <tr>
        <#--<th>日期</th>-->
        <th>全网统计</th>
        <th>传播统计</th>
        <th>全网统计</th>
        <th>传播统计</th>
        <th>全网统计</th>
        <th>传播统计</th>
        <th>全网统计</th>
        <th>传播统计</th>
        <th>全网统计</th>
        <th>传播统计</th>

        </thead>

        <tbody>
            <#list report as item>
            <tr>
                <td>${item.title}</td>
                <td>${item.new_attention}</td>
                <td>${item.spread_new_attention}</td>
                <td>${item.cancel_attention}</td>
                <td>${item.spread_cancel_attention}</td>
                <td>${item.total_attention}</td>
                <td>${item.spread_total_attention}</td>
                <td>${item.new_intention}</td>
                <td>${item.spread_new_intention}</td>
                <td>${item.total_intention}</td>
                <td>${item.spread_total_intention}</td>
            </tr>
            </#list>
        <tr>
            <td>${subTotal.title}</td>
            <td>${subTotal.new_attention}</td>
            <td>${subTotal.spread_new_attention}</td>
            <td>${subTotal.cancel_attention}</td>
            <td>${subTotal.spread_cancel_attention}</td>
            <td>${subTotal.total_attention}</td>
            <td>${subTotal.spread_total_attention}</td>
            <td>${subTotal.new_intention}</td>
            <td>${subTotal.spread_new_intention}</td>
            <td>${subTotal.total_intention}</td>
            <td>${subTotal.spread_total_intention}</td>
        </tr>
        <tr>
            <td><b class="green">传播数据占比</b></td>
            <td colspan="2"><b class="green">
                <#if subTotal.new_attention==0>
                                    ${(subTotal.spread_new_attention/1)?string.percent}
                                    <#else >
                ${(subTotal.spread_new_attention/subTotal.new_attention)?string.percent}
                </#if>
            </b></td>
            <td colspan="2" class="hidden-480"><b class="green">
                <#if subTotal.cancel_attention==0>
                                    ${(subTotal.spread_cancel_attention/1)?string.percent}
                                    <#else>
                ${(subTotal.spread_cancel_attention/subTotal.cancel_attention)?string.percent}
                </#if>
            </b></td>
            <td colspan="2" class="hidden-480"><b class="green">
                <#if subTotal.total_attention==0>
                                    ${(subTotal.spread_total_attention/1)?string.percent}
                                    <#else>
                ${(subTotal.spread_total_attention/subTotal.total_attention)?string.percent}
                </#if>
            </b>
            </td>

            <td colspan="2" class="hidden-480"><b class="green">
                <#if subTotal.new_intention==0>
                                    ${(subTotal.spread_new_intention/1)?string.percent}
                                    <#else>
                ${(subTotal.spread_new_intention/subTotal.new_intention)?string.percent}
                </#if>
            </b>
            </td>

            <td colspan="2" class="hidden-480"><b class="green">
                <#if subTotal.total_intention==0>
                                    ${(subTotal.spread_total_intention/1)?string.percent}
                                    <#else>
                ${(subTotal.spread_total_intention/subTotal.total_intention)?string.percent}
                </#if>
            </b>
            </td>

        </tr>
        </tbody>
    </table>
</div>


<!-- PAGE CONTENT ENDS -->
</div><!-- /.col -->
</div><!-- /.row -->
</div><!-- /.page-content -->

<script>
    $(function () {
        var myDate = new Date();
        var yesterday = myDate.getFullYear()+'-'+(myDate.getMonth() + 1)+'-'+(myDate.getDay()-1);
        var today = myDate.getFullYear()+'-'+(myDate.getMonth() + 1)+'-'+myDate.getDay();
        var startDate = $("#startDate").val();
        var endDate = $("#endDate").val();
        if(startDate != null && endDate != null){
            startDate = dateFormat(startDate);
            endDate = dateFormat(endDate);
            $("#id-date-range-picker-1").val(startDate+' - '+endDate);
        }
        $('input[name=date-range-picker]').daterangepicker({
            format: 'YYYY-MM-DD',
            startDate: yesterday,
            endDate: today
        },function(start, end, label) {
            start = start.format('YYYY-MM-DD 00:00:00');
            end = end.format('YYYY-MM-DD 23:59:59');
            window.location.href = '/admin/analytics/expand?cycle=range&startDate='+start+'&endDate='+end;
        })

        $('input[name=date-range-picker]').daterangepicker({
            format: 'YYYY/MM/DD',
            startDate: '2014/04/05',
            endDate: '2014/04/06'
        },function(start, end, label) {
//            alert('设置时间: ' + start.format('YYYY/MM/DD') + ' - ' + end.format('YYYY/MM/DD'));
        });

        $.ajax({
            url:'/admin/analytics/expand/line?cycle=${cycle}&startDate=${startDate}&endDate=${endDate}',
            asnyc:'false',
            type:'get',
            success:function(json){
                lineReport(json);
            }
        });
    });

    function lineReport(json){
        $('#container').highcharts({
            chart: {
                renderTo: 'container',
                type: 'line'
            },
            title: {
                text: '增长趋势',
                x: -20 //center
            },
            credits : {
                enabled:true
            },
            xAxis: {
                tickInterval:json.data.step,
                tickmarkPlacement: 'on',
                dateTimeLabelFormats:
                {
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%m/%d',
                    week: '%m.%ew.',
                    month: '%Y/%m',
                    year: '%Y'
                },
               /* labels:{
                    step:json.data.step
                },*/
            //    offset:100,
                categories: json.data.categories
            },
            yAxis: {
                title: {
                    text: '单位 (人)'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }],
                min:0 // 定义最小值  
            },
            tooltip: {
                valueSuffix: '人'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'right',
                borderWidth: 0
            },
            plotOptions: {
                line: {
                    marker: {
                        symbol: 'circle',
                        lineWidth:2
                    },
                    dataLabels: {
                        enabled: true
                    }
                }
            },
            series: json.data.series
        });
    }

    function dateFormat(date){
        date = date.substr(0,10);
        var arr = date.split("-");
        var str = arr.join("/");
        return str;
    }
</script>

</@we.html>