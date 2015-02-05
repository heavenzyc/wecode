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
            <form id="add_input_info" class="form-horizontal" houseType="form" action="/loan/save" method="post">
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款部门</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="merchant_id" onchange="getSender()">
                            <#list depts as dept>
                                <option value="${dept.id}">${dept.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款人</label>
                    <div class="col-sm-10">
                        <input type="text" id="count" class="col-xs-10 col-sm-5" name="count" maxlength="10" datatype="s2-20" nullmsg="请输入数量"/>
                        <label id="unit"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">使用部门</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="material" data-placeholder="请选择..." name="material_id" onchange="getUnit()">
                            <#list depts as dept>
                                <option value="${dept.id}">${dept.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款人</label>
                    <div class="col-sm-10">
                        <input type="text" id="count" class="col-xs-10 col-sm-5" name="count" maxlength="10" datatype="s2-20" nullmsg="请输入数量"/>
                        <label id="unit"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">款项类别</label>
                    <div class="col-sm-10">
                        <label>
                            <input id="cash" name="loan_type" type="radio" class="ace" checked onclick="changeCash()"/>
                            <span class="lbl">现金</span>
                        </label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <label>
                            <input id="checks" name="loan_type" type="radio" class="ace" onclick="changeCheck()"/>
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
                        <input type="text" id="structure" class="col-xs-10 col-sm-5" name="warehouse" maxlength="50" nullmsg="请输入户型结构" datatype="s"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款金额(小写)</label>

                    <div class="col-sm-10">
                        <input type="text" id="transport_person" class="col-xs-10 col-sm-5" name="transport_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款日期</label>
                    <div class="col-sm-10">
                        <div class="input-group" style="width:235px;">
                            <input id="end_join_time" class="form-control date-picker" name="loan_time" type="text" data-date-format="yyyy-mm-dd">
                                <span class="input-group-addon">
                                    <i class="icon-calendar bigger-110"></i>
                                </span>
                        </div>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">还款方式</label>

                    <div class="col-sm-10">
                        <input type="text" id="car_num"  class="col-xs-10 col-sm-5" name="car_num" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">批准人</label>

                    <div class="col-sm-10">
                        <input type="text" id="weigh_person"  class="col-xs-10 col-sm-5" name="weigh_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">财务核准</label>

                    <div class="col-sm-10">
                        <input type="text" id="weigh_person"  class="col-xs-10 col-sm-5" name="weigh_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">财务审核</label>

                    <div class="col-sm-10">
                        <input type="text" id="weigh_person"  class="col-xs-10 col-sm-5" name="weigh_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">部门审核</label>

                    <div class="col-sm-10">
                        <input type="text" id="weigh_person"  class="col-xs-10 col-sm-5" name="weigh_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">借款用途</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内"></textarea>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内"></textarea>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">附件</label>
                    <div class="col-sm-5">
                        <input class="col-xs-4" type="file" name="excel" id="id-input-file-2" />
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