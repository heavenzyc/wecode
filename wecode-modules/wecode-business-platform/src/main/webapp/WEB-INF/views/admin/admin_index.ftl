<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html nosidebar=true css=[] js=["/assets/js/jquery-ui-1.10.3.custom.min.js",
"/assets/js/jquery.ui.touch-punch.min.js",
"/assets/js/jquery.slimscroll.min.js",
"/assets/js/jquery.easy-pie-chart.min.js",
"/assets/js/jquery.sparkline.min.js",
"/assets/js/flot/jquery.flot.min.js",
"/assets/js/flot/jquery.flot.pie.min.js",
"/assets/js/flot/jquery.flot.resize.min.js"]>

<div class="page-content">
<div class="row">
<div style="width:90%; margin:0 auto">
<!-- PAGE CONTENT BEGINS -->
<div class="space-12"></div>
<div class="infobox-container" style="text-align:left">
    <h4 class="smaller lighter pink">
        <i class="icon-signal"></i>
        <b>昨日统计概况：</b>
    </h4>
    <div class="infobox infobox-blue2 index" >
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#428bca" data-percent="${pa}" data-size="46">
                <span class="percent">${pa}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">${a2}</div><div class="text-muted">${a1}</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来页面浏览量</div><div class="text-muted">累计页面浏览量</div>
            </div>
        </div>
    </div>
    <#--<div class="infobox infobox-blue2 index ">
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#e59729" data-percent="${((b2/b1)*100)?substring(0,2)}" data-size="46">
                <span class="percent">${((b2/b1)*100)?substring(0,2)}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">b2</div><div class="text-muted">b1</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来页面访问次数</div><div class="text-muted">累计页面访问次数</div>
            </div>
        </div>
    </div>-->
    <div class="infobox infobox-blue2 index ">
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#629b58" data-percent="${pb}" data-size="46">
                <span class="percent">${pb}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">${b2}</div><div class="text-muted">${b1}</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来独立访问人数</div><div class="text-muted">累计独立访问人数</div>
            </div>
        </div>
    </div>
    <div class="infobox infobox-blue2 index ">
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#b73766" data-percent="${pc}" data-size="46">
                <span class="percent">${pc}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">${c2}</div><div class="text-muted">${c1}</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来新增访问人数</div><div class="text-muted">累计新增访问人数</div>
            </div>
        </div>
    </div>
    <div class="infobox infobox-blue2 index ">
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#7461aa" data-percent="${pd}" data-size="46">
                <span class="percent">${pd}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">${d2}</div><div class="text-muted">${d1}</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来新增关注人数</div><div class="text-muted">累计新增关注人数</div>
            </div>
        </div>
    </div>
    <div class="infobox infobox-blue2 index ">
        <div class="infobox-progress">
            <div class="easy-pie-chart percentage" data-color="#d15b47" data-percent="${pe}" data-size="46">
                <span class="percent">${pe}</span>%
            </div>
        </div>

        <div class="infobox-data">
            <div class="infobox-content text-right pull-left">
                <div class="topnum">${e2}</div><div class="text-muted">${e1}</div>
            </div>
            <div class="infobox-text text-left pull-left text-muted">
                <div class="topnum">传播带来新增意向购房人数</div><div class="text-muted">累计新增意向购房人数</div>
            </div>
        </div>
    </div>
</div>

<div class="space-20"></div>
<#if taskStatistics?size !=0>
<div>
    <div class="widget-box transparent">
        <div class="widget-header widget-header-flat">
            <h4 class="lighter">
                <i class="icon-star orange"></i>
                <b>正在进行的活动任务：</b>
            </h4>

            <div class="widget-toolbar">
                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>
            </div>
        </div>

        <div class="widget-body index"><div class="widget-body-inner" style="display: block;">
            <div class="widget-main no-padding">
                <table class="table table-bordered table-striped">
                    <thead class="thin-border-bottom">
                    <tr>
                        <th>
                            <i class="icon-caret-right blue"></i>
                            任务名称
                        </th>

                        <th>
                            <i class="icon-caret-right blue"></i>
                            累计参与人数
                        </th>

                        <th class="hidden-480">
                            <i class="icon-caret-right blue"></i>
                            累计分享次数
                        </th>
                        <th class="hidden-480">
                            <i class="icon-caret-right blue"></i>
                            累计带来回访人数
                        </th>
                        <th class="hidden-480">
                            <i class="icon-caret-right blue"></i>
                            累计带来关注人数
                        </th>
                        <th class="hidden-480">
                            <i class="icon-caret-right blue"></i>
                            累计带来意向购房人数
                        </th>
                    </tr>
                    </thead>

                    <tbody>
                        <#list taskStatistics as item>
                    <tr>

                        <td><a href="/admin/active/dynamic_task/edit/${item.getTaskId()}">${item.getTitle()}</a></td>

                        <td>
                            <b class="green">${item.getParticipateCount()}</b>
                        </td>

                        <td class="hidden-480">
                            <b class="green">${item.getShareCount()}</b>
                        </td>
                        <td class="hidden-480">
                            <b class="green">${item.getCallbackCount()}</b>
                        </td>
                        <td class="hidden-480">
                            <b class="green">${item.getAttentionCount()}</b>
                        </td>
                        <td class="hidden-480">
                            <b class="green">${item.getIntentionCount()}</b>
                        </td>

                    </tr>
                        </#list>
                    </tbody>
                </table>
            </div><!-- /widget-main -->
        </div></div><!-- /widget-body -->
    </div>
</div>
</#if>
<div class="space-20"></div>
<#if notice?size!=0>
<div>
    <div id="task-tab" class="tab-pane active">
        <h4 class="smaller lighter green">
            <i class="icon-list"></i>
            <b>今日事宜提醒（${notice?size}）：</b>
        </h4>

        <ul id="tasks" class="item-list ui-sortable">
            <#list notice as item>
            <li class="item-default clearfix" style="position: relative; opacity: 1; z-index: auto;">
                <label class="inline">
                    <span class="lbl"> ${item.getTitle()}</span>
                </label>

                <div class="inline pull-right position-relative dropdown-hover">
                    <button class="btn btn-minier btn-success"><a href="${item.getUrl()}">${item.getOperate()}</a></button>
                    <#--<button class="btn btn-minier btn-light">忽略</button>-->
                </div>
            </li>
            </#list>
        </ul>
    </div>
</div>
</#if>
<!-- PAGE CONTENT ENDS -->
</div><!-- /.col -->
</div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">
    jQuery(function($) {
        //	圈圈百分比
        $('.easy-pie-chart.percentage').each(function(){
            var $box = $(this).closest('.infobox');
            var barColor = $(this).data('color') || (!$box.hasClass('infobox-dark') ? $box.css('color') : 'rgba(255,255,255,0.95)');
            var trackColor = barColor == 'rgba(255,255,255,0.95)' ? 'rgba(255,255,255,0.25)' : '#E2E2E2';
            var size = parseInt($(this).data('size')) || 50;
            $(this).find(".percent").css("color",$(this).data('color'));
            $(this).parents(".infobox").find(".topnum").css("color",$(this).data('color'));
            $(this).easyPieChart({
                barColor: barColor,
                trackColor: trackColor,
                scaleColor: false,
                lineCap: 'butt',
                lineWidth: parseInt(size/10),
                animate: /msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()) ? false : 1000,
                size: size
            });
        })
    })
</script>
</@we.html>