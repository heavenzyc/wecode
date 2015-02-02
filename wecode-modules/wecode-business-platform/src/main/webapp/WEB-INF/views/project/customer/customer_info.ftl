<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css","${csspath}/ui.jqgrid.css"]
js=["${jspath}/date-time/bootstrap-datepicker.min.js",
"${jspath}/jqGrid/jquery.jqGrid.min.js",
"${jspath}/jqGrid/i18n/grid.locale-cn.js",
"${jspath}/project/customer/customer.js"]>
<@we.breadcrumb current="客户详情"/>
<div class="page-content">
    <div class="row">
        <div class="col-xs-12">
            <!-- PAGE CONTENT BEGINS -->

            <div class="space-12"></div>
            <div id="user-profile-1" class="user-profile row">
                <div class="col-xs-12 col-sm-3">
                    <div>
                        <span class="profile-picture">
                           <#if (customer.getCustomerHeadImg())?? >
                               <img id="avatar" class="editable img-responsive editable-click editable-empty" style="width:100px; height:100px "
                                    alt="Alex's Avatar" src="${customer.getCustomerHeadImg()}" />
                           <#else >
                               <img id="avatar" class="editable img-responsive editable-click editable-empty" style="width:100px; height:100px "
                                    alt="Alex's Avatar" src="/assets/images/webwxgeticon.png" />
                           </#if>
                        </span>

                        <div class="space-4"></div>
                        <span class="label label-xlg label-purple arrowed-in-right">${customer.name}</span>
                    </div>
                </div>
            </div>
            <div class="space-12"></div>
            <ul class="nav nav-pills" style="margin-left:0">
                <li id="task" class="active">
                    <a href="javascript:showTaskTable()">参与活动任务记录</a>
                </li>
                <li id="gold">
                    <a href="javascript:showGoldTable()">${kit.dictValue(current_project.id,'point_name')}获取与使用记录</a>
                </li>
            </ul>
            <div class="space-12"></div>
            <div class="table-responsive table-task">
                    <table id="task-grid-table"></table>
                    <div id="task-grid-pager"></div>
                    <script type="text/javascript">
                        var $path_base = "/";
                    </script>
            </div>

            <div class="table-responsive table-gold hidden">
                <table id="gold-grid-table"></table>
                <div id="gold-grid-pager"></div>
                <script type="text/javascript">
                    var $path_base = "/";
                </script>
            </div>


            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</div><!-- /.page-content -->

<script>
    taskInfo(${customer.id});
    function showTaskTable(){
        $("#task").addClass("active");
        $("#gold").removeClass("active");
        $(".table-task").removeClass("hidden");
        $(".table-gold").addClass("hidden");
    }

    function showGoldTable(){
        $("#task").removeClass("active");
        $("#gold").addClass("active");
        $(".table-task").addClass("hidden");
        $(".table-gold").removeClass("hidden");
        goldChangeRecord(${customer.id});
    }
</script>
</@we.html>