<#import "/WEB-INF/views/common/include.ftl" as we/>
<@we.html css=["${csspath}/jquery-ui-1.10.3.full.min.css","${csspath}/ui.jqgrid.css"] js=["${jspath}/date-time/bootstrap-datepicker.min.js","${jspath}/jqGrid/jquery.jqGrid.min.js","${jspath}/jqGrid/i18n/grid.locale-cn.js"]>
<@we.breadcrumb/>

<div class="page-content">
	<div class="page-header row">
		<div class="col-xs-4">
			<h1>
				角色管理
			</h1>
		</div>

		<div class="col-xs-8">
		<a class="btn no-border btn-primary pull-right" href="${path}/admin/settings/role/add">新建角色</a>
		</div>
	</div><!-- /.page-header -->

	<div class="row">
		<div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<table id="grid-table"></table>
			<div id="grid-pager"></div>
			<script type="text/javascript">
				var $path_base = "/";
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
			url : "/admin/settings/role/dataGrid/",
			datatype : "json",
			mtype : 'POST',
			height : 250,
			colNames : ['ID','角色名称', '创建日期','类型', '操作'],
			colModel : [{
				name : 'id',
				index : 'id',
				hidden : true,
				width : 0,
				sorttype : "int",
				editable : false
			}, {
				name : 'name',
				index : 'name',
				width : 60,
				sorttype : "int",
				editable : false
			}, {
				name : 'create_time',
				index : 'create_time',
				width : 150,
				editable : false,
				sorttype : "date",
				unformat : pickDate
			}, {
				name : 'type',
				index : '',
				width : 100,
				fixed : true,
				sortable : false,
				resize : false,
			}, {
				name : 'myac',
				index : '',
				width : 100,
				fixed : true,
				sortable : false,
				resize : false,
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
						type_name = "系统角色";
						time = "";
						be = "";
						sp = "";
						se = "";
					}else{
						type_name = "自定义角色";
						time = row.create_time;
						be = "<button type='button' class='btn btn-minier btn-primary' onclick='roleModify("+row.id+");'>修改</button>";
						sp = "<span>&nbsp;&nbsp;</span>";
						se = "<button type='button' class='btn btn-minier btn-danger' onclick='roleDelete("+row.id+");'>删除</button>";
					}
					jQuery(grid_selector).jqGrid('setRowData', ids[i], {
						myac : be+sp + se,type : type_name,create_time : time
					});
				}
			},
			caption : "角色管理",
			autowidth : true
		});

		//enable search/filter toolbar
		//jQuery(grid_selector).jqGrid('filterToolbar',{defaultSearch:true,stringResult:true})

		//enable datepicker
		function pickDate(cellvalue, options, cell) {
			setTimeout(function() {
				$(cell).find('input[type=text]').datepicker({
					format : 'yyyy-mm-dd',
					autoclose : true
				});
			}, 0);
		}

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
	
	function roleDelete(id) {
		var posturl = "/admin/settings/role/deleteRole";
		var postdata = {
			"id" : id
		};
		WG.fn.ajax(posturl, postdata, function(data) {
			jQuery("#grid-table").trigger("reloadGrid");
			showToast('删除成功');
		});
	}
	
	function roleModify(id){
		window.location.href="/admin/settings/role/edit/"+id
	}
</script>

</@we.html>