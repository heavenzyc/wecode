<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css",
"${csspath}/ui.jqgrid.css",
"${csspath}/daterangepicker.css"]
js=["${jspath}/date-time/bootstrap-datepicker.min.js",
"${jspath}/jqGrid/jquery.jqGrid.min.js",
"${jspath}/jqGrid/i18n/grid.locale-cn.js",
"${jspath}/modules/exporting.js",
"${jspath}/highcharts.js",
"${jspath}/date-time/moment.min.js",
"${jspath}/date-time/daterangepicker.min.js"]>


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
                            <a <#if cycle??&&cycle=="yesterday">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/customer/?cycle=yesterday">昨天</a>
                			<a <#if !cycle??||cycle=="today">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/customer/?cycle=today">今天</a>
                			<a <#if cycle??&&cycle=="seven_day">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/customer/?cycle=seven_day">最近7天</a>
                			<a <#if cycle??&&cycle=="thirty_day">class="btn btn-sm btn-pink"<#else>class="btn btn-sm btn-purple"</#if> href="/admin/analytics/customer/?cycle=thirty_day">最近30天</a>
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
                                <th>
                                    <i class="icon-caret-right blue"></i>
                                    新增关注人数
                                </th>

                                <th>
                                    <i class="icon-caret-right blue"></i>
                                    取消关注人数
                                </th>

                                <th class="hidden-480">
                                    <i class="icon-caret-right blue"></i>
                                    净增关注人数
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
                                <td><b class="green">${subTotal.new_attention}</b></td>
                                <td><b class="green">${subTotal.cancel_attention}</b></td>
                                <td class="hidden-480"><b class="green">${subTotal.new_attention-subTotal.cancel_attention}</b></td>
                                <td class="hidden-480"><b class="green">${subTotal.total_attention}</b></td>
                                <td class="hidden-480"><b class="green">${subTotal.new_intention}</b></td>
                                <td class="hidden-480"><b class="green">${subTotal.total_intention}</b></td>
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
                        <th>日期</th>
                        <th>新增关注人数</th>
                        <th>取消关注人数</th>
                        <th>净增关注人数</th>
                        <th>累计关注人数</th>
                        <th>新增意向购房人数</th>
                        <th>累计意向购房人数</th>
                    </tr>
                    </thead>

                    <tbody>
                    <#list report as item>
                    <tr>
                        <td>${item.title}</td>
                        <td>${item.new_attention}</td>
                        <td>${item.cancel_attention}</td>
                        <td>${item.new_attention-item.cancel_attention}</td>
                        <td>${item.total_attention}</td>
                        <td>${item.new_intention}</td>
                        <td>${item.total_intention}</td>
                    </tr>
                    </#list>
                    <tr>
                        <td><b class="green">${subTotal.title}</b></td>
                        <td><b class="green">${subTotal.new_attention}</b></td>
                        <td><b class="green">${subTotal.cancel_attention}</b></td>
                        <td><b class="green">${subTotal.new_attention-subTotal.cancel_attention}</b></td>
                        <td><b class="green">${subTotal.total_attention}</b></td>
                        <td><b class="green">${subTotal.new_intention}</b></td>
                        <td><b class="green">${subTotal.total_intention}</b></td>
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
            window.location.href = '/admin/analytics/customer?cycle=range&startDate='+start+'&endDate='+end;
        });

        $.ajax({
            url:'/admin/analytics/customer/line?cycle=${cycle}&startDate=${startDate}&endDate=${endDate}',
            asnyc:'false',
            type:'get',
            success:function(json){
                lineReport(json);
            }
        });
    });

    function lineReport(json){
        $('#container').highcharts({
            title: {
                text: '增长趋势',
                x: -20 //center
            },
            /*subtitle: {
                text: '数据来源: xxx.com',
                x: -20
            },*/
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
                labels:{
                //    step:json.data.step
                //    maxStaggerLines:json.data.step
                },
                offset:100,
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
                verticalAlign: 'middle',
                borderWidth: 0
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