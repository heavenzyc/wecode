<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/chosen.css",
"${jspath}/jquery.validity/jquery.validity.css",
"${jspath}/qTip2/jquery.qtip.min.css"]
js=["${jspath}/chosen.jquery.min.js",
"${jspath}/jquery.validity/jquery.validity.js",
"${jspath}/qTip2/jquery.qtip.min.js",
"${jspath}/jquery.validity/jquery.validity.extend.js"]>

<@we.breadcrumb current="积分名称设置"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <div class="space-12"></div>

            <form id="point_form" class="form-horizontal" signRule="form" >
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">系统默认：</label>
                    <label class="col-sm-2" for="form-field-1">${sysDict_point_name}</label>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">配置名称：</label>

                    <div class="col-sm-10">
                        <input type="text" id="point_name"
                               class="col-xs-10 col-sm-5" name="point_name" value="${point_name.dict_value}" maxlength="8" />
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

    function saveRule(){
        $.validity.start();
        $("#point_name").require("请填写配置名称");
        var result = $.validity.end().valid;
        if(result == false){
            return false;
        }
        var data = $("#point_form").serialize();
        $.ajax({
            url:'/admin/project/common_dict/pointDict',
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