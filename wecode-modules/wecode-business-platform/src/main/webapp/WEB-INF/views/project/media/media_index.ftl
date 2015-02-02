<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css","${csspath}/ui.jqgrid.css"] js=["${jspath}/date-time/bootstrap-datepicker.min.js","${jspath}/jqGrid/jquery.jqGrid.min.js","${jspath}/jqGrid/i18n/grid.locale-cn.js"]>
<@we.breadcrumb/>
<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-8"></div>
		<div class="col-xs-2">
			<a class="btn no-border btn-primary pull-right" href="${path}/admin/project/media/addIndex">新建单图文素材</a>
		</div>
		<div class="col-xs-2">
			<a class="btn no-border btn-primary pull-right" href="${path}/admin/project/media/addMultipleIndex">新建多图文素材</a>
		</div>
	</div><!-- /.page-header -->
	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
			<script type="text/javascript">
				var $path_base = "/";
				//this will be used in gritter alerts containing images
			</script>
			<!-- PAGE CONTENT ENDS -->
		</div><!-- /.col -->
	</div><!-- /.row -->
</div>

<script type="text/javascript">
	jQuery(function($) {
		var grid_selector = "#grid-table";
		var pager_selector = "#grid-pager";

		jQuery(grid_selector).jqGrid({
			url : "/admin/project/media/mediaDataGrid",
			datatype : "json",
			mtype : 'POST',
			height : 250,
			colNames : ['ID','标题', '摘要', '类型', '创建日期', '操作'],
			colModel : [{
				name : 'id',
				index : 'id',
				hidden : true,
				width : 0,
				sorttype : "int",
				editable : false
			}, {
				name : 'title',
				index : 'id',
				width : 60,
				sorttype : "int",
				editable : false
			}, {
				name : 'summary',
				index : 'id',
				width : 90,
				editable : false
			}, {
				name : 'type',
				index : 'type',
				width : 20,
				editable : false
			}, {
				name : 'create_time',
				index : 'create_time',
				width : 150,
				editable : false,
				sorttype : "date",
				unformat : pickDate
			}, {
				name : 'myac',
				index : '',
				width : 100,
				fixed : true,
				sortable : false,
				resize : false,
				//formatter : 'actions',
				// formatoptions : {
				// keys : true,
				// delOptions : {
				// recreateForm : false,
				// beforeShowForm : beforeDeleteCallback,
				// afterSubmit : function(response, postdata) {
				// var data = response.responseJSON;
				// if (data.success == true) {
				// $.gritter.add({
				// title : '信息提示',
				// time : 1500,
				// text : '删除记录成功！',
				// class_name : 'gritter-info gritter-center'
				// });
				// jQuery(grid_selector).trigger("reloadGrid");
				// } else {
				// $.gritter.add({
				// title : '信息提示',
				// time : 1500,
				// text : '删除记录失败！',
				// class_name : 'gritter-info gritter-center'
				// });
				// }
				// return [true, ''];
				// }
				// },
				// }
			}],

			viewrecords : true,
			rowNum : 10,
			rowList : [10, 20, 30],
			pager : pager_selector,
			altRows : true,
			//toppager: true,

			multiselect : false,
			//multikey: "ctrlKey",
			multiboxonly : false,
			loadComplete : function(data) {
				var table = this;
				setTimeout(function() {
					//styleCheckbox(table);
					updateActionIcons(table);
					updatePagerIcons(table);
					enableTooltips(table);
				}, 0);
			},
			gridComplete : function() {
				var ids = jQuery(grid_selector).jqGrid('getDataIDs');
				for (var i = 0; i < ids.length; i++) {
					var row = jQuery(grid_selector).jqGrid('getRowData', ids[i]);
					var type_name;
					if(row.type==0){
						type_name = "单图文";
					}else{
						type_name = "多图文";
					}
					be = "<button type='button' class='btn btn-minier btn-primary' onclick='mediaModify("+row.id+","+row.type+");'>修改</button>";
					sp = "<span>&nbsp;&nbsp;</span>";
					se = "<button type='button' class='btn btn-minier btn-danger' onclick='mediaDelete("+row.id+");'>删除</button>";
					jQuery(grid_selector).jqGrid('setRowData', ids[i], {
						//myac : be + sp + se,type : type_name
						myac : sp + se,type : type_name
					});
				}
			},
			caption : "微信素材管理",
			autowidth : true
		});

		//enable search/filter toolbar
		//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

		//switch element when editing inline
		/*
		function aceSwitch( cellvalue, options, cell ) {
		setTimeout(function(){
		$(cell) .find('input[type=checkbox]')
		.wrap('<label class="inline" />')
		.addClass('ace ace-switch ace-switch-5')
		.after('<span class="lbl"></span>');
		}, 0);
		}
		*/

		//enable datepicker
		function pickDate(cellvalue, options, cell) {
			setTimeout(function() {
				$(cell).find('input[type=text]').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true
				});
			}, 0);
		}

		/*
		 function style_edit_form(form) {
		 //enable datepicker on "sdate" field and switches for "stock" field
		 form.find('input[name=sdate]').datepicker({format:'yyyy-mm-dd' , autoclose:true})
		 .end().find('input[name=stock]')
		 .addClass('ace ace-switch ace-switch-5').wrap('<label class="inline" />').after('<span class="lbl"></span>');

		 //update buttons classes
		 var buttons = form.next().find('.EditButton .fm-button');
		 buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();//ui-icon, s-icon
		 buttons.eq(0).addClass('btn-primary').prepend('<i class="icon-ok"></i>');
		 buttons.eq(1).prepend('<i class="icon-remove"></i>')

		 buttons = form.next().find('.navButton a');
		 buttons.find('.ui-icon').remove();
		 buttons.eq(0).append('<i class="icon-chevron-left"></i>');
		 buttons.eq(1).append('<i class="icon-chevron-right"></i>');
		 }
		 */

		function style_delete_form(form) {
			var buttons = form.next().find('.EditButton .fm-button');
			buttons.addClass('btn btn-sm').find('[class*="-icon"]').remove();
			//ui-icon, s-icon
			buttons.eq(0).addClass('btn-danger').prepend('<i class="icon-trash"></i>');
			buttons.eq(1).prepend('<i class="icon-remove"></i>')
		}

		function style_search_filters(form) {
			form.find('.delete-rule').val('X');
			form.find('.add-rule').addClass('btn btn-xs btn-primary');
			form.find('.add-group').addClass('btn btn-xs btn-success');
			form.find('.delete-group').addClass('btn btn-xs btn-danger');
		}

		function style_search_form(form) {
			var dialog = form.closest('.ui-jqdialog');
			var buttons = dialog.find('.EditTable')
			buttons.find('.EditButton a[id*="_reset"]').addClass('btn btn-sm btn-info').find('.ui-icon').attr('class', 'icon-retweet');
			buttons.find('.EditButton a[id*="_query"]').addClass('btn btn-sm btn-inverse').find('.ui-icon').attr('class', 'icon-comment-alt');
			buttons.find('.EditButton a[id*="_search"]').addClass('btn btn-sm btn-purple').find('.ui-icon').attr('class', 'icon-search');
		}

		function beforeDeleteCallback(e) {
			var form = $(e[0]);
			if (form.data('styled'))
				return false;

			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_delete_form(form);

			form.data('styled', true);
		}

		function beforeEditCallback(e) {
			var form = $(e[0]);
			form.closest('.ui-jqdialog').find('.ui-jqdialog-titlebar').wrapInner('<div class="widget-header" />')
			style_edit_form(form);
		}

		//it causes some flicker when reloading or navigating grid
		//it may be possible to have some custom formatter to do this as the grid is being created to prevent this
		//or go back to default browser checkbox styles for the grid
		function styleCheckbox(table) {
			/**
			 $(table).find('input:checkbox').addClass('ace')
			 .wrap('<label />')
			 .after('<span class="lbl align-top" />')

			 $('.ui-jqgrid-labels th[id*="_cb"]:first-child')
			 .find('input.cbox[type=checkbox]').addClass('ace')
			 .wrap('<label />').after('<span class="lbl align-top" />');
			 */
		}

		//unlike navButtons icons, action icons in rows seem to be hard-coded
		//you can change them like this in here if you want
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

	}); 
	
	function mediaDelete(id) {
		var posturl = "/admin/project/media/delete";
		var postdata = {
			"id" : id
		};
		WG.fn.ajax(posturl, postdata, function(data) {
			jQuery("#grid-table").trigger("reloadGrid");
			showToast('删除成功');
		});
	}
	
	function mediaModify(id,type){
		if(type==0){
			window.location.href="/admin/project/media/edit/"+id
		}else{
			window.location.href="/admin/project/media/editMultiple/"+id
		}
	}
</script>

</@we.html>