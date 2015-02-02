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
			<div class="table-responsive" style="margin-top: 20px">
				<#--<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>序号</th>
							<th>交易金额</th>
							<th>剩余金额</th>
							<th>交易类型</th>
							<th>交易原因</th>
                            <th><i class="icon-time bigger-110 hidden-480"></i>
                                交易时间
                            </th>
						</tr>
					</thead>

					<tbody>
						<#list recordList as item>
						<tr>
							<td>${item_index+1}</td>
							<td>${item.change_money!?html}</td>
							<td>${item.remain_money!?html}</td>
							<td>${item.getChangeType().getDesc()}</td>
							<td>${item.getChangeReason().getDesc()}</td>
							<td>${(item.create_time?string("yyyy-MM-dd HH:mm"))!}</td>
						</tr>
						</#list>
					</tbody>
				</table>
                <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage
                actionUrl="/admin/project/customer/record/" />-->
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
    goldChangeRecord(${customerId});
</script>
</@we.html>