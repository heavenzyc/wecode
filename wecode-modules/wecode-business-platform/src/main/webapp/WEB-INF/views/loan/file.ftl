<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->
            <div class="clearfix form-actions">
                <div class="col-md-offset-2 col-md-9" style="font-size: 24px">
                    借    款    单
                </div>
            </div>
            <form id="add_loan_info" class="form-horizontal" houseType="form" action="/loan/upload" method="post" enctype="multipart/form-data">
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">附件</label>
                    <div class="col-sm-3">
                        <input class="col-xs-4" type="file" name="file" id="id-input-file-2" />
                        <#--<button class="btn btn-minier btn-purple">上传</button>-->
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="submit">
                            <i class="icon-ok bigger-110"></i>
                            保存
                        </button>

                        &nbsp; &nbsp; &nbsp;
                        <a href="javascript:history.go(-1);" class="btn" type="reset">
                            <i class="icon-undo bigger-110"></i>
                            取消
                        </a>
                    </div>
                </div>
            </form>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">

    $(function(){
        $(".chosen-select").chosen();
        $('.date-picker').datepicker({autoclose:true,language: 'zh-CN'}).next().on(ace.click_event, function(){
            $(this).prev().focus();
        });

        // 验证插件
        $("#add_loan_info").validity(function(){
            $("#money_lower").require("请输入金额").match("number");
        });
    })

    function changeCash(){
        $("#check_num").val("");
        $(".Js_check").addClass("hidden");
    }

    function changeCheck(){
        $(".Js_check").removeClass("hidden");
    }
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
</script>

</@we.html>