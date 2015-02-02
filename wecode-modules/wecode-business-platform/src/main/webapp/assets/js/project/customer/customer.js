/**
 * Created by heaven.zyc on 14-6-4.
 */

function attentionList(){
    var pager_selector = "#grid-pager";
    var table = $("#grid-table");
    table.jqGrid({
        url : "/admin/project/customer/list",
        datatype : "json",
        mtype : 'get',
        height : 380,
        scrollOffset:1,
        //    caption:'关注客户',
        rownumbers: true,
        colModel :
            [
                {name : 'id',index : 'id',hidden : true,width :0,editable : false,sortable:false},
                {name : 'open_id',label:'OPEN ID',hidden : true,align:'center',index :'open_id',sortable:false,width :10,sorttype : "int",editable : false},
                {name : 'customer_name',index : 'customer_name',align:'center',label:'昵称',sortable:false,width :10,editable : false,
                    formatter:function(value){
                        return value==null?'':value;
                    }
                },
                {name : 'source',index : 'source',label:'用户来源',align:'center',width :10,sortable:false,editable : false},
                {name : 'create_time',index :'create_time',label:'关注时间',align:'center', sortable:false,width : 10,editable : false}
            ],
        viewrecords : true,
        rowNum : 10,
        rowList : [10, 20, 30],
        pager : pager_selector,
        altRows : true,
        autowidth:true,
        multiselect : false,
        multiboxonly : false,
        loadComplete : function(data) {

            var table = this;
            setTimeout(function() {
                //styleCheckbox(table);
                updateActionIcons(table);
                updatePagerIcons(table);
                enableTooltips(table);

            }, 0);
        }
    });
}

function intentionList(){
    var lab = $("#lab").val();
    var pager_selector = "#grid-pager";
    var table = $("#grid-table");
    table.jqGrid({
        url : "/admin/project/customer/intentionList",
        datatype : "json",
        mtype : 'get',
        height : 380,
        scrollOffset:1,
        //    caption:'关注客户',
        rownumbers: true,
        viewrecords : true,
        rowNum : 10,
        rowList : [10, 20, 30],
        pager : pager_selector,
        altRows : true,
        autowidth:false,
        multiselect : false,
        multiboxonly : false,
        colModel :
            [
                {name : 'id',index : 'id',hidden : true,width :0,sortable:false,sorttype : "int",editable : false},
                {name : 'open_id',label:'OPEN ID',index :'open_id',hidden : true,align:'center',width :50,sortable:false,sorttype : "int",editable : false,
                    formatter:function(value,options,rData){
                        return '<a href="/admin/project/customer/info/'+rData.id+'">'+value+'</a>';
                    }
                },
                {name : 'customer_name',index : 'customer_name',align:'center',label:'微信昵称',width :100,sortable:false,editable : false,
                    formatter:function(value,options,rData){
                        if(value == null) return "";
                        return '<a href="/admin/project/customer/info/'+rData.id+'">'+value+'</a>';
                    }
                },
                {name : 'name',index : 'name',label:'姓名',align:'center',width :100,sortable:false,editable : false},
                {name : 'tel',index : 'tel',label:'手机号',align:'center',width :100,sortable:false,editable : false},
                {name : 'current_gold',index : 'current_gold',align:'center',label:lab,sortable:false,width :100,editable : false},

                {name : 'source',index : 'source',label:'用户来源',align:'center',width :100,sortable:false,editable : false,
                    formatter:function(value, options, rData){
                        if(value == null || value == '') return "自行访问";
                        return '来自<a href="javascript:void(0)" onclick="customerSource('+rData.id+')">'+value+'</a>'
                    }
                },
                {name : 'create_time',index : 'create_time',align:'center',label:'注册时间',sortable:false,width :125,editable : false,
                    formatter:"date",formatoptions: {srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}
                },
                {name : 'influenceCount',index : 'influenceCount',align:'center',sortable:false,label:'传播人数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有访问人数，点击可查看传播链条视图。" >?</span>',
                    width :100,editable : false,
                    formatter:function(value, options, rData){
                        if(value == null) return 0;
                        if(value != 0){
                            return '<a href="javascript:void(0)" onclick="influence('+rData.id+')">'+value+'</a>';

                        }
                        return value;
                    }
                },
//                {name : 'callbackCount',index : 'callbackCount',label:'回访人数',width :10,editable : false},
                {name : 'attentionCustomerCount',index : 'attentionCustomerCount',sortable:false,align:'center',label:'带来关注客户数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有关注本楼盘微信公众帐号的用户人数。" >?</span>',
                    width :130,editable : false},
                {name : 'intentionCustomerCount',index : 'intentionCustomerCount',align:'center',label:'带来意向客户数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有填写了姓名和手机号的用户人数。" >?</span>',
                    width :130,editable : false},
                {name : 'rate',index : 'rate',align:'center',label:'转化率<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="带来意向客户数与传播力的占比，传播转化率越高证明该客户对楼盘的价值越大。" >?</span>',width :100,editable : false,sortable:false,
                    formatter:function(value){
                        if(value == null) return "";
                        return value+"%";
                    }
                }

            ],

        loadComplete : function(data) {
            var table = this;
        //    var labelName = data.labelName;
            setTimeout(function() {
                //styleCheckbox(table);
                updateActionIcons(table);
                updatePagerIcons(table);
                enableTooltips(table);
                $('[data-rel=popover]').popover({container:'body'});
            }, 0);
        }
    });
}

