<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="page-header">
        <a class="btn btn-success" href="/loan/add">添加数据</a>
    </div>

    <div class="row">
        <div class="col-xs-12" >
            <div class="space-6"></div>
            <div class="clearfix">
                <div class="pull-left text-left clearfix" style="margin-left:20px;">
                    <label class="pull-left" style="margin-top:5px">借款日期：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <div class="input-group" style="width:250px; margin-left:0px;">
                            <span class="input-group-addon">
                                <i class="icon-calendar bigger-110"></i>
                            </span>
                            <input class="form-control" type="text" name="date-range-picker" id="id-date-range-picker-1" value="" start="" end="">
                        </div>
                    </div>
                    <label class="pull-left" style="margin-top:5px">借款人：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <input id="loaner" name="loaner" type="text" class="" placeholder="">
                    </div>
                    <label class="pull-left" style="margin-top:5px">批准人：</label>
                    <div class="pull-left" style="margin-right:30px;">
                        <input id="approve" name="approve" type="text" class="" placeholder="">
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
        var loaner = $("#loaner").val();
        var approve = $("#approve").val();
        var range = $("#id-date-range-picker-1").val();
        var start = ""  ;
        var end = ""  ;
        if(range.length>0){
            range = range.split("-");
            start = range[0];
            end = range[1];
        }
        $("#grid-table").jqGrid('setGridParam',{
            url:"/loan/list",
            postData:{loaner:loaner,start:start,end:end,approve:approve}
        }).trigger("reloadGrid");
    }

    jQuery(function($){
        var pager_selector = "#grid-pager";
        var table = $("#grid-table");
        table.jqGrid({
            url : "/loan/list",
            datatype : "json",
            mtype : 'get',
            height : 380,
            caption:'借    款    单',
            rownumbers: true,
            scrollOffset:1,
            colModel :
                    [
                        {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false},
                        {name : 'loan_time',label:'借款时间',index :'code',width :10,sorttype : "int",editable : false,formatter:"date",formatoptions: {srcformat:'Y-m-d',newformat:'Y-m-d'}},
                        {name : 'loan_dept_name',label:'借款部门',index :'id',width :10,sorttype : "int",editable : false},
                        {name : 'loan_person',label:'借款人',index :'id',width :10,sorttype : "int",editable : false},
                        {name : 'use_dept_name',index : 'id',label:'使用部门',width :10,editable : false},
                        {name : 'loan_type',index :'reserve_time',label:'款项类别', width : 10,editable : false,formatter:function(value,opt,rDate){
                            if(value=='CASH'){
                                return '现金'
                            }else if(value=='CHECK'){
                                return '支票：' + rDate.check_num;
                            }else {
                                return "";
                            }
                        }},
                        {name : 'money_capital',index : 'consultant_name',label:'借款金额(大写)',width : 10,editable : false},
                        {name : 'money_lower',index : 'consultant_name',label:'借款金额(小写)',width : 10,editable : false},
                        {name : 'repay_method',index : 'consultant_name',label:'还款方式',width : 10,editable : false},
                        {name : 'approve',index : 'consultant_name',label:'批准人',width : 10,editable : false},
                        {name : 'verify',index : 'consultant_name',label:'财务核准',width : 10,editable : false},
                        {name : 'finance_verify',index : 'accept_person',label:'财务审核',width : 6,editable : false},
                        {name : 'dept_verify',index : 'consultant_name',label:'部门审核',width : 6,editable : false},
                        {name : 'reason',index : 'consultant_name',label:'借款用途及理由',width : 6,editable : false},
                        {name : 'remark',index : 'consultant_name',label:'备注',width : 6,editable : false},
                        {name : 'annex',index : 'consultant_name',label:'附件',width : 6,editable : false,formatter:function(value,opt,rDate){
                            if(value!= null && value != '') {
                                return '<a href="'+rDate.annex_url+'">'+value+'</a>'
                            }else{
                                return "";
                            }
                        }},
                        {name : 'id',index : 'id',label:'操作',width : 150,fixed : true,sortable : false,resize : false,formatter : function(value, options, rData){
                            var html = '';
                            html += '<a class="btn no-border btn-minier btn-primary process" href="/loan/update/'+value+'">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<button class="btn no-border btn-minier btn-warning process" onclick="deleteInfo('+value+')" >删除</button>&nbsp;&nbsp;&nbsp;&nbsp;';
                            html += '<a class="btn no-border btn-minier btn-primary process" target="_blank" href="/loan/print/'+value+'">打印</a>';
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



    $(".JS_improt").on("click",function(){
        var $this = $(this);
        var _html = [
            '<div class="widget-box no-border">',
            '	<div class="widget-header no-border">',
            '		<h4>导入数据</h4>',
            '	</div>',
            '	<div class="widget-body no-border">',
            '		<div class="widget-main no-padding">',
            '			<div class="material-list-wrap" style="height:auto">',
            '				<form id="inputExcel" enctype="multipart/form-data">',
            '					<div class="space-10"></div>',
            '					<div class="form-group clearfix">',
            '						<div class="col-sm-12">',
                    '                     <input type="file" name="excel" id="id-input-file-2" />',
            '						</div>',
            '					</div>',
            '				</form>',
            '			</div>',
            '			<div class="form-actions center no-margin">',
            '				<button type="button" class="btn btn-sm btn-success Js_confirm">',
            '					<b>确定</b>',
            '				</button>',
            '				<button class="btn btn-sm btn-grey Js_fancybox_close">',
            '					取消',
            '				</button>',
            '			</div>',
            '		</div>',
            '	</div>',
            '</div>'].join("");

        $.fancybox({
            type : "html",
            width : '600',
            autoHeight : true,
            autoSize : false,
            padding : 0,
            scrolling : 'auto',
            content: _html,
            afterShow : function(){
                $('#id-input-file-2').ace_file_input({
                    no_file:'选择文件 ...',
                    btn_choose:'选 择',
                    btn_change:'选 择',
                    droppable:false,
                    onchange:null,
                    thumbnail:false, //| true | large
                    whitelist:'xsl|xlsx'
                    //blacklist:'exe|php'
                    //onchange:''
                    //
                });
                $(".Js_confirm").on("click", function(){
                    //showSelectWordpic($this)
                    $.ajaxFileUpload({
                        url:'/input/importExcel',
                        type:'post',
                        fileElementId:'id-input-file-2',
                        dataType:'text',
                        secureuri:false,
                        success:function(json) {
                            if(json.indexOf('true')!=-1){
                                showToast("导入成功！");
                                $.fancybox.close();
                                $("#grid-table").trigger("reloadGrid");
                            }else{
                                showToast("导入失败！");
                            }
                        }
                    });
                });
            },
            afterClose: function(){
                $(".Js_confirm").off("click");
            }
        })
    });

    $(document).on("click",".Js_fancybox_close",function(){
        $.fancybox.close()
    })

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
                    url:"/loan/delete",
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