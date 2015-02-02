<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html css=[] js=["${jspath}/project/consultant/consultant.js"]>
<@we.breadcrumb/>
<div class="page-content">
    <div class="page-header">
        <div class="col-xs-2" >
            <a class="btn no-border btn-primary pull-left" href="${path}/admin/project/consultant/add_consultant">添加置业顾问</a>
        </div>
    </div>

<div class="row">
    <div class="col-xs-12">

    <!-- PAGE CONTENT BEGINS -->
    <div class="col-xs-7">
    <#list consultants as consultant>
    <div class="timeline-item y-list clearfix" data-option="${consultant.id}">
        <div class="timeline-info">
            <img alt="Susan't Avatar" src="${kit.url('COMMON',consultant.pic_url)}">
        </div>
        <div class="widget-box transparent">
            <div class="widget-header widget-header-small">
                <h5 class="smaller">
                    <span href="javascript:void(0);" class="blue" >${consultant.name}</span>
                </h5>
                <span class="widget-toolbar">
                    <a href="javascript:void(0);" onclick="moveUp(this,${consultant.id})"  title="上移">
                        <i class="icon-chevron-up"></i>
                    </a>
                    <a href="javascript:void(0);" onclick="moveDown(this,${consultant.id})"  title="下移">
                        <i class="icon-chevron-down"></i>
                    </a>
                    <#if consultant_index == 0 && (page.pageNumber == 1)>
                        <a href="javascript:void(0)"  title="置顶"><i class="icon-arrow-up"></i></a>

                    <#else >
                        <a href="/admin/project/consultant/move_top?id=${consultant.id}"  title="置顶">
                            <i class="icon-arrow-up"></i>
                        </a>
                    </#if>
                </span>
            </div>
            <div class="widget-body">
                <div class="widget-body-inner">
                    <div class="widget-main">
                        <p><label><b>电话：</b></label>${consultant.tel}</p>
                        <#--<p><label><b>登录账号：</b></label>Zhee1588</p>
                        <p><label><b>性别：</b></label>女</p>-->
                        <p><label><b>说明：</b></label>${consultant.intro}</p>
                        <div class="space-6"></div>
                        <div class="widget-toolbox clearfix">
                            <div class="pull-right action-buttons">
                                <#--<a href="#" title="重置密码">
                                    <i class="icon-lock green bigger-130"></i>
                                </a>-->
                                <a href="/admin/project/consultant/edit_consultant?id=${consultant.id}&curPage=${page.pageNumber}" title="编辑">
                                    <i class="icon-pencil blue bigger-125"></i>
                                </a>
                                <a href="/admin/project/consultant/delete_consultant?id=${consultant.id}&curPage=${page.pageNumber}&count=${consultants?size}" title="删除">
                                    <i class="icon-remove red bigger-125"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </#list>
    <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/project/consultant/" />
</div>

<div class="col-xs-12 col-sm-5">
    <div class="phone-preview pull-right">
        <div class="preview-content Js_preview">
            <ul class="pic-list">
                <#list consultants as consultant>
                <li>
                    <div class="con">
                        <a href="预约看房2.html">
                            <img src="${kit.url('COMMON',consultant.pic_url)}" alt="">
                        </a>
                        <p class="info">姓名：${consultant.name}</p>
                        <p class="info">电话：<a href="" class="blue">${consultant.tel}</a></p>
                    </div>
                </li>
                </#list>
            </ul>
        </div>
    </div>
</div>


<#--<div class="col-xs-5">
    <div class="widget-box">
        <div class="widget-header">
            <h4>是否开启微信回复命令</h4>
            <div class="widget-toolbar">
                <a href="#" data-action="collapse">
                    <i class="icon-chevron-up"></i>
                </a>

                <a href="#" data-action="close">
                    <i class="icon-remove"></i>
                </a>
            </div>
            <div class="pull-right openfill">
                <label class="Js_open_wx_repeat">
                    <input name="switch-field-1" class="ace ace-switch" type="checkbox">
                    <span class="lbl"></span>
                </label>
            </div>
        </div>

        <div class="widget-body">
            <div class="widget-main no-padding">
                <form>
                    <fieldset>
                        <div>
                            <label for="form-field-8">微信用户获取该内容的命令：</label>

                            <textarea class="form-control" id="" placeholder=""></textarea>
                        </div>
                        <div class="space-6"></div>
                        <div>
                            <label for="form-field-9">微信命令设置：</label>

                            <textarea class="form-control limited" id="" maxlength="50"></textarea>
                        </div>
                        <div class="space-6"></div>
                        <div class="ace-file-input ace-file-multiple pointer pull-left Js_upload_pics" data-crop="false">
                            <div class="nopic-box">
                                <input class="picvalue" name="pic" type="hidden" value="">
                                <label class="file-label" data-title="上传图片">
																	<span class="file-name" data-title="No File ..."> <i class="icon-cloud-upload"></i>
																	</span>
                                </label>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div>
                            <textarea id="form-field-11" class="autosize-transition form-control" style="overflow: hidden; word-wrap: break-word; resize: horizontal; height: 52px;"></textarea>
                        </div>
                    </fieldset>
                    <div class="form-actions center">
                        <button type="button" class="btn btn-primary">
                            保存
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>-->

<!-- PAGE CONTENT ENDS -->
</div><!-- /.col -->
</div><!-- /.row -->
</div><!-- /.page-content -->
</@we.html>