function dealList(){
    var lab = $("#lab").val();
    var pager_selector = "#grid-pager";
    var table = $("#grid-table");
    table.jqGrid({
        url : "/admin/project/customer/dealList",
        datatype : "json",
        mtype : 'get',
        height : 380,
        scrollOffset:1,
        //    caption:'关注客户',
        rownumbers: true,
        viewrecords : true,
        rowNum : 10,
        rowList : [10, 20, 30],
        pager : pager_selector,
        altRows : true,
        autowidth:false,
        multiselect : false,
        multiboxonly : false,
        colModel :
            [
                {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false},
                {name : 'open_id',label:'OPEN ID',index :'open_id',hidden : true,align:'center',width :10,sorttype : "int",editable : false,
                    formatter:function(value,options,rData){
                        return '<a href="/admin/project/customer/info/'+rData.id+'">'+value+'</a>';
                    }
                },
                {name : 'customer_name',index : 'customer_name',align:'center',label:'微信昵称',width :80,sortable:false,editable : false,
                    formatter:function(value,options,rData){
                        if(value == null) return "";
                        return '<a href="/admin/project/customer/info/'+rData.id+'">'+value+'</a>';
                    }
                },
                {name : 'name',index : 'name',label:'姓名',align:'center',width :70,sortable:false,editable : false},
                {name : 'tel',index : 'tel',label:'手机号',align:'center',width :100,sortable:false,editable : false},
                {name : 'current_gold',index : 'current_gold',align:'center',label:lab,width :80,sortable:false,editable : false},

                {name : 'source',index : 'source',label:'用户来源',align:'center',width :100,sortable:false,editable : false,
                    formatter:function(value, options, rData){
                        if(value == null) return "自行访问";
                        return '来自<a href="javascript:void(0)" onclick="customerSource('+rData.id+')">'+value+'</a>'
                    }
                },
                {name : 'create_time',index : 'create_time',align:'center',label:'注册时间',width :125,sortable:false,editable : false,
                    formatter:"date",formatoptions: {srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}
                },
                {name : 'deal_time',index : 'deal_time',align:'center',label:'成交时间',width :125,sortable:false,editable : false,
                    formatter:"date",formatoptions: {srcformat:'Y-m-d H:i',newformat:'Y-m-d H:i'}
                },
                {name : 'influenceCount',index : 'influenceCount',align:'center',sortable:false,label:'传播人数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有访问人数，点击可查看传播链条视图。" >?</span>',
                    width :90,editable : false,
                    formatter:function(value, options, rData){
                        if(value == null) return 0;
                        if(value != 0){
                            return '<a href="javascript:void(0)" onclick="influence('+rData.id+')">'+value+'</a>';

                        }
                        return value;
                    }
                },
//                {name : 'callbackCount',index : 'callbackCount',label:'回访人数',width :10,editable : false},
            {name : 'attentionCustomerCount',index : 'attentionCustomerCount',sortable:false,align:'center',label:'带来关注客户数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有关注本楼盘微信公众帐号的用户人数。" >?</span>',
                width :125,editable : false},
            {name : 'intentionCustomerCount',index : 'intentionCustomerCount',sortable:false,align:'center',label:'带来意向客户数<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="该客户通过参与任务分享带来的所有填写了姓名和手机号的用户人数。" >?</span>',
                width :125,editable : false},
            {name : 'rate',index : 'rate',align:'center',label:'转化率<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="带来意向客户数与传播力的占比，传播转化率越高证明该客户对楼盘的价值越大。" >?</span>',
                width :90,editable : false,sortable:false,
                formatter:function(value){
                    if(value == null) return "";
                    return value+"%";
                }
            }
            ],

        loadComplete : function(data) {
            var table = this;
            setTimeout(function() {
                //styleCheckbox(table);
                updateActionIcons(table);
                updatePagerIcons(table);
                enableTooltips(table);
                $('[data-rel=popover]').popover({container:'body'});
            }, 0);
        }
    });
}

