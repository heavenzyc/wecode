<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="page-header">
        <button class="btn btn-primary JS_improt">导入数据</button>
        <a class="btn btn-danger" href="/input/exportExcel">导出数据</a>
        <a class="btn btn-danger" href="/input/add">添加数据</a>
    </div>

    <div class="row">
        <div class="col-xs-12 title"> <center>入  库  单（带过磅单）</center></div>
        <div class="col-xs-12" style="font-size: 18px">
            <div class="col-xs-1">入库日期：</div>
            <div class="col-xs-3">2015-01-29</div>
            <div class="col-xs-1">入库单编号：</div>
            <div class="col-xs-3">0000001</div>
            <div class="col-xs-1">收货人：</div>
            <div class="col-xs-3">张三</div>
        </div>
        <div class="col-xs-12" style="font-size: 18px">
            <div class="col-xs-1">供应矿：</div>
            <div class="col-xs-3">玉石山矿</div>
            <div class="col-xs-1">入库数量：</div>
            <div class="col-xs-3">10000</div>
            <div class="col-xs-1">发货人：</div>
            <div class="col-xs-3">张三</div>
        </div>
        <div class="col-xs-12" >
            <div class="table-responsive">
            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                <thead>
                    <tr>
                        <th>物品编号</th>
                        <th>物品名称</th>
                        <th>类别</th>
                        <th>规格</th>
                        <th>单位</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>总额</th>
                        <th>所入仓库</th>
                    </tr>
                </thead>

                <tbody>
                    <tr>
                        <td>1</td>
                        <td>2</td>
                        <td>3</td>
                        <td>3,330</td>
                        <td>Feb 12</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>合计</td>
                        <td>2</td>
                        <td>3</td>
                        <td>3,330</td>
                        <td>Feb 12</td>
                        <td>4</td>
                        <td>5</td>
                        <td>6</td>
                        <td>7</td>
                    </tr>
                    <tr>
                        <td>备注</td>
                        <td colspan="8">的所发生的发生的发生的发大水发违法</td>
                    </tr>
                    <tr>
                        <td>司机车号：</td>
                        <td colspan="3">川A 000001</td>
                        <td>过磅人：</td>
                        <td colspan="4">张三</td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->
</@we.html>

<script>



    $(".JS_improt").on("click",function(){
        var $this = $(this);
        var _html = [
            '<div class="widget-box no-border">',
            '	<div class="widget-header no-border">',
            '		<h4>导出数据</h4>',
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
                            $.fancybox.close();
                            showToast("上传成功！");
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

</script>