<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
    <@we.breadcrumb/>
<div class="page-content">

    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->
            <ul class="nav nav-pills" style="margin-left:0;margin-bottom: 20px">
                <li class="active">
                    <a href="javascript:void(0)">串号兑换</a>
                </li>
                <li>
                    <a href="/admin/active/gift_exchange_rule">礼品设置</a>
                </li>

            </ul>

            <div class="row">
                <div class="col-xs-12"></div>
                <div class="col-xs-6">
                    <div class="timeline-item s-list clearfix">
                        <div class="widget-box transparent">
                            <div class="widget-body">
                                <div class="widget-body-inner clearfix">
                                    <div class="widget-thumb col-md-3 col-sm-5 col-xs-12">
                                        <img alt="${item.name!?html}" src="${kit.url('COMMON',item.pic_url)}">
                                    </div>

                                    <div class="widget-main col-md-9 col-sm-7 col-xs-12">
                                        <h4 class="s-title">${item.name}</h4>
                                        <div><label>兑换条件：</label>${item.gift_price}金币</div>
                                        <div><label>礼品数量：</label>已兑换${item.total_count-item.stock_count}份|总数${item.total_count}份</div>
                                        <div><label>活动时间：</label>${(item.start_time?string("yyyy-MM-dd"))!}至${(item.end_time?string("yyyy-MM-dd"))!}</div>
                                        <div class="space-6"></div>
                                        <div class="widget-toolbox clearfix">
                                            <#--<div class="pull-right action-buttons">
                                                <a href="/admin/active/gift_exchange_rule/edit?id=${item.id}&curPage=${page.pageNumber}" title="编辑">
                                                    <i class="icon-pencil blue bigger-125"></i>
                                                </a>
                                                <a href="/admin/active/gift_exchange_rule/delete?id=${item.id}&curPage=${page.pageNumber}&itemCount=${ruleList?size}" title="删除">
                                                    <i class="icon-remove red bigger-125"></i>
                                                </a>
                                            </div>-->
                                                <div class="col-md-offset-2 col-md-9">
                                                    <a href="/admin/active/gift_exchange_rule/log/operate?id=${log.id}" class="btn btn-info" >
                                                        <#--<i class="icon-ok bigger-110"></i>-->
                                                              确认兑换
                                                    </a>

                                                    &nbsp; &nbsp; &nbsp;
                                                    <a href="javascript:history.go(-1);" class="btn" type="reset">
                                                        <#--<i class="icon-undo bigger-110"></i>-->
                                                        取消
                                                    </a>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">


</script>

</@we.html>