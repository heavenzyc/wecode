<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->
            <div class="clearfix form-actions">
                <div class="col-md-offset-2 col-md-9" style="font-size: 24px">
                    出  库  单
                </div>
            </div>
            <form id="add_output_info" class="form-horizontal" houseType="form" action="/output/save" method="post">
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">项目工程名</label>

                    <div class="col-sm-10">
                        <input type="text" id="project_name" class="col-xs-10 col-sm-5" name="project_name" maxlength="50"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货单位</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="merchant_id" onchange="getSender()">
                            <#list providers as provide>
                                <option value="${provide.id}">${provide.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">物品名称</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="material" data-placeholder="请选择..." name="material_id" onchange="getUnit()">
                            <#list materials as mat>
                                <option value="${mat.id}">${mat.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">数量</label>
                    <div class="col-sm-10">
                        <input type="text" id="count" class="col-xs-10 col-sm-5" name="count" maxlength="10" datatype="s2-20" />
                        <label id="unit"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货人</label>
                    <div class="col-sm-10" id="senderDiv"></div>
                </div>
            <#--<div class="form-group">
                <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货单位</label>
                <div class="col-sm-10">
                    <select class="width-40 chosen-select" id="acceptMerchant" data-placeholder="请选择..." name="accept_merchant_code" onchange="getAccepter()">
                        <#list accepts as ac>
                            <option value="${ac.code}">${ac.name}</option>
                        </#list>
                    </select>
                </div>
            </div>-->
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人</label>
                    <div class="col-sm-10" id="accepterDiv">
                        <select class="width-40 chosen-select" data-placeholder="请选择..." name="accept_person_id">
                            <#list staffs as ac>
                                <option value="${ac.id}">${ac.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">所出仓库</label>

                    <div class="col-sm-10">
                        <input type="text" id="structure" class="col-xs-10 col-sm-5" name="warehouse" maxlength="50"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">运输人</label>

                    <div class="col-sm-10">
                        <input type="text" id="transport_person" class="col-xs-10 col-sm-5" name="transport_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">司机车号</label>

                    <div class="col-sm-10">
                        <input type="text" id="car_num"  class="col-xs-10 col-sm-5" name="car_num" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">过磅人</label>

                    <div class="col-sm-10">
                        <input type="text" id="weigh_person"  class="col-xs-10 col-sm-5" name="weigh_person" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">备注</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="500字以内"></textarea>
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

        // 验证插件
        $("#add_output_info").validity(function(){
            $("#count").require("请输入价格").match("number");
        });
        getSender();
        getUnit();
    })

    function getSender(){
        var id = $("#provideMerchant").val();
        $.ajax({
            url:'/output/getSendPersons',
            type:'get',
            data:{merchantId:id},
            success:function(json){
                var data = json.data;
                $("#senderDiv").empty();
                var html = '<select class="width-40 chosen-select" data-placeholder="请选择..." name="send_person_id">'
                for(var i=0; i<data.length; i++) {
                    html += "<option value="+data[i].id+">"+data[i].name+"</option>";
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
            url:'/output/getUnit',
            type:'get',
            data:{material:id},
            success:function(json){
                $("#unit").html("").html(json);
            }
        });
    }

</script>

</@we.html>