function updateActionIcons(table) {

    var replacement = {
        'ui-icon-pencil' : 'icon-pencil blue',
        'ui-icon-trash' : 'icon-trash red',
        'ui-icon-disk' : 'icon-ok green',
        'ui-icon-cancel' : 'icon-remove red'
    };
    $(table).find('.ui-pg-div span.ui-icon').each(function() {
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));
        if ( $class in replacement)
            icon.attr('class', 'ui-icon ' + replacement[$class]);
    })
}

//replace icons with FontAwesome icons like above
function updatePagerIcons(table) {
    var replacement = {
        'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
        'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
        'ui-icon-seek-next' : 'icon-angle-right bigger-140',
        'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
    };
    $('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each(function() {
        var icon = $(this);
        var $class = $.trim(icon.attr('class').replace('ui-icon', ''));

        if ( $class in replacement)
            icon.attr('class', 'ui-icon ' + replacement[$class]);
    })
}

function enableTooltips(table) {
    $('.navtable .ui-pg-button').tooltip({
        container : 'body'
    });
    $(table).find('.ui-pg-div').tooltip({
        container : 'body'
    });
}

/**
 * s客户来源
 * @param id
 */
function customerSource(id){
    $.ajax({
        url:'/admin/project/customer/source/'+id,
        asnyc:'false',
        type:'get',
        success:function(json){
            buildSourceDialog(json);
        }
    });
}

//构建客户来源
function buildSourceDialog(json){
    var point_name = $("#lab").val();
    var htm = '';
    var data = json.list;
    var customer = json.customer;
     for(var i=0;i<data.length;i++){
         var headImg = data[i].head_img;
         if(headImg == null || headImg == ''){
             headImg = '/assets/images/webwxgeticon.png';
         }
         var name = data[i].customer_name==null?'':data[i].customer_name;
          htm += '<div class="rel-user-info">'+
             '<img class="rel-user-avatar" alt="Susant Avatar" src="'+headImg+'"><br />'+
             '<span class="label label-info label-sm">'+name+'</span><br />'+
             '<span class="badge badge-success">'+point_name+'：'+data[i].current_gold+'</span>'+
             '</div>';
         htm +='<div class="rel-arr-wrap"><span class="rel-arr middle"></span><i class="middle icon-chevron-right blue bigger-110"></i></div>';

         /*if(i < json.length-1){
             htm +='<div class="rel-arr-wrap"><span class="rel-arr middle"></span><i class="middle icon-chevron-right blue bigger-110"></i></div>';
         }*/
     }
    var cusName = customer.customer_name==null?'':customer.customer_name;
    var img = customer.head_img==null||customer.head_img==''?'/assets/images/webwxgeticon.png':customer.head_img;
    htm += '<div class="rel-user-info">'+
        '<img class="rel-user-avatar" alt="Susant Avatar" src="'+img+'"><br />'+
        '<span class="label label-info label-sm">'+cusName+'</span><br />'+
        '<span class="badge badge-success">'+point_name+'：'+customer.current_gold+'</span>'+
        '</div>';

         var _html = [
        '<div class="widget-box no-border">',
        '	<div class="widget-header no-border">',
        '		<h4>客户'+cusName+'的来源追踪</h4>',
        '	</div>',
        '	<div class="widget-body no-border">',
        '		<div class="widget-main no-padding">',
        '			<div class="relation-box clearfix">',
        '				<div>',
                        htm,
        '				</div>',
        '			</div>',
        '		</div>',
        '	</div>',
        '</div>'].join("");
    $.fancybox({
        maxWidth : 800,
        height : 'auto',
        width : 'auto',
        autoSize : false,
        scrolling : 'auto',
        padding : 0,
        content: _html,
        afterShow : function(){
        }
    })
}

