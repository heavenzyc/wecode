/**
 * Created by heaven.zyc on 14-6-4.
 */

function moveUp(obj,id){
    var preObj = $(obj).parent().parent().parent().parent().prev();
    var targetId = preObj.attr("data-option");
    moveAction(id,targetId);
}

function moveDown(obj,id){
    var nextObj = $(obj).parent().parent().parent().parent().next();
    var targetId = nextObj.attr("data-option");
    moveAction(id,targetId);
}

function moveAction(id,targetId){
    if(id == null || targetId == null) return;
    $.ajax({
        url:'/admin/project/consultant/move',
        async:'false',
        type:'get',
        data:{id:id,targetId:targetId},
        success:function(data){
            window.location.reload();
        }
    });
}