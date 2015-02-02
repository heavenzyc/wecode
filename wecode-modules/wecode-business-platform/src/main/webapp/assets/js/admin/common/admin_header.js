jQuery(function($){

	var pathname = window.location.pathname;
	// $("#menu1 a").each(function(idx,item){
	// 	var menupath = $(item).attr("href");
	// 	if(pathname.indexOf(menupath) == 0){
	// 		$(item).addClass('current');
	// 	}
	// });

	//设置选择当前楼盘
	$(".btnProjectSelect").click(function(event) {
		var project = $(this).attr("__project_id");
		$.ajax({
			type: "POST",
			url: "/admin/common/selectproject",
			data: {projectId: project},
			dataType: "json",
			success: function(json){
				if(!json.success){
					alert("选择楼盘错误.");
				}else{
					//$("#currentProjectName").text(json.data.projectName);
					window.location.reload();
				}
			}
		});
	});

});