function goldChangeRecord(id){
    var lab = $("#lab").val();
    var pager_selector = "#gold-grid-pager";
    var table = $("#gold-grid-table");
    table.jqGrid({
        url : "/admin/project/customer/recordList/?id="+id,
        datatype : "json",
        mtype : 'get',
        height : 175,
        //    caption:'关注客户',
        rownumbers: true,
        colModel :
            [
                {name : 'id',index : 'id',hidden : true,width :0,sorttype : "int",editable : false},
                {name : 'description',label:'摘要',align:'center',index :'description',width :10,sortable:false,editable : false},
                {name : 'change_type',index : 'name',label:'类型',align:'center',width :10,editable : false},
                {name : 'change_money',label:lab,align:'center',index :'change_money',width :10,sortable:false,editable : false},
                {name : 'create_time',index : 'current_gold',label:'时间',align:'center',width :10,editable : false,sortable:false}

            ],
        viewrecords : true,
        rowNum : 5,
        rowList : [5, 10, 20],
        pager : pager_selector,
        altRows : true,
        autowidth:true,
        multiselect : false,
        multiboxonly : false,
        loadComplete : function(data) {
            var table = this;
            setTimeout(function() {
                //styleCheckbox(table);
                updateActionIcons(table);
                updatePagerIcons(table);
                enableTooltips(table);
            }, 0);
        }
    });
}

function taskInfo(id){
    var pager_selector = "#task-grid-pager";
    var table = $("#task-grid-table");
    table.jqGrid({
        url : "/admin/project/customer/taskInfo/"+id,
        datatype : "json",
        mtype : 'get',
    //    height : 380,
        //    caption:'关注客户',
        rownumbers: true,
        colModel :
            [
                {name : 'id',index : 'id',hidden : true,align:'center',width :0,sorttype : "int",editable : false},
                {name : 'title',index :'change_money',label:'参与活动名称',align:'center',width :10,editable : false},
                {name : 'callbackCount',index : 'remain_money',label:'传播人数',align:'center',width :10,editable : false},
                {name : 'attentionCount',index : 'name',label:'带来关注客户数',width :10,editable : false},
                {name : 'intentionCount',index : 'current_gold',label:'带来意向客户数',align:'center',width :10,editable : false}

            ],
        viewrecords : true,
        rowNum : 5,
        rowList : [5, 10, 20],
        pager : pager_selector,
        altRows : true,
        autowidth:true,
        multiselect : false,
        multiboxonly : false,
        loadComplete : function(data) {
            var table = this;
            setTimeout(function() {
                //styleCheckbox(table);
                updateActionIcons(table);
                updatePagerIcons(table);
                enableTooltips(table);
            }, 0);
        }
    });
}

function influence(id){
    $.ajax({
        url:'/admin/project/customer/spread/'+id,
        type:'get',
        asnyc:'false',
        success:function(json){
            buildSpread(json);
        }
    });

}

