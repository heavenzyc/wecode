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
            <form id="add_loan_info" class="form-horizontal" >
                <input type="hidden" name="annex_name" id="annex" />
                <input type="hidden" name="annex_url" id="annex_url"/>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款部门</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="loan_dept_id" >
                            <#list depts as dept>
                                <option value="${dept.id}">${dept.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款人</label>
                    <div class="col-sm-10">
                        <input type="text" id="count" class="col-xs-10 col-sm-5" name="loan_person" maxlength="10" datatype="s2-20" nullmsg="请输入数量"/>
                        <label id="unit"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">使用部门</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="use_dept_id" data-placeholder="请选择..." name="use_dept_id" >
                            <#list depts as dept>
                                <option value="${dept.id}">${dept.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">款项类别</label>
                    <div class="col-sm-10">
                        <label>
                            <input id="cash" name="loan_type" value="CASH" type="radio" class="ace" checked onclick="changeCash()"/>
                            <span class="lbl">现金</span>
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <label>
                            <input id="checks" name="loan_type" value="CHECK" type="radio" class="ace" onclick="changeCheck()"/>
                            <span class="lbl">支票</span>
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <label class="hidden Js_check">
                        支票号码：<input class="input-sm" type="text" name="check_num" id="check_num">
                        </label>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款金额(大写)</label>

                    <div class="col-sm-10">
                        <input type="text" id="structure" class="col-xs-10 col-sm-5" name="money_capital" maxlength="50"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款金额(小写)</label>

                    <div class="col-sm-10">
                        <input type="text" id="money_lower" class="col-xs-10 col-sm-5" name="money_lower" maxlength="10"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款日期</label>
                    <div class="col-sm-10">
                        <div class="input-group" style="width:235px;">
                            <input id="end_join_time" class="form-control date-picker" placeholder="默认为当天" name="loan_time" type="text" data-date-format="yyyy-mm-dd">
                                <span class="input-group-addon">
                                    <i class="icon-calendar bigger-110"></i>
                                </span>
                        </div>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">还款方式</label>

                    <div class="col-sm-10">
                        <input type="text" id="repay_method"  class="col-xs-10 col-sm-5" name="repay_method" maxlength="50"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">批准人</label>

                    <div class="col-sm-10">
                        <input type="text" id="approve"  class="col-xs-10 col-sm-5" name="approve" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">财务核准</label>

                    <div class="col-sm-10">
                        <input type="text" id="verify"  class="col-xs-10 col-sm-5" name="verify" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">财务审核</label>

                    <div class="col-sm-10">
                        <input type="text" id="finance_verify"  class="col-xs-10 col-sm-5" name="finance_verify" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">部门审核</label>

                    <div class="col-sm-10">
                        <input type="text" id="dept_verify"  class="col-xs-10 col-sm-5" name="dept_verify" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款用途</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="reason" maxlength="200" placeholder="200字以内"></textarea>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" maxlength="200" name="remark" placeholder="200字以内"></textarea>
                    </div>
                </div>
            </form>
            <div class="form-horizontal" >
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">附件</label>
                    <div class="col-sm-3">
                        <input class="col-xs-4" type="file" name="annex" id="id-input-file" />
                    </div>
                    <button class="btn btn-sm btn-primary" onclick="uploadAnnex()">确认上传</button>
                </div>
            </div>
            <div class="clearfix form-actions">
                <div class="col-md-offset-2 col-md-9">
                    <button class="btn btn-info" type="button" onclick="submitForm()">
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
    $('#id-input-file').ace_file_input({
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

    function uploadAnnex(){
        $.ajaxFileUpload({
            url:'/loan/upload',
            type:'post',
            fileElementId:'id-input-file',
            dataType:'text',
            secureuri:false,
            success:function(json) {
                if(json.indexOf('true')!=-1){
                    showToast("上传成功！");
                    var annex = (json.split("!"))[1];
                    var annex_url = (json.split("#"))[1];
                    $("#annex").val(annex);
                    $("#annex_url").val(annex_url);
                }else{
                    showToast("上传失败！");
                }
            }
        });
    }

    function submitForm(){
        var data = $("#add_loan_info").serialize();
        $.validity.start();
        $("#money_lower").require("请输入金额").match("number");
        var result = $.validity.end().valid;
        if(result == false) return;
        $.ajax({
            url:'/loan/save',
            type:'post',
            data:data,
            success:function(json) {
                if(json.success){
                    window.location.href='/loan/index';
                }else {
                    showToast("网络异常，请稍后重试！")
                }
            }
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
</script>

</@we.html>