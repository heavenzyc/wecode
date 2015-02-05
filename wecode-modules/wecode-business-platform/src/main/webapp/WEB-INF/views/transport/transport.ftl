<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="page-header">
        <a class="btn btn-success" href="/transport/add">添加数据</a>
    </div>

    <div class="row">
        <div class="col-xs-12" >
            <div class="space-6"></div>
            <div class="clearfix">
                <div class="pull-left text-left clearfix" style="margin-left:20px;">
                    <label class="pull-left" style="margin-top:5px">发货日期：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <div class="input-group" style="width:250px; margin-left:0px;">
                            <span class="input-group-addon">
                                <i class="icon-calendar bigger-110"></i>
                            </span>
                            <input class="form-control" type="text" name="date-range-picker" id="id-date-range-picker-1" value="" start="" end="">
                        </div>
                    </div>
                    <label class="pull-left" style="margin-top:5px">卸货时间：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <div class="input-group" style="width:250px; margin-left:0px;">
                            <span class="input-group-addon">
                                <i class="icon-calendar bigger-110"></i>
                            </span>
                            <input class="form-control" type="text" name="date-range-picker" id="id-date-range-picker-2" value="" start="" end="">
                        </div>
                    </div>
                    <label class="pull-left" style="margin-top:5px">收货人：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <input id="accepter" name="accepter" type="text" class="" placeholder="">
                    </div>
                    <label class="pull-left" style="margin-top:5px">发货人：</label>
                    <div class="pull-left">
                        <input id="sender" name="sender" type="text" class="" placeholder="">
                    </div>
                    <span class="pull-left" style="margin:3px 0 0 10px;">
                        <button id="find_btn" type="button" class="btn btn-purple btn-sm" style="position: relative; padding:2px 8px; top:-2px">
                            查询
                            <i class="icon-search icon-on-right bigger-110" placeholder=""></i>
                        </button>
                    </span>
                </div>
            </div>
            <div class="space-6"></div>
            <div class="table-responsive">
                <table id="grid-table"></table>
                <div id="grid-pager"></div>
                <script type="text/javascript">
                    var $path_base = "/";
                    //this will be used in gritter alerts containing images
                </script>
            </div>
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->
</@we.html>

<script>

    $(function () {
        var myDate = new Date();
        var yesterday = myDate.getFullYear()+'/'+(myDate.getMonth() + 1)+'/'+(myDate.getDay());
        var today = myDate.getFullYear()+'/'+(myDate.getMonth() + 1)+'/'+(myDate.getDay()+1);
        $('input[name=date-range-picker]').daterangepicker({
            format: 'YYYY/MM/DD',
            startDate: yesterday,
            endDate: today
        },function(start, end, label) {
            start = start.format('YYYY/MM/DD');
            end = end.format('YYYY/MM/DD');
            $("#id-date-range-picker-1").attr("start",start);
            $("#id-date-range-picker-1").attr("end",end);
        });
        $("#find_btn").click(function(){
            searchSub();
        });
    });

    function searchSub(){
        var accepter = $("#accepter").val();
        var sender = $("#sender").val();
        var range1 = $("#id-date-range-picker-1").val();
        var range2 = $("#id-date-range-picker-2").val();
        var transportTimeStart = "" ;
        var transportTimeEnd = "" ;
        if(range1.length>0){
            range1 = range1.split("-");
            transportTimeStart = range1[0];
            transportTimeEnd = range1[1];
        }
        var offTimeStart = "" ;
        var offTimeEnd = "" ;
        if(range2.length>0) {
            range2 = range2.split("-");
            offTimeStart = range2[0];
            offTimeEnd = range2[1];
        }
        $("#grid-table").jqGrid('setGridParam',{
            url:"/transport/list",
            postData:{sender:sender,
                accepter:accepter,
                transportTimeStart:transportTimeStart,
                transportTimeEnd:transportTimeEnd,
                offTimeStart:offTimeStart,
                offTimeEnd:offTimeEnd
            }
        }).trigger("reloadGrid");
    }

    jQuery(function($){
        var pager_selector = "#grid-pager";
        var table = $("#grid-table");
        table.jqGrid({
            url : "/transport/list",
            datatype : "json",
            mtype : 'get',
            height : 400,
            caption:'货  物  承  运  单  （代收，发料单）',
            rownumbers: true,
            scrollOffset:1,
            colModel :
                    [
                        {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false},
                        {name : 'code',label:'运输单号',index :'code',width :10,sorttype : "int",editable : false},
                        {name : 'transport_merchant_name',label:'运输单位',index :'id',width :10,sorttype : "int",editable : false},
                        {name : 'input_output_code',label:'出入库单号',index :'id',width :10,sorttype : "int",editable : false},
                        {name : 'send_address',index : 'id',label:'发货地址',width :10,editable : false},
                        {name : 'send_person',index : 'consultant_name',label:'发货人',width : 10,editable : false},
                        {name : 'send_person_phone',index : 'send_person_phone',label:'发货人电话',width : 10,editable : false},
                        {name : 'accept_merchant',index : 'consultant_name',label:'收货单位',width : 10,editable : false},
                        {name : 'accept_address',index : 'consultant_name',label:'收货地址',width : 10,editable : false},
                        {name : 'accept_person',index : 'accept_person',label:'收货人',width : 10,editable : false},
                        {name : 'accept_person_phone',index : 'consultant_name',label:'收货人电话',width : 10,editable : false},
                        {name : 'material_name',index : 'consultant_name',label:'货物名称',width : 10,editable : false},
                        {name : 'unit',index : 'consultant_name',label:'数量单位',width : 10,editable : false},
                        {name : 'shipping_address',index : 'consultant_name',label:'装货地点',width : 10,editable : false},
                        {name : 'shipping_person_phone',index : 'consultant_name',label:'装货人电话',width : 10,editable : false},
                        {name : 'send_time',index :'reserve_time',label:'发货日期', width : 10,editable : false,formatter:"date",formatoptions: {srcformat:'Y-m-d',newformat:'Y-m-d'}},
                        {name : 'off_time',index :'reserve_time',label:'卸货日期', width : 10,editable : false,formatter:"date",formatoptions: {srcformat:'Y-m-d',newformat:'Y-m-d'}},
                        {name : 'car_num',index : 'consultant_name',label:'运输车号',width : 10,editable : false},
                        {name : 'id',index : 'id',label:'操作',width : 150,fixed : true,sortable : false,resize : false,formatter : function(value, options, rData){
                            var html = '';
                            html += '<a class="btn no-border btn-minier btn-primary process" href="/transport/update/'+value+'">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<button class="btn no-border btn-minier btn-warning process" onclick="deleteInfo('+value+')" >删除</button>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<a class="btn no-border btn-minier btn-primary process" target="_blank" href="/transport/print/'+value+'">打印</a>';
                            return html;
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

    function showToast(text,title,time){
        $.gritter.add({
            title : title || '信息提示',
            time : time || 1000,
            text : text,
            class_name : 'gritter-info gritter-center'
        });
    }

    function deleteInfo(id) {
        bootbox.confirm("确定删除该数据吗?", function(result) {
            if(result) {
                $.ajax({
                    url:"/transport/delete",
                    async: false,
                    type:'GET',
                    data:{id:id},
                    success:function(json) {
                        if(json.success) {
                            $("#grid-table").trigger("reloadGrid");
                            showToast("删除成功！");
                        }
                    }
                });
            }
        });
    }

</script>