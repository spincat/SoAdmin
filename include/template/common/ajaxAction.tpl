<!-- Modal -->
<div id="actionModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-body"></div>
    <div class="modal-footer">
      <button class="btn btn-primary submit">确认</button>
      <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
    </div>
  </div>
</div>
</div>

<script>

$(function(){
  $("td.action a").live("click",function(e){
    window.action_row = $(this).parent("td").parent("tr");
    window.action_type = $(this).attr("action");
    window.action_id = window.action_row.children(".id").text();
    window.action_tips = $(this).attr("title");
    if(window.action_type=="edit"){
      window.location = window.location.href.replace(".php","_modify.php")+"?id="+action_id;
    }else if($(this).hasClass('confirm')){
      window.confirm = false;
      $("#actionModal").modal({backdrop:true});
    }else{
      window.confirm = true;
    }
  })
  var loadBox = '.modal-body';
  $("#actionModal").on('show.bs.modal',function(){//加载时动作
    var post_url = window.location.href;
    var post_id = parseInt(window.action_id);
    var post_action = window.action_type;
    clearTimeout(window.showtip);
    $(loadBox).html("确定要"+window.action_tips+"吗？");
    if(window.confirm){
      confirmAction(post_url,post_id,post_action,loadBox)
    }else{
      $("#actionModal .submit").unbind().click(function(){
        confirmAction(post_url,post_id,post_action,loadBox);
      });
    }
  });
  $("#actionModal").on('hidden.bs.modal',function(){
    $(loadBox).empty();
  });
})

var block_html = "<a class='confirm' action='block' title= '封停账号' ><i class='fa fa-pause'></i></a>";
var unblock_html = "<a class='confirm' action='unblock' title= '解封账号' ><i class='fa fa-play'></i></a>";

function confirmAction(post_url,post_id,post_action,loadBox){
  showLoading(loadBox);
  $.post(post_url,{id:post_id,action:post_action},function(msg,status){
    if(status=="success"){
      var data = $.parseJSON(msg);
      clearTimeout(window.showtip);
      if(data.type=="success"){
        $(loadBox).html(data.cont);
        $("#actionModal").modal('hide');
        if(post_action=="del"){
          window.action_row.fadeOut(function(){
            window.action_row.remove();
          });
        }else if(post_action=="block"){
          var block = window.action_row.children(".action").children("[action='block']");
          block.after(unblock_html).remove();
        }else if(post_action=="unblock"){
          var unblock = window.action_row.children(".action").children("[action='unblock']");
          unblock.after(block_html).remove();
        }
      }else{
        $(loadBox).html("操作处理错误："+data.cont);
      }
    }
  });
}

var nums = 0;
var tip = "提交操作正在处理中";

/*
  显示正在加载提示
  */
function showLoading(loadBox){
  var n = nums++;
  var t = tip;
  while(n-->0){
    t += ".";
  }
  $(loadBox).html(t);
  if(nums>6){
    nums = 0;
  }
  window.showtip = setTimeout("showLoading('"+loadBox+"')",600);
};
</script>