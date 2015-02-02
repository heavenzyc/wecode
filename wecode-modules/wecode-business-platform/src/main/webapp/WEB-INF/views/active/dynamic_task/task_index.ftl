<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css",
"${csspath}/ui.jqgrid.css"]
js=["${jspath}/date-time/bootstrap-datepicker.min.js",
"${jspath}/jqGrid/jquery.jqGrid.min.js",
"${jspath}/jqGrid/i18n/grid.locale-cn.js",
"${jspath}/My97DatePicker/WdatePicker.js",
"${jspath}/bootbox.min.js"]>


<@we.breadcrumb/>
<div class="page-content">
    <div class="page-header">
        <a class="btn btn-primary no-border" href="${path}/admin/active/dynamic_task/add">添加动态任务</a>
    </div>
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <div class="table-responsive">
                    <table id="grid-table"></table>
                    <div id="grid-pager"></div>
                    <script type="text/javascript">
                        var $path_base = "/";
                        //this will be used in gritter alerts containing images
                    </script>
			</div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->


<script type="text/javascript">
	jQuery(function($){
        var pager_selector = "#grid-pager";
        var table = $("#grid-table");
        table.jqGrid({
            url : "${path}/admin/active/dynamic_task/list",
            datatype : "json",
            mtype : 'get',
        //    height : 320,
            caption:'预约列表',
            rownumbers: true,
            sortable:false,
            colModel :
                    [
                        {name : 'taskId',index : 'taskId',hidden : true,width :0,sorttype : "int",editable : false},
                        {name : 'title',label:'任务名称',index :'id',width :10,editable : false,sortable:false,
                            formatter:function(value, options, rData){
                                return '<a href="${path}/admin/active/dynamic_task/edit/'+rData.taskId+'">'+value+'</a>';
                            }
                        },
                        {name : 'awardMethod',index : 'awardMethod',label:'奖励方式',sortable:false,width :10,editable : false},
//                        {name : 'reserve_time',index :'reserve_time',label:'任务时间', width : 10,editable : false,formatter:"date",formatoptions: {newformat:'Y-m-d'}},
                        {name : 'status',index : 'status',label:'状态',width : 10,sortable:false,editable : false,formatter:function(value){
                            if(value == 'WAIT'){
                                return '<span class="label">待发布</span>';
                            }else if(value == 'ONLINE'){
                                return '<span class="label label-success arrowed-in">已发布</span>';
                            }else{
                                return '<span class="label">已下线</span>';
                            }
                        }},
                        {name : 'crateTime',index : 'crateTime',label:'创建时间',width : 200,fixed : true,sortable : false},
                        {name : 'participateCount',label:'累计参与人数',index :'participateCount',sortable:false,width :10,editable : false},
                        {name : 'shareCount',label:'累计分享次数',index :'shareCount',width :10,sortable:false, editable : false},
                        {name : 'callbackCount',label:'累计回访人数',index :'callbackCount',width :10, sortable:false,editable : false},
                        {name : 'attentionCount',label:'累计关注人数',index :'attentionCount',width :10,sortable:false,sorttype : "int",editable : false},
                        {name : 'intentionCount',label:'累计意向购房人数',index :'intentionCount',width :10,sortable:false,sorttype : "int",editable : false},
                        {name : 'taskId',index : 'taskId',label:'操作',width : 100,fixed : true,sortable : false,resize : false,
                            formatter : function(value, options, rData){
                            if(rData.status == 'WAIT'){
                                return '<button class="btn no-border btn-minier btn-warning js_online" onclick="releaseTask('+value+')">发布上线</button>';
                            }else if(rData.status == 'ONLINE'){
                                return '<button class="btn no-border btn-minier btn-warning js_offline" onclick="offline('+value+')">下线</button>';
                            }else{
                                return '<button class="btn no-border btn-minier btn-warning js_online" onclick="releaseTask('+value+')">重新发布</button>';
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

    function releaseTask(taskId){
        bootbox.confirm("确定发布吗?", function(result) {
            if(result) {
                $.ajax({
                    type: "POST",
                    url: "${path}/admin/active/dynamic_task/online",
                    data: {taskId: taskId},
                    dataType: "json",
                    success: function(json){
                        if(!json.success){
                            msgTips(json.message || "发布任务错误");
                        }else{
                            $("#grid-table").trigger("reloadGrid");
                        }
                    }
                });
            }
        });

    }

    function offline(taskId){
        bootbox.confirm("确定将该任务下线吗?", function(result) {
            if(result) {
                $.ajax({
                    type: "POST",
                    url: "${path}/admin/active/dynamic_task/offline",
                    data: {taskId: taskId},
                    dataType: "json",
                    success: function(json){
                        if(!json.success){
                            msgTips(json.message || "任务下线错误");
                        }else{
                            $("#grid-table").trigger("reloadGrid");
                        }
                    }
                });
            }
        });

    }

    function msgTips(msg){
        $.gritter.add({
            title : '信息提示',
            time : 3000,
            text : msg,
            class_name : 'gritter-info gritter-center '
        });
    }
</script>
</@we.html>