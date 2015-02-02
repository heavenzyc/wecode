<#import "/WEB-INF/views/common/include.ftl" as we/>
<#import "/WEB-INF/views/common/include/admin_paginate.ftl" as admin/>
<@we.html css=["${csspath}/chosen.css",
"/assets/css/uploadify.css",
"/assets/css/jquery.Jcrop.css",
"/assets/css/jquery.fancybox.css",
"${jspath}/jquery.validity/jquery.validity.css",
"${jspath}/qTip2/jquery.qtip.min.css"]
js=["/assets/js/My97DatePicker/WdatePicker.js",
"${jspath}/chosen.jquery.min.js",
"/assets/js/common.js",
"/assets/js/jquery.fancybox.min.js",
"/assets/js/jquery.uploadify.js",
"/assets/js/jquery.Jcrop.min.js",
"/assets/js/ueditor/ueditor.config.js",
"/assets/js/ueditor/ueditor.all.min.js",
"/assets/js/uploadavatar.js",
"/assets/js/upload.config.js",
"/assets/js/validform.min.js",
"/assets/js/ace-elements.min.js",
"/assets/js/ace.min.js",
"${jspath}/jquery.validity/jquery.validity.js",
"${jspath}/qTip2/jquery.qtip.min.js",
"${jspath}/jquery.validity/jquery.validity.extend.js"]>

<@we.breadcrumb current="添加礼品"/>
<div class="page-content">
    <div class="row">
        <div class="col-sm-12 col-md-8" >
            <!-- PAGE CONTENT BEGINS -->

            <form id="add_gift" class="form-horizontal" giftExchangeRule="form" action="${path}/admin/active/gift_exchange_rule/save" method="post">

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">礼品名称</label>

                    <div class="col-sm-10">
                        <input type="text" id="gift_name" placeholder="礼品名称" class="col-xs-10 col-sm-5" name="name"/>
                        <span class="help-inline col-xs-10 col-sm-5">
                            <span class="middle"><input type="checkbox" name="is_house_coupon" value="1"/>是否用于抵扣房款</span>
                        </span>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">礼品列表图</label>
                    <div class="col-sm-10">
                        <div id="list_pic_uplaod" class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="180*180" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <div class="nopic-box">
                                <input id="gift_list_pic" class="picvalue" name="list_pic" type="hidden" value=""
                                       data-error-target="#list_pic_uplaod" data-error-pos-my="center left" data-error-pos-at="center right">
                                <label class="file-label" data-title="上传列表图">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">礼品图片</label>
                    <div class="col-sm-10">
                        <div id="pic_uplaod" class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="true" data-crop-size="320*150" data-config-code="201406091600" data-config-maxsize="10200000" data-config-type=".jpg|.bmp|.png">
                            <div class="nopic-box">
                                <input id="gift_pic" class="picvalue" name="top_pic" type="hidden" value=""
                                       data-error-target="#pic_uplaod" data-error-pos-my="center left" data-error-pos-at="center right">
                                <label class="file-label" data-title="上传礼品图片">
                                    <span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">礼品数量</label>

                    <div class="col-sm-10">
                        <input type="text" id="gift_count" placeholder="礼品数量" class="col-xs-10 col-sm-5" name="stockCount"/>
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">兑换条件</label>
                    <div class="col-sm-10">
                        <input type="text" id="gift_price" placeholder="兑换条件" class="col-xs-10 col-sm-5" name="gift_price"/>
                        <span class="help-inline col-xs-12 col-sm-7"><span class="middle">${kit.dictValue(current_project.id,'point_name')}</span></span>
                    </div>
                </div>

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">每日限兑换数量</label>

                    <div class="col-sm-10">
                        <input type="text" id="limit_count" placeholder="每日限兑换数量" class="col-xs-10 col-sm-5" name="limitCount"/>
                    </div>
                </div>
                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">活动时间</label>
                    <div class="col-sm-10">
                        <input type="text" style="width:150px;" id="beginDate" name="beginDateString"
                               onclick="WdatePicker({startDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'endDate\')}',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="easyui-validatebox  Wdate"  data-options="required:true"/>&nbsp;至&nbsp;
                        <input type="text" style="width:150px;" id="endDate" name="endDateString"
                               onclick="WdatePicker({startDate:'%y-%M-%d',minDate:'#F{$dp.$D(\'beginDate\')}',dateFmt:'yyyy-MM-dd',alwaysUseStartDate:true})" class="easyui-validatebox  Wdate" data-options="required:true"  />
                    </div>
                </div>
               <#-- <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">有效天数</label>
                    <div class="col-sm-10">
                        <input type="number" id="form-field-name" placeholder="有效天数" class="col-xs-10 col-sm-5" name="activeDays"/>天
                    </div>
                </div>-->

                <div class="form-group"  data-rel="Js_preview_des">
                    <label class="col-sm-2 control-label no-padding-right" for="form-field-1">详细说明</label>
                    <div class="col-sm-10">
                        <textarea cols="45" rows="5" name="remark" placeholder="200字以内"></textarea>
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
        <div class="col-sm-12 col-md-4">
            <!-- PAGE CONTENT BEGINS -->
            <div class="phone-preview">
                <div class="preview-content Js_preview">
                    <div class="preview-wrap">
                        <div class="Js_preview_toppic"></div>
                        <div class="Js_preview_des"></div>
                    </div>
                </div>
            </div>
        <#-- <div class="space-12"></div>-->
            <!-- PAGE CONTENT ENDS -->
        </div>
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script type="text/javascript">
	jQuery(function($){
		uploadPic().init();

        $("#add_gift").validity(function(){
            $("#gift_name").require("请输入礼品名称");
            $("#gift_pic").require("请上传礼品图片");
            $("#gift_list_pic").require("请上传礼品列表图");
            $("#gift_count").require("请输入礼品数量").match("integer");
            // $("#condition").require("请输入兑换条件").match("integer");
            $("#gift_price").require("请输入兑换条件").match("integer");
            $("#limit_count").match("integer");
        });
	});
</script>

</@we.html>