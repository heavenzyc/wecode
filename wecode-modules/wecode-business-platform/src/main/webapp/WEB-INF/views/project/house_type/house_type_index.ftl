<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=[] js=[]>
    <@we.breadcrumb/>
<div class="page-content">

    <div class="row">
        <div class="col-xs-12">
            <div>
                <a href="/admin/project/house_type/add_house_type" class="btn btn-primary Js_create_album">添加户型</a>
            </div>

            <div class="space-12"></div>
            <div class="col-xs-12 col-sm-6">
                <#list houseTypeList as houseType>
                <div class="col-xs-6">
                    <div class="timeline-item s-list clearfix">
                        <div class="widget-box ad-box transparent">
                            <div class="widget-body">
                                <div class="widget-body-inner clearfix">
                                    <div class="widget-main">
                                        <div class="ad-pic"><img src="${kit.url('COMMON',houseType.top_pic_url)}" alt=""></div>
                                        <div class="space-6"></div>
                                        <div>${houseType.name}</div>
                                        <div>${houseType.structure}</div>
                                        <div>${houseType.price}</div>
                                        <div class="color-orange">${houseType.area}</div>
                                        <div class="space-6"></div>
                                        <div class="widget-toolbox clearfix">
                                            <div class="pull-right action-buttons">
                                                <a href="/admin/project/house_type/edit_house_type?id=${houseType.id}&curPage=${page.pageNumber}" title="编辑">
                                                    <i class="icon-pencil blue bigger-125"></i>
                                                </a>
                                                <a href="/admin/project/house_type/delete_house_type/?id=${houseType.id}&curPage=${page.pageNumber}&itemCount=${houseTypeList?size}" title="删除">
                                                    <i class="icon-remove red bigger-125"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                </#list>
                <div class="clearfix"></div>
                <@we.paginate currentPage=page.pageNumber totalPage=page.totalPage actionUrl="/admin/project/house_type/" />
            </div>


            <div class="col-xs-12 col-sm-6">
                <div class="phone-preview pull-right">
                    <div class="preview-content Js_preview">
                        <ul class="picture-list">
                            <#list houseTypeList as houseType>
                            <li>
                                <div class="thumb"><img src="${kit.url('COMMON',houseType.top_pic_url)}" alt=""></div>
                                <div class="con">
                                    <p class="title">${houseType.name}</p>
                                    <p class="text">户型：${houseType.structure}</p>
                                    <p class="text">建筑面积：${houseType.area}</p>
                                    <p class="text">总价：${houseType.price}</p>
                                </div>
                            </li>
                            </#list>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->
<script>
    $(function(){
        $()
    })
</script>

</@we.html>