function buildSpread(json){
    var cus = json.customer;
    var list = json.spreadList;
    var customer = "";
    for(var i=0;i<list.length;i++){
        var headImg = list[i].head_img;
        if(headImg == null || headImg == ''){
            headImg = '/assets/images/webwxgeticon.png';
        }
        var name = list[i].customer_name==null?'':list[i].customer_name;
        var disable = false;
        if(list[i].spreadCount==0){
            disable = true;
        }
        var spreadCount = '';
        if(list[i].spreadCount != 0){
            spreadCount = "传播"+list[i].spreadCount+"人";
        }
        customer +='<li data-disabled="'+disable+'" data-depth="1" root-depth="'+cus.depth+'"  data-options="'+list[i].id+'">'
            +'<div class="v-line"></div>'
            +'<div class="h-line"></div>'
            +'<div class="rank-info clearfix">'
            +'<p class="avatar pull-left"><img src="'+headImg+'"></p>'
            +'<p class="info pull-left blue">'
            +'<span class="dark name">'+name+'</span><br>'
            +'<span class="c-orange">'+list[i].customerType+'</span><br>'+spreadCount
            +'</p></div></li>';
    }
    var cusImg = cus.head_img;
    if(cusImg == null || cusImg == ''){
        cusImg = '/assets/images/webwxgeticon.png';
    }
    var name = cus.customer_name==null?'':cus.customer_name;
    var _html = [
        '<div class="widget-box no-border">',
        '	<div class="widget-header no-border">',
        '		<h4>客户传播</h4>',
        '	</div>',
        '	<div class="widget-body no-border">',
        '		<div class="widget-main no-padding" style="height:520px; overflow-y:auto">',
        '			<div class="relation-box clearfix">',
        '				<ul class="steps-list">',
        '					<li>',
        '						<div class="rank-info clearfix">',
        '							<p class="avatar pull-left"><img src="'+cusImg+'"></p>',
        '							<p class="info pull-left blue"><span class="dark name">'+name+'</span><br>传播'+cus.spreadCount+'人</p>',
        '						</div>',
        '						<ul class="stepscon-list">',
                                customer,
        '						</ul>',
        '					</li>',
        '				</ul>',
        '			</div>',
        '		</div>',
        '	</div>',
        '</div>'].join("");
    $.fancybox({
        maxWidth : 800,
        height : 'auto',
        width : 'auto',
        minWidth : 400,
        maxHeight: 600,
        fitToView: false,
        scroll: false,
        autoSize : false,
        scrolling : 'auto',
        padding : 0,
        content: _html,
        afterShow : function(){
        }
    })
}


$(function(){
    $("body").on("click",".stepscon-list li",function(e){
        var html = "",
         $this = $(this);
        var id = $(this).attr("data-options");
        var rootDepth = $(this).attr("root-depth");
        var depth = $(this).attr("data-depth");

        //加载动画

        WG.stopBubble(e);
        if(depth == 3 ) return;
        if($(this).attr("data-disabled") == 'true') return
        if($(this).attr("data-opened") == "true"){
            $(this).find('ul').eq(0).hide();
            $(this).attr("data-opened","false");
        }else{
            if($(this).find('ul').length > 0){
                $(this).find('ul').eq(0).show();
                $(this).attr("data-opened","true");
            }else{
                var loadhtml = [
                    '<div class="zzsc6 load">',
                    '	<div class="bounce1"></div>',
                    '	<div class="bounce2"></div>',
                    '	<div class="bounce3"></div>',
                    '</div>'].join("");
                if(typeof(loading_now) == 'undefined'){
                    $(this).append(loadhtml);
                    loading_now = true;
                };
                $.ajax({
                    url:'/admin/project/customer/nextSpread',
                    type:'get',
                    asnyc:'false',
                    data:{id:id,depth:rootDepth},
                    success:function(json){
                        var rootDepth = json.rootDepth;
                        var depth = json.depth;
                        var list = json.spreadList;
                        for(var i = 0 ; i<list.length; i++){
                            var headImg = list[i].head_img;
                            if(headImg == null || headImg == ''){
                                headImg = '/assets/images/webwxgeticon.png';
                            }
                            var name = list[i].customer_name==null?'':list[i].customer_name;
                            var spreadCount = '';
                            if(list[i].spreadCount != 0 ){
                                spreadCount = "传播"+list[i].spreadCount+"人";
                            }
                            var disable = false;
                            if(list[i].spreadCount==0){
                                disable = true;
                            }
                            html+= '<li data-disabled="'+disable+'" data-depth="'+depth+'" root-depth="'+rootDepth+'" data-options="'+list[i].id+'">'
                                +'	<div class="v-line"></div>'
                                +'	<div class="h-line"></div>'
                                +'	<div class="rank-info clearfix">'
                                +'		<p class="avatar pull-left"><img src="'+headImg+'"></p>'
                                +'		<p class="info pull-left blue">'
                                +'			<span class="dark name">'+name+'</span><br />'
                                +'			<span class="c-orange">'+list[i].customerType+'</span><br / >' +spreadCount
                                +'		</p>'
                                +'	</div>'
                                +'</li>';

                        };
                        var _html = ['<ul class="stepscon-list">',html,'</ul>'] .join("");
                        $this.append(_html);
                        $this.find(".load").remove();
                        $this.find('ul').eq(0).show();
                        $this.attr("data-opened","true");
                    }
                });
            }
        }
    });
});
