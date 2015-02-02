<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css",
"${jspath}/jquery.validity/jquery.validity.css",
"${jspath}/qTip2/jquery.qtip.min.css"]
js=["${jspath}/chosen.jquery.min.js",
"${jspath}/jquery.validity/jquery.validity.js",
"${jspath}/qTip2/jquery.qtip.min.js",
"${jspath}/jquery.validity/jquery.validity.extend.js"]>

<@we.breadcrumb current="任务设置"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <ul class="nav nav-pills" style="margin-left:0">
                <li class="active">
                    <a href="javascript:void(0)">签到设置</a>
                </li>
                <li>
                    <a href="/admin/active/regular_task/invite">呼朋唤友</a>
                </li>
                <li>
                    <a href="/admin/active/regular_task/attention">关注公众账号</a>
                </li>
            </ul>
            <div class="space-12"></div>
            <!-- PAGE CONTENT BEGINS -->

            <form id="add_sign_rule_form" class="form-horizontal" signRule="form" action="${path}/admin/active/regular_task/sign/modify" method="post">

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">循环周期</label>

                    <div class="col-sm-10">
                        <input type="text" id="cycle" onblur="sumMoney()"
                               class="col-xs-10 col-sm-5" name="cycle" value="${data.cycle}" maxlength="10"/>天/周期
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">初始金币</label>

                    <div class="col-sm-10">
                        <input type="text" id="gold_base" onblur="sumMoney()"
                               class="col-xs-10 col-sm-5" name="goleBase" value="${data.gole_base}" maxlength="10" />${kit.dictValue(current_project.id,'point_name')}
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">每日递增</label>

                    <div class="col-sm-10">
                        <input type="text" id="increase" onblur="sumMoney()"
                               class="col-xs-10 col-sm-5" name="increase" value="${data.increase}" maxlength="10" />${kit.dictValue(current_project.id,'point_name')}
                        <label style="color: red; font-size: 10px">连续签到一个周期领取${kit.dictValue(current_project.id,'point_name')}：<label style="font-size: 18px" id="sum">0</label></label>
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">奖励刮奖</label>

                    <div class="col-sm-10">
                        <input type="text" id="lottery_count"
                               class="col-xs-10 col-sm-5" name="lotteryCount" value="${data.lottery_count}"  maxlength="5" />次
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">签到说明</label>

                    <div class="col-sm-10">
                        <textarea name="remark" maxlength="200" cols="40" rows="5" placeholder="200字以内">${data.remark}</textarea>
                    </div>
                </div>

                <div class="clearfix form-actions">
                    <div class="col-md-offset-2 col-md-9">
                        <button class="btn btn-info" type="button" onclick="saveRule()">
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
    /*$(function(){
        // 验证插件
        $("#add_sign_rule_form").validity(function(){
            $("#cycle").match("integer");
            $("#gold_base").match("integer");
            $("#increase").match("integer");
            $("#lottery_count").match("integer");
        });
    });*/

    function saveRule(){
        $.validity.start();
        $("#cycle").match("integer");
        $("#gold_base").match("integer");
        $("#increase").match("integer");
        $("#lottery_count").match("integer");
        var result = $.validity.end().valid;
        if(result == false){
            return false;
        }
        var data = $("#add_sign_rule_form").serialize();
        $.ajax({
            url:'/admin/active/regular_task/sign/modify',
            asnyc:'false',
            type:'post',
            data:data,
            success:function(json){
                if(json.success){
                    completeTips();
                }
            }
        });
    }

    function completeTips(){
        $.gritter.add({
            title : '信息提示',
            time : 1000,
            text : '保存成功！',
            class_name : 'gritter-info gritter-center '
        });
    }

    $(function(){
        sumMoney();
    });

    function sumMoney(){
        var cycle = $("#cycle").val();
        var goldBase = $("#gold_base").val();
        var increase = $("#increase").val();
        var sumIncrease = 0;
        for (var i = 0 ; i<cycle; i++){
            sumIncrease += increase * i;
        }
        var sum = cycle * goldBase + sumIncrease;
        $("#sum").html("").html(sum);
    }

</script>

</@we.html>