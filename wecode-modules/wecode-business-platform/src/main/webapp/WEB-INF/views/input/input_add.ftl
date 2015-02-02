<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>

<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="add_house_type_form" class="form-horizontal" houseType="form" action="/input/save" method="post">
                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">项目工程名</label>

                    <div class="col-sm-10">
                        <input type="text" id="project_name" class="col-xs-10 col-sm-5" name="project_name" maxlength="20"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">供货单位</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="provideMerchant" data-placeholder="请选择..." name="provide_merchant_code" onchange="getSender()">
                            <#list providers as provide>
                                <option value="${provide.code}">${provide.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">物品名称</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="material" data-placeholder="请选择..." name="material_code" onchange="getUnit()">
                            <#list materials as mat>
                                <option value="${mat.code}">${mat.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">数量</label>
                    <div class="col-sm-10">
                        <input type="text" id="count" class="col-xs-10 col-sm-5" name="count" maxlength="20" datatype="s2-20" nullmsg="请输入数量"/>
                        <label id="unit"></label>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">发货人</label>
                    <div class="col-sm-10" id="senderDiv"></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货单位</label>
                    <div class="col-sm-10">
                        <select class="width-40 chosen-select" id="acceptMerchant" data-placeholder="请选择..." name="accept_merchant_code" onchange="getAccepter()">
                            <#list accepts as ac>
                                <option value="${ac.code}">${ac.name}</option>
                            </#list>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">收货人</label>
                    <div class="col-sm-10" id="accepterDiv">
                    </div>
                </div>

                <div class="form-group"  >
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">所入仓库</label>

                    <div class="col-sm-10">
                        <input type="text" id="structure" class="col-xs-10 col-sm-5" name="warehouse" maxlength="20" nullmsg="请输入户型结构" datatype="s"/>
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
        /*$("#add_house_type_form").validity(function(){
            var content = editor.getContent();
            $("#description").val(content);
        //    $("#list_pic").require("请上传列表图");
            $("#top_pic").require("请上传顶部图");
            $("#house_type_name").require("请输入户型名称");
            $("#area").require("请输入建筑面积");
            // $("#gift_area").match("number");
            $("#structure").require("请输入户型解析");
            $("#price").require("请输入价格");
        });
*/
        getSender();
        getUnit();
        getAccepter();
    })

    function getSender(){
        var code = $("#provideMerchant").val();
        $.ajax({
            url:'/input/getSendPersons',
            type:'get',
            data:{merchantCode:code},
            success:function(json){
                var data = json.data;
                $("#senderDiv").empty();
                var html = '<select class="width-40 chosen-select" data-placeholder="请选择..." name="send_person_code">'
                for(var i=0; i<data.length; i++) {
                    html += "<option value="+data[i].code+">"+data[i].name+"</option>";
                }
                html += "</select>"
                $("#senderDiv").append(html);
                $(".chosen-select").chosen();
            }
        });
    }

    function getAccepter(){
        var code = $("#acceptMerchant").val();
        $.ajax({
            url:'/input/getAcceptPersons',
            type:'get',
            data:{merchantCode:code},
            success:function(json){
                var data = json.data;
                $("#accepterDiv").empty();
                var html = '<select class="width-40 chosen-select" data-placeholder="请选择..." name="accept_person_code">'
                for(var i=0; i<data.length; i++) {
                    html += "<option value="+data[i].code+">"+data[i].name+"</option>";
                }
                html += "</select>"
                $("#accepterDiv").append(html);
                $(".chosen-select").chosen();
            }
        });
    }

    function getUnit(){
        var code = $("#material").val();
        $.ajax({
            url:'/input/getUnit',
            type:'get',
            data:{material:code},
            success:function(json){
                $("#unit").html("").html(json);
            }
        });
    }

</script>

</@we.html>