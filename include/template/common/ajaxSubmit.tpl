<!-- Modal -->
<div id="submitModal" class="modal fade">
 <div class="modal-dialog">
  <div class="modal-content">
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      <h4 id="myModalLabel">表单处理</h4>
    </div>
    <div class="modal-body"></div>
  </div>
</div>
</div>

<script>

$(function(){
  var preaction = "";//表单提交前动作
  $("#tab").submit(function(e){
    e.preventDefault();
    preaction = $(this).attr("preaction");
    $("#submitModal").modal({backdrop:true});
  })
  var loadBox = '.modal-body';
  $("#submitModal").on('show.bs.modal',function(){//加载时动作
    if(preaction){
      clearTimeout(window.showtip);
      window.tip = "正在转存图片到本地";
      showLoading(loadBox);
      dynamicInvocationMethod(preaction,"doSubmit");
    }else{
      doSubmit();
    }
  });
  $("#submitModal").on('hidden.bs.modal',function(){
    $(loadBox).empty();
  });
})

function doSubmit(){
  clearTimeout(window.showtip);
  window.tip = "提交正在处理中";
  var post_url = window.location.href;
  var post_data = $("#tab").serializeObject();
  var loadBox = '.modal-body';
  showLoading(loadBox);
  $.post(post_url,{data:post_data},function(msg,status){
    if(status=="success"){
      var data = $.parseJSON(msg);
      var back_url = window.back_url;
      clearTimeout(window.showtip);
      if(data.type=="success"&&back_url){
        $(loadBox).html("信息提交成功！");
        if(data.params){
          var params = $.parseJSON(data.params);
          var method = params.method;
          if(method=="escape"){
            clearTimeout(window.showtip);
            doEscape(loadBox,params);
          }
        }else{
          window.location = back_url;
        }
      }else{
        $(loadBox).html("信息提交错误："+data.cont);
      }
    }
  });
}

var nums = 0;

/*
显示正在加载提示
*/
function showLoading(loadBox){
  var n = nums++;
  var t = window.tip;
  while(n-->0){
    t += ".";
  }
  $(loadBox).html(t);
  if(nums>6){
    nums = 0;
  }
  window.showtip = setTimeout("showLoading('"+loadBox+"')",600);
}

function doEscape(loadBox,params){
  var html = "<div class='progress progress-escape'><div class='bar' style='width:0;'></div></div>";
  $(loadBox).html(html);
  $(".modal-header h3").html("图书转码");
  var bid = params.bid;
  var file = params.file;
  escape(bid,file[0],function(){
    $(loadBox).html("图书转码完成");
    window.location = window.back_url;
  });
}


//将内容中的网络图片替换为本地图片
function storeWebImg(storeSuccess){
  window.editor.sync();
  var cont = $("#editor").val();
  var images = cont.match(/<img.*?src=\".*?\"/g);
  if(images){
    var ex_path = "/news/";
    var images = $.toJSON(images);
    var tpms = $.toJSON([{"suffix":"l","width":120,"height":85},{"suffix":"h","width":140,"height":100}]);
    var client = new PHPRPC_Client('<{$smarty.const.COSMODOM_URL}>/apps/Fileserver/img2location.php', ['img2location']);  
    client.setEncryptMode(2);  
    client.img2location(images,tpms,ex_path,function(result){
      if(!result) return;
      var msg = $.parseJSON(result); 
      if(msg.success){
        var new_imgurls = msg.new_imgurls;
        var old_imgurls = msg.old_imgurls;
        var cont = $("#editor").val();
        cont = replaceImgs(cont,old_imgurls,new_imgurls);
        $("#editor").val(cont);
        if(!$(".img-url").val()){
          $(".img-url").val(new_imgurls[0]);
        }
        dynamicInvocationMethod(storeSuccess);
      }else{
        alert(msg);
      }
    });
  }else{
    dynamicInvocationMethod(storeSuccess);
  }
}

//动态调用js方法
function dynamicInvocationMethod(mehodName, params) {
  return eval(mehodName)(params);
}

</script>