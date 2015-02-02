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
        <div class="col-xs-12" >
            <ul class="nav nav-pills" style="margin-left:0">
                <li>
                    <a href="/admin/active/regular_task/sign">每日签到</a>
                </li>
                <li class="active">
                    <a href="javascript:void(0)">呼朋唤友</a>
                </li>
                <li>
                    <a href="/admin/active/regular_task/attention">关注公众账号</a>
                </li>
            </ul>
            <div class="space-12"></div>
            <!-- PAGE CONTENT BEGINS -->

            <form id="add_invite_rule_form" class="form-horizontal" signRule="form" action="${path}/admin/active/regular_task/invite/modify" method="post">

                <div class="space-8"></div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">任务名称：</label>
                    <label class="col-sm-9" >呼朋唤友</label>
                </div>
                <div class="space-4"></div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">任务说明：</label>
                    <label class="col-sm-9" >邀请好友一起关注楼盘，参与找${kit.dictValue(current_project.id,'point_name')}动。</label>
                </div>
                <div class="space-4"></div>


                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right">任务奖励：</label>
                    <label class="col-sm-9">每邀请一名朋友关注楼盘公众账号</label>
                </div>
                <div class="space-4"></div>

                <div class="form-group no-margin-bottom">
                    <label class="col-sm-3 control-label no-padding-right"></label>
                    <div class="col-sm-9">
                        <div class="well col-sm-8 no-padding-left no-margin-bottom">
                            <div>
                                <label class="col-sm-4 control-label no-padding-right no-padding-left text-left">邀请者获得${kit.dictValue(current_project.id,'point_name')}：</label>
                                <input type="text" id="attention_inviter_award"
                                       class="col-xs-10 col-sm-5" name="attention_inviter_award" value="${data.attention_inviter_award}" maxlength="10" />                            </div>
                            <div class="space-4 clear"></div>
                            <div>
                                <label class="col-sm-4 control-label no-padding-right text-left">被邀请者获得${kit.dictValue(current_project.id,'point_name')}：</label>
                                <input type="text" id="attention_invitee_award"
                                       class="col-xs-10 col-sm-5" name="attention_invitee_award" value="${data.attention_invitee_award}" maxlength="10" />                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>

                <div class="form-group">
                    <label class="col-sm-3 control-label no-padding-right"></label>
                    <label class="col-sm-9">每邀请一名朋友成为意向购房者</label>
                </div>
                <div class="space-4"></div>

                <div class="form-group no-margin-bottom">
                    <label class="col-sm-3 control-label no-padding-right"></label>
                    <div class="col-sm-9">
                        <div class="well col-sm-8 no-padding-left no-margin-bottom">
                            <div>
                                <label class="col-sm-4 control-label no-padding-right no-padding-left text-left">邀请者获得${kit.dictValue(current_project.id,'point_name')}：</label>
                                <input type="text" id="intention_inviter_award"
                                       class="col-xs-10 col-sm-5" name="intention_inviter_award" value="${data.intention_inviter_award}" maxlength="10" />
                            </div>
                            <div class="space-4 clear"></div>
                            <div>
                                <label class="col-sm-4 control-label no-padding-right text-left">被邀请者获得${kit.dictValue(current_project.id,'point_name')}：</label>
                                <input type="text" id="intention_invitee_award"
                                       class="col-xs-10 col-sm-5" name="intention_invitee_award" value="${data.intention_invitee_award}" maxlength="10" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="space-4"></div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">最高可获${kit.dictValue(current_project.id,'point_name')}：</label>

                    <div class="col-sm-9">
                        <input type="text" id="max_gold"
                               class="col-xs-10 col-sm-5" name="max_gold" value="${data.max_gold}" maxlength="10" />
                        <span class="help-inline col-xs-12 col-sm-7"><span class="middle">为防止客户恶意刷取${kit.dictValue(current_project.id,'point_name')}，单个客户最高可获${kit.dictValue(current_project.id,'point_name')}</span></span>

                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">分享标题：</label>

                    <div class="col-sm-9">
                        <input type="text" id="share_title"
                               class="col-xs-10 col-sm-5" name="share_title" value="${data.share_title}" maxlength="50" />
                        <span class="help-inline col-xs-12 col-sm-7"><span class="middle">用户参与“呼朋唤友”活动，分享到微信朋友圈或分享给朋友时的内容标题</span></span>

                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">跳转公众平台链接：</label>

                    <div class="col-sm-9">
                        <input type="text" id="share_title"
                               class="col-xs-12 col-sm-6" name="redirect_url" value="${data.redirect_url}" maxlength="1000" />
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
    $(function(){
        // 验证插件
        $("#add_invite_rule_form").validity(function(){
            $("#attention_inviter_award").match("integer");
            $("#attention_invitee_award").match("integer");
            $("#intention_inviter_award").match("integer");
            $("#intention_invitee_award").match("integer");
            $("#max_gold").match("integer");
            $("#share_title").require("请填写分享标题");
        });
    });

    function saveRule(){
        $.validity.start();
        $("#attention_inviter_award").match("integer");
        $("#attention_invitee_award").match("integer");
        $("#intention_inviter_award").match("integer");
        $("#intention_invitee_award").match("integer");
        $("#max_gold").match("integer");
        $("#share_title").require("请填写分享标题");
        var result = $.validity.end().valid;
        if(result == false){
            return false;
        }
        var data = $("#add_invite_rule_form").serialize();
        $.ajax({
            url:'/admin/active/regular_task/invite/modify',
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

</script>

</@we.html>