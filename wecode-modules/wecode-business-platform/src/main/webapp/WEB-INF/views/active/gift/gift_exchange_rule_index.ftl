<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=["/assets/js/My97DatePicker/WdatePicker.js"]>

<@we.breadcrumb/>
<div class="page-content">

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <ul class="nav nav-pills" style="margin-left:0">
                <li class="active">
                    <a href="javascript:void(0)">礼品设置</a>
                </li>
                <li>
                    <a href="/admin/active/gift_exchange_rule/log">串号兑换</a>
                </li>
                <a class="btn no-border btn-primary pull-right" href="${path}/admin/active/gift_exchange_rule/add">添加礼品</a>

            </ul>
            <div class="space-12"></div>
            <#list ruleList as item>
            <div class="col-xs-6">
                <div class="timeline-item s-list clearfix">
                    <div class="widget-box transparent">
                        <div class="widget-body">
                            <div class="widget-body-inner clearfix">
                                <div class="widget-thumb col-md-3 col-sm-5 col-xs-12">
                                    <img alt="${item.name!?html}" src="${kit.url('COMMON',item.list_pic)}">
                                </div>

                                <div class="widget-main col-md-9 col-sm-7 col-xs-12">
                                    <h4 class="s-title">${item.name!?html}</h4>

                                    <div><label>礼品数量：</label>已兑换${item.total_count-item.stock_count}份|总数${item.total_count}份</div>
                                    <div><label>活动时间：</label>${(item.start_time?string("yyyy-MM-dd"))!}至${(item.end_time?string("yyyy-MM-dd"))!}</div>
                                    <div><label>兑换条件：</label>${item.gift_price}${kit.dictValue(current_project.id,'point_name')}</div>
                                    <div class="space-6"></div>
                                    <div class="widget-toolbox clearfix">
                                        <div class="pull-right action-buttons">
                                            <a href="/admin/active/gift_exchange_rule/edit?id=${item.id}&curPage=${page.pageNumber}" title="编辑">
                                                <i class="icon-pencil blue bigger-125"></i>
                                            </a>
                                            <a href="/admin/active/gift_exchange_rule/delete?id=${item.id}&curPage=${page.pageNumber}&itemCount=${ruleList?size}" title="删除">
                                                <i class="icon-remove red bigger-125"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </#list>
            <div class="clearfix"></div>
            <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/active/gift_exchange_rule/" />
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->


</@we.html>
