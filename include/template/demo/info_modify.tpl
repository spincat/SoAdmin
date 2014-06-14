<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<{include file ='common/datepicker.tpl'}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmid_actiod_alert}>
<{$osadmid_quick_note}>
<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">修改信息</a></li>
    </ul>	
	
	<div id="myTabContent" class="tab-content">
		  <div class="tab-pane active in" id="home">
        <form id="tab" method="post" action="" autocomplete="off">
      
        <div class="form-group">
					<label>发布时间</label>
					<input type="text" id="publish_date" name="date" value="<{$info->date}>" class="form-control" required="true">
				</div>
        <div class="form-group">
					<label>作者</label>
					<input type="text" name="user" value="<{$info->user}>" class="form-control" disabled>
				</div>
        
        <input class="info_id hidden-field" type="text" value="<{$info->id}>">
        <input class="img-url hidden-field" type="text" name="imgurl" value="<{$info->imgurl}>">
        
        <label>图片</label>
        <div class="upload imgupload">
         <div class="imgshow">图片预览区</div>
         <div class="imgInfo"></div>
         <span id="imgupload"></span>
         <div class="progress progress-striped active">
          <div class="bar" style="width:0;"></div>
        </div>
        <div class="alert">
          <button type="button" class="close" data-dismiss="alert">&times;</button>
          <strong>小贴士：</strong>允许上传 gif/jpg/png 格式的图片，图片大小不能超过1M。
        </div>
        </div>
        <div class="form-group">
					<label class="intro">内容<span class="word-nums">还可以输入<span></span>字</span></label>
					<textarea class="input-xlarge limit-input" name="cont" maxwords="90" style="width:600px;height:100px;" required="true" placeholder="输入长度在90字以内"><{$info->cont}></textarea>
				</div>
				<div class="form-group">
					<label>来自</label>
					<input type="text" name="source" value="<{$info->source}>" class="form-control" required="true">
				</div>
				<div class="btn-toolbar">
          <button type="submit" class="btn btn-primary"><strong>提交</strong></button>
          <div class="btn-group"></div>
        </div>
			</div>
			</form>
        </div>
    </div>
</div>	

<script>
$(function() {
	$("#publish_date").datepicker();
  window.ex_path = "/demo/";
  window.tpms = new Array($.toJSON([{"suffix":"l","width":207,"height":170}]));
  window.delImgSQL = new Array("update info set imgurl = null where id = '"+$(".info_id").val()+"'");
})  
</script>
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<{include file ='common/common.tpl'}>
<{include file ='common/uploadimg.tpl'}>

<{include file ="common/ajaxSubmit.tpl"}>