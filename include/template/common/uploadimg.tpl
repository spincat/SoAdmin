<script type="text/javascript" src="<{$admin_url}>/assets/lib/swfupload/js/swfupload.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/swfupload/js/swfupload.queue.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/swfupload/js/fileprogress.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/swfupload/js/handlers.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/phprpc/phprpc_3.0.1_js/compressed/phprpc_client.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/js/jquery.json-2.4.min.js"></script>
<script type="text/javascript">

var imgUploader;
var showimg = $('.imgupload .imgshow');
var imgProgress = $(".imgupload .progress");
var imgProgressBar = $('.imgupload .bar');
var imgInfo = $(".imgupload .imgInfo");
var valimg = $(".img-url");
window.imgIndex = 0;
drawImgBox(valimg.eq(window.imgIndex).val());
$(function(){

  /** 
   * SWFUpload Init Settings
   */
   var upload_settings = {
    flash_url : "<{$smarty.const.COSMODOM_URL}>/apps/Fileserver/swfupload.swf",
    upload_url: "<{$smarty.const.COSMODOM_URL}>/apps/Fileserver/upload4img.php",
    post_params: {"PHPSESSID" : "","ex_path":window.ex_path,"tparams":window.tpms[window.imgIndex]},
    file_size_limit : "1 MB",
    file_types : "*.jpg;*.jpeg;*.png;*.bmp;*.gif",
    file_types_description : "Image Files",
    file_upload_limit : 100,
    file_queue_limit : 1,
    custom_settings : {
      progressTarget : "",
      cancelButtonId : ""
    },
    debug: false,

    //Button settings
    button_image_url: "<{$admin_url}>/assets/lib/swfupload/images/imageUploadButton.png",
    button_width: "100",
    button_height: "29",
    button_placeholder_id: "imgupload",
    button_text: '<span class="theFont">添加图片</span>',
    button_text_style: ".theFont { font-size: 14px;color:#333333;}",
    button_text_left_padding: 15,
    button_text_top_padding: 5,
    button_action: SWFUpload.BUTTON_ACTION.SELECT_FILE,//弹出单选文件框（多选为SELECT_FILES）
    button_cursor: SWFUpload.CURSOR.HAND,
    
    //The event handler functions are defined in handlers.js
    file_queued_handler : fileQueued,
    file_queue_error_handler : fileQueueError,
    file_dialog_complete_handler : fileDialogComplete,
    upload_start_handler : uploadImgStart,
    upload_progress_handler : uploadImgProgress,
    upload_error_handler : uploadError,
    upload_success_handler : uploadImgSuccess,
    upload_complete_handler : uploadComplete,
    queue_complete_handler : queueComplete	// Queue plugin event
  };

  imgUploader = new SWFUpload(upload_settings);

  /** 
   * Delete A Uploaded Image (With A Jsonp Request)
   */
   $(".delimg").live('click',function(){
     var pic_id = $(this).attr("rel_id");
     var pic_name = $(this).attr("rel_name");
     var client = new PHPRPC_Client('<{$smarty.const.COSMODOM_URL}>/apps/Fileserver/del4file.php', ['delImage']);  
     client.setEncryptMode(2);  
     client.delImage(window.ex_path,pic_name,function (result) {  
      if(result){
        if(pic_id){
          cancelUploadedImg(pic_id);
          delImgSuccess();
        }else{
          var delsql = window.delImgSQL[window.imgIndex];
          $.post("<{$admin_url}>/ajax/do_sql.php",{sql:delsql},function(msg,status){
            if(status=="success"){
              delImgSuccess();
            }else{
              imgInfo.html(msg);
              return;
            }
          });
        }
      }else{
        imgInfo.html("图片删除失败.");
      }
    });  
   });

  //图片类型切换
  $(".img-nav a").click(function(){
    $(".img-nav a").removeClass("check");
    $(this).addClass("check");
    var index = $(this).prevAll().size();
    var img = valimg.eq(index);
    drawImgBox(img.val());
    window.imgIndex = index;
    imgUploader.setPostParams({ex_path:window.ex_path,tparams:window.tpms[window.imgIndex]}); 
  })

});  

function uploadImgStart(file){
  try {
    showimg.html("图片预览区");
    imgProgress.show();
    imgProgressBar.css("width",'0%');
  }
  catch (ex) {}
  
  return true;
}

function uploadImgProgress(file, bytesLoaded, bytesTotal) {
	try {
		var percent = Math.ceil((bytesLoaded / bytesTotal) * 100);
    imgProgressBar.css("width",percent + '%');
  } catch (ex) {
    this.debug(ex);
  }
}

function uploadImgSuccess(file, serverData) {
	try {
    if(!serverData.match(/"success":true/)){
      var errorInfo = serverData;
      imgInfo.html(errorInfo).addClass("errorInfo");
      return false;
    }
    var data = $.parseJSON(serverData);
    imgInfo.html("<span>"+file.name+"("+data.size+"k)</span> <a class='delimg btn-link' rel_id='"+file.id+"' rel_name='"+data.saveName+"'>删除</a>").removeClass("errorInfo");
    var imgurl = '<{$smarty.const.COSMODOM_URL}>/apps/Fileserver/images'+window.ex_path+data.saveName;
    showimg.html("<img src='"+imgurl.replace(/(.*)\./,"$1-l.")+"'>");
    imgProgress.fadeOut("slow");
    valimg.eq(window.imgIndex).val(imgurl.replace(/.*(\/images)/,"$1"));
  } catch (ex) {
    this.debug(ex);
  }
}

function delImgSuccess(){
  imgInfo.html("图片删除成功.");
  showimg.html("图片预览区");
  valimg.eq(window.imgIndex).val('');
  imgProgress.hide();
}

function cancelUploadedImg(fileid){  
  if (!fileid){  
    return false;  
  }  
  //获取对象的状态  
  var stats = imgUploader.getStats();  
  //删除队列中的特定文件  
  imgUploader.cancelUpload(fileid, false);  
  //把队列状态中的成功上传文件数减一
  imgUploader.setStats({successful_uploads:(stats.successful_uploads-1)});  
}    

//根据图片地址填充图片框和图片信息
function drawImgBox(imgurl){
  if(imgurl){
    var imgname = imgurl.substring(imgurl.lastIndexOf("/")+1);
    var img = '<{$smarty.const.COSMODOM_URL}>/apps/Fileserver'+imgurl;
    img = img.replace(/(.*)\./,"$1-l.");
    showimg.html("<img src='"+img+"'>");
    imgInfo.html("<span>"+imgname+"</span> <a class='delimg btn-link' rel_name='"+imgname+"'>删除</a>");
  }else{
    showimg.html("图片预览区");
    imgInfo.html("");
  }
}

</script>