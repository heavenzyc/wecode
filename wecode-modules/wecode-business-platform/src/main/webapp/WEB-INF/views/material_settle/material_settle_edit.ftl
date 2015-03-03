<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12" >
            <!-- PAGE CONTENT BEGINS -->
            <div class="clearfix form-actions">
                <div class="col-md-offset-5" style="font-size: 24px">
                    货  物  承  运  单  （代收，发料单）
                </div>
            </div>
            <table id="sample-table-1" class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th>运输日期</th>
                    <th>材料名称</th>
                    <th>规格</th>
                    <th>过磅数量（吨）</th>
                    <th>加工出成品数量（吨）</th>
                    <th>加工费（元）</th>
                    <th>运输费（元）</th>
                    <th>买入金额</th>
                    <th>卖出金额</th>
                    <th>成本</th>
                    <th>
                        <i class="icon-time bigger-110 hidden-480"></i>
                        Update
                    </th>
                    <th class="hidden-480">Status</th>

                    <th></th>
                </tr>
                </thead>

                <tbody>
                <#list data as item>
                <tr>
                    <td>${data.transport_time}</td>
                    <td>4,250</td>
                    <td>Jan 21</td>
                </tr>
                </#list>
                </tbody>
            </table>
            <form id="add_transport" class="form-horizontal" houseType="form" action="/transport/save" method="post">
                <input type="hidden" name="code" value="${code}">
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输单号</label>
                    <div class="col-sm-2">
                        <input type="text" id="project_name" disabled class="col-xs-12" value="${code}" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输单位</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="transport_merchant_id">
                            <#list transportMerchants as mer>
                                <option value="${mer.id}">${mer.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货地址</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="send_address" maxlength="200"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="send_person" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人电话</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="send_person_phone" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货单位</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="accept_merchant" maxlength="50" />
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货地址</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="accept_address" maxlength="100"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货人</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-12" name="accept_person" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货人电话</label>
                    <div class="col-sm-2">
                        <input type="text" id="structure" class="col-xs-12" name="accept_person_phone" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">货物名称</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="material" data-placeholder="请选择..." name="material_id">
                            <#list materials as mat>
                                <option value="${mat.id}">${mat.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">数量单位</label>
                    <div class="col-sm-2">
                        <input type="text" id="car_num"  class="col-xs-12" name="unit" maxlength="10"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">装货地点</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="shipping_address" maxlength="50"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">装货人电话</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="shipping_person_phone" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输车号</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="car_num" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">过磅人签字</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="weight_person_sign" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人签字</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="send_person_sign" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">承运人签字</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="transport_person_sign" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">司机签字</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="dirver_sign" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right"> 发货日期 </label>
                        <div class="col-sm-2">
                            <input type="text" style="width:250px;" id="endTime" name="send_time"
                                onclick="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate"/>
                        </div>
                    <label class="col-sm-2 control-label no-padding-right"> 卸货日期 </label>
                    <div class="col-sm-2">
                        <input type="text" style="width:250px;" id="endTime" name="off_time"
                               onclick="WdatePicker({startDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true,skin:'twoer', readOnly: true})" class="Wdate"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">过磅人电话</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="phone" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输费</label>
                    <div class="col-sm-2">
                        <input type="text" id="fee"  class="col-xs-12" name="fee" maxlength="10"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">加工费</label>
                    <div class="col-sm-2">
                        <input type="text" id="process_fee"  class="col-xs-12" name="process_fee" maxlength="10"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">货物类型</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="material" data-placeholder="请选择..." name="material_standard_id">
                            <#list standards as mat>
                                <option value="${mat.id}">${mat.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">买入金额</label>
                    <div class="col-sm-2">
                        <input type="text" id="buy_money"  class="col-xs-12" name="buy_money" maxlength="10"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">卖出金额</label>
                    <div class="col-sm-2">
                        <input type="text" id="sale_money"  class="col-xs-12" name="sale_money" maxlength="10"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">加工厂过磅数量</label>
                    <div class="col-sm-2">
                        <input type="text" id="weight_count"  class="col-xs-12" name="weight_count" maxlength="10"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">已加工数量</label>
                    <div class="col-sm-2">
                        <input type="text" id="process_count"  class="col-xs-12" name="process_count" maxlength="10"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">加工单位</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="material" data-placeholder="请选择..." name="process_merchant_id">
                            <#list processMerchants as mat>
                                <option value="${mat.id}">${mat.name}</option>
                            </#list>
                        </select>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">已加工出成品数量</label>
                    <div class="col-sm-2">
                        <input type="text" id="count1"  class="col-xs-12" name="count" maxlength="10"/>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-5">
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
        $("#add_transport").validity(function(){
            $("#fee").require("请输入运输费").match("number");
            $("#process_fee").require("请输入加工费").match("number");
            $("#buy_money").require("请输入购买金额").match("number");
            $("#sale_money").require("请输入卖出金额").match("number");
            $("#weight_count").require("请输入过磅数量").match("number");
            $("#process_count").require("请输入已加工数量").match("number");
            $("#count1").require("请输入已加工成品数量").match("number");
        });
    })


</script>

</@we.html>