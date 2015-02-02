<#import "/WEB-INF/views/common/include.ftl" as we/>

<@we.html css=["/assets/css/colorbox.css","/assets/css/jquery.fancybox.css","/assets/css/idangerous.swiper.css"] js=["${jspath}/project/consultant/consultant.js",
"${jspath}/common.js",
"${jspath}/jquery.colorbox-min.js",
"${jspath}/idangerous.swiper.min.js",
"${jspath}/jquery.fancybox.min.js"]>


<@we.breadcrumb/>
<div class="page-content">
    <div class="page-header">
        <a class="btn btn-primary" href="${path}/admin/project/ad/add">添加图片</a>
		<span style="margin-left:20px;">温馨提示：为了整体展示效果，最多可添加5个广告</span>
    </div>
    <div class="row">
        <div class="col-xs-12">
        
            <!-- PAGE CONTENT BEGINS -->
			<div class="space-12"></div>
			<div class="col-xs-6  col-lg-4">
                <#list adList as ad>
				<div class="timeline-item s-list clearfix">
					<div class="widget-box ad-box transparent">
						<div class="widget-body">
							<div class="widget-body-inner clearfix">
								<div class="widget-main">
									<div class="ad-pic"><img src="${kit.url('COMMON',ad.pic_url)}" alt=""></div>
									<div class="space-6"></div>
									<#if ad.redirect_url??>
									<div>绑定跳转页面：<a href="${ad.redirect_url}" target="_blank">${ad.redirect_url}</a></div>
									</#if>
									<div class="space-6"></div>
									<div class="widget-toolbox clearfix">
										<div class="pull-right action-buttons">
											<a href="${path}/admin/project/ad/edit/${ad.id}" title="编辑">
												<i class="icon-pencil blue bigger-125"></i>
											</a>
											<a href="javascript:;" title="删除" data-id="${ad.id}" class="js_remove">
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
			</div>
			<div class="col-xs-6  col-lg-8">
				<div class="phone-preview pull-right">
					<div class="preview-content Js_preview">
						<!-- <div class="preview-wrap"> -->
							<!-- 多图展示 -->	
							<div class="swiper-container">
								<div class="swiper-wrapper">
									<#list adList as ad>
									<div class="swiper-slide">
										<img src="${kit.url('COMMON',ad.pic_url)}" style="width:301px; height:452px;">
									</div>
									</#list>
								</div>
							</div>	
							<div class="pagination ad-page"></div>

					 		<div class="box-btns">
								<div class="box-btns-con">
									<a class="btns" href="#">楼盘简介</a>
									<a class="btns" href="#">周边配套</a>
									<a class="btns" href="#">户型鉴赏</a>
									<a class="btns" href="#">楼盘相册</a>
									<a class="btns" href="#">地图导航</a>
									<a class="btns" href="#">售楼热线</a>
								</div>
							</div>
						<!-- </div> -->
					</div>
				</div>
			</div>
			<div class="clearfix"></div>
            <!-- PAGE CONTENT ENDS -->
        </div><!-- /.col -->
    </div><!-- /.row -->

</div><!-- /.page-content -->
<script type="text/javascript">
	jQuery(function($){
		$(".js_remove").click(function(e){
			var $this = $(this);
			var index = $this.parents(".timeline-item").index();
			if(!confirm("确定删除吗?")){
				return false;
			}
			var adId = $(this).attr("data-id");
			$.ajax({
				type: "POST",
				url: "${path}/admin/project/ad/remove",
				data: {adId: adId},
				dataType: "json",
				success: function(json){
					if(!json.success){
						alert(json.message || "删除广告错误");
					}else{
						$this.parents(".timeline-item").remove();
						e.preventDefault();
						mySwiper.removeSlide(index)
						//window.location.reload();
					}
				}
			});
		});

		$(".Js_del").on("click",function(e){
		})

		//广告预览
		var mySwiper = new Swiper('.swiper-container',{
			pagination: '.pagination',
			//autoplay: 4000,
			speed : 600,
			loop:true,
			paginationClickable: true
		})
	});
</script>
</@we.html>