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
                <li class="active">
                    <a href="javascript:void(0)">关注客户</a>
                </li>
                <li>
                    <a href="/admin/project/customer/intention">意向客户</a>
                </li>
                <li>
                    <a href="/admin/project/customer/deal">成交客户</a>
                </li>
            </ul>
			<div class="table-responsive" style="margin-top: 20px">
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
    $(function(){
        attentionList();
    });
</script>
</@we.html>