<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12" >
            <!-- PAGE CONTENT BEGINS -->
            <div class="clearfix form-actions">
                <div class="col-md-offset-5" style="font-size: 24px">
                    入  库  单 (单号：${data.code})
                </div>
            </div>
            <form id="add_input_info" class="form-horizontal" houseType="form" action="/input/modify" method="post">
                <input type="hidden" name="id" value="${data.id}"/>
                <input type="hidden" id="senderId" value="${data.send_person_id}"/>
                <input type="hidden" id="accepterId" value="${data.accept_person_id}"/>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">项目工程名</label>
                    <div class="col-sm-2">
                        <input type="text" id="project_name" class="col-xs-12" name="project_name" value="${data.project_name}" maxlength="50"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">供货单位</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="merchant_id" onchange="getSender()">
                            <#list providers as provide>
                                <option value="${provide.id}" <#if provide.id==data.merchant_id>selected</#if>>${provide.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">物品名称</label>
                    <div class="col-sm-2">
                        <select class="width-95 chosen-select" id="material" data-placeholder="请选择..." name="material_id" onchange="getUnit()">
                            <#list materials as mat>
                                <option value="${mat.id}" <#if mat.id==data.material_id>selected</#if>>${mat.name}</option>
                            </#list>
                        </select>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">数量</label>
                    <div class="col-sm-2">
                        <input type="text" id="count" class="col-xs-11" name="count" value="${data.count}" maxlength="10" datatype="s2-20" nullmsg="请输入数量"/>
                        <label id="unit">${data.unit}</label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人</label>
                    <div class="col-sm-2" id="senderDiv"></div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货人</label>
                    <div class="col-sm-2" id="accepterDiv">
                        <select class="width-95 chosen-select" data-placeholder="请选择..." name="accept_person_id">
                            <#list staffs as ac>
                                <option value="${ac.id}" <#if ac.id==data.accept_person_id>selected</#if> >${ac.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">所入仓库</label>
                    <div class="col-sm-2">
                        <input type="text" id="structure" class="col-xs-12" name="warehouse" value="${data.warehouse}" maxlength="50" nullmsg="请输入户型结构" datatype="s"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输人</label>
                    <div class="col-sm-2">
                        <input type="text" id="transport_person" class="col-xs-12" name="transport_person" value="${data.transport_person}" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">司机车号</label>
                    <div class="col-sm-2">
                        <input type="text" id="car_num"  class="col-xs-12" name="car_num" value="${data.car_num}" maxlength="20"/>
                    </div>

                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">过磅人</label>
                    <div class="col-sm-2">
                        <input type="text" id="weigh_person"  class="col-xs-12" name="weigh_person" value="${data.weigh_person}" maxlength="20"/>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内">${data.remark}</textarea>
                    </div>
                </div>
                <div class="clearfix form-actions">
                    <div class="col-md-offset-5 col-md-12">
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

        // 验证插件
        $("#add_input_info").validity(function(){
            $("#count").require("请输入价格").match("number");
        });
        getSender();
        getUnit();
    })

    function getSender(){
        var id = $("#provideMerchant").val();
        var senderId = $("#senderId").val();
        $.ajax({
            url:'/input/getSendPersons',
            type:'get',
            data:{merchantId:id},
            success:function(json){
                var data = json.data;
                $("#senderDiv").empty();
                var html = '<select class="width-95 chosen-select" data-placeholder="请选择..." name="send_person_id">'
                for(var i=0; i<data.length; i++) {
                    if(data[i].id==senderId){
                        html += "<option selected value="+data[i].id+">"+data[i].name+"</option>";
                    }else {
                        html += "<option value="+data[i].id+">"+data[i].name+"</option>";
                    }
                }
                html += "</select>"
                $("#senderDiv").append(html);
                $(".chosen-select").chosen();
            }
        });
    }

    function getUnit(){
        var id = $("#material").val();
        $.ajax({
            url:'/input/getUnit',
            type:'get',
            data:{material:id},
            success:function(json){
                $("#unit").html("").html(json);
            }
        });
    }

</script>

</@we.html>