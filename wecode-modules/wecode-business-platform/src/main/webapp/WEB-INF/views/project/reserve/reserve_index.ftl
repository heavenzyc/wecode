<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css","${csspath}/ui.jqgrid.css"] js=["${jspath}/date-time/bootstrap-datepicker.min.js","${jspath}/jqGrid/jquery.jqGrid.min.js","${jspath}/jqGrid/i18n/grid.locale-cn.js"]>


<@we.breadcrumb/>
<div class="page-content">

	<div class="row">
		<div class="col-xs-12">


			<div class="table-responsive">
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

<script type="text/javascript">
	jQuery(function($){
		$(".process").click(function(){
			var reserveId = $(this).attr("__reserve_id");
			$.ajax({
				type: "POST",
				url: "/admin/project/reserve/process",
				data: {reserveId: reserveId},
				dataType: "json",
				success: function(json){
					if(json.success){
                        window.location.reload();
					}
				}
			});
		});

        var pager_selector = "#grid-pager";
        var table = $("#grid-table");
        table.jqGrid({
            url : "/admin/project/reserve/list",
            datatype : "json",
            mtype : 'get',
            height : 380,
            caption:'预约列表',
            rownumbers: true,
            colModel :
                    [
                        {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false},
                        {name : 'customer_name',label:'客户姓名',index :'id',width :10,sorttype : "int",editable : false},
                        {name : 'mobile',index : 'id',label:'手机号',width :10,editable : false},
                        {name : 'reserve_time',index :'reserve_time',label:'看房时间', width : 10,editable : false,formatter:"date",formatoptions: {newformat:'Y-m-d'}},
                        {name : 'consultant_name',index : 'consultant_name',label:'预约顾问',width : 10,editable : false},
                        {name : 'status',index : 'status',label:'状态',width : 10,editable : false,formatter:function(value){
                            if(value==0){ return '<span class="label label-success arrowed-in">待处理</span>';}
                            else{
                                return '<span class="label">已处理</span>';
                            }
                        }},
                        {name : 'remark',index : 'remark',label:'备注',width : 300,fixed : true,sortable : false},
                        {name : 'submit_time',index : 'submit_time',label:'提交时间',width : 200,fixed : true,sortable : false},
                        {name : 'id',index : 'id',label:'操作',width : 100,fixed : true,sortable : false,resize : false,formatter : function(value, options, rData){
                            if(rData.status == 0){
                                return '<button class="btn no-border btn-minier btn-warning process" onclick="enterReserve('+value+')" >确认</button>';
                            }else{
                                return '<button disabled class="btn no-border btn-minier btn-warning process" onclick="enterReserve('+value+')" >确认</button>';
                            }
                        }}
                    ],
            viewrecords : true,
            rowNum : 10,
            rowList : [10, 20, 30],
            pager : pager_selector,
            altRows : true,
            autowidth:true,
            multiselect : false,
            multiboxonly : false,
            loadComplete : function(data) {
                var table = this;
                setTimeout(function() {
                    //styleCheckbox(table);
                    updateActionIcons(table);
                    updatePagerIcons(table);
                    enableTooltips(table);
                }, 0);
            }
        });

	});

    function updateActionIcons(table) {

        var replacement = {
            'ui-icon-pencil' : 'icon-pencil blue',
            'ui-icon-trash' : 'icon-trash red',
            'ui-icon-disk' : 'icon-ok green',
            'ui-icon-cancel' : 'icon-remove red'
        };
        $(table).find('.ui-pg-div span.ui-icon').each(function() {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
            if ( $class in replacement)
                icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    //replace icons with FontAwesome icons like above
    function updatePagerIcons(table) {
        var replacement = {
            'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
            'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
            'ui-icon-seek-next' : 'icon-angle-right bigger-140',
            'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
        };
        $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function() {
            var icon = $(this);
            var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

            if ( $class in replacement)
                icon.attr('class', 'ui-icon ' + replacement[$class]);
        })
    }

    function enableTooltips(table) {
        $('.navtable .ui-pg-button').tooltip({
            container : 'body'
        });
        $(table).find('.ui-pg-div').tooltip({
            container : 'body'
        });
    }

    function enterReserve(id){
        $.ajax({
            type: "POST",
            url: "/admin/project/reserve/process",
            data: {reserveId: id},
            dataType: "json",
            success: function(json){
                if(json.success){
                    $("#grid-table").trigger("reloadGrid");
                }
            }
        });
    }
</script>

</@we.html>