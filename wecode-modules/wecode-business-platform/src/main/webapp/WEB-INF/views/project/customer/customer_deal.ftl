<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css","${csspath}/ui.jqgrid.css"]
js=["${jspath}/date-time/bootstrap-datepicker.min.js",
"${jspath}/jqGrid/jquery.jqGrid.min.js",
"${jspath}/jqGrid/i18n/grid.locale-cn.js",
"${jspath}/project/customer/customer.js"]>

<@we.breadcrumb/>
<div class="page-content">


	<div class="row">
		<div class="col-xs-12">
            <ul class="nav nav-pills" style="margin-left:0">
                <li>
                    <a href="/admin/project/customer">关注客户</a>
                </li>
                <li>
                    <a href="/admin/project/customer/intention">意向客户</a>
                </li>
                <li class="active">
                    <a href="javascript:void(0)">成交客户</a>
                </li>
            </ul>
			<div class="table-responsive" style="margin-top: 20px">
				<#--<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
                            <th>序号</th>
                            <th>OPEN ID</th>
                            <th>昵称</th>
                            <th>姓名</th>
                            <th>手机号</th>
                            <th>找房币</th>
                            <th>影响力</th>
                            <th>TA的来源</th>
                            <th>回访人数</th>
                            <th>关注客户数</th>
                            <th>转化意向客户数</th>
                            <th>转化率</th>
                            <th>操作</th>
						</tr>
					</thead>

					<tbody>
						<#list customerList as item>
						<tr>
                            <td>${item_index+1}</td>
                            <td>${item.getOpenId()!?html}</td>
                            <td>${item.getCustomerName()!?html}</td>
                            <td>${item.name!?html}</td>
                            <td>${item.tel!?html}</td>
                            <td>${item.current_gold!?html}</td>
                            <td>${item.influenceCount()!?html}</td>
                            <td>
                                <a class="Js_show_relation" href="javascript:void(0)" data-options="${item.id}" >
                                    ${(item.getShareCustomer().getCustomerName())!?html}
                                </a>
                            </td>
                            <td>${item.getCallbackCount()}</td>
                            <td>${item.attentionCustomerCount()}</td>
                            <td>${item.intentionCustomerCount()}</td>
                            <td>${item.getConversionRate()}%</td>
                            <td>
                                <a href="/admin/project/customer/record?curPage=${page.pageNumber}&id=${item.id}" class="btn no-border btn-minier btn-warning process"
                                   __reserve_id="${item.id}">收支记录</a>
                                <a href="/admin/project/customer/info/${item.id}" class="btn no-border btn-minier btn-warning process"
                                   __reserve_id="${item.id}">查看</a>
                            </td>
						</tr>
						</#list>
					</tbody>
				</table>
                <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage
                actionUrl="/admin/project/customer/deal/" />-->
                    <table id="grid-table"></table>
                    <div id="grid-pager"></div>
                    <script type="text/javascript">
                        var $path_base = "/";
                        //this will be used in gritter alerts containing images
                    </script>
            </div>

		</div>
	</div>
</div>

<script>
    dealList();
</script>

</@we.html>