<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
    
<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">请填写菜单模块资料</a></li>
    </ul>	
	
	<div id="myTabContent" class="tab-content">
		  <div class="tab-pane active in" id="home">

           <form id="tab" method="post" action="">
				<div class="form-group">
					<label>模块名称</label>
					<input type="text" name="module_name" value="<{$_POST.module_name}>" class="form-control" required="true" autofocus="true" >
				</div>
				<div class="form-group">
					<label>模块链接</label>
					<input type="text" name="module_url" value="<{if $_POST.module_url=="" }>/index.php<{else}><{$_POST.module_url}><{/if}>" class="form-control" required="true">
				</div>
				<label>模块图标</label>
				<div style="width:20px;padding-bottom:5px">
					<a class="icon" style="width:20px;line-height:2em;">
					<i id="icon_preview" class="fa fa-th"></i></a>
				</div>
				<input type="text" readonly value="fa fa-th" name="module_icon" id="icon_id" style="width:180px" >
				<a id="icon_select" class="btn btn-info" style="vertical-align:top" >更改图标</a>
				<!-- 选择图标层-->			
				<{include file="admin/icon_select.tpl" }>
				<!-- 选择图标层 结束-->

				
				<div class="form-group">
					<label>模块排序数字(数字越小越靠前)</label>
					<input type="text" name="module_sort" value="<{$_POST.module_sort}>" class="form-control" >
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea name="module_desc" rows="3" class="form-control"><{$_POST.module_desc}></textarea>
				</div>
				<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"><strong>提交</strong></button>
				</div>
			</form>
        </div>
    </div>
</div>
<script>
$('#icon_select').click(function(){			
	$('#myModal').modal({
		backdrop:true,
		keyboard:true,
		show:true
    });	
});

$('.icon').click(function(){
		var obj=$(this);
		$('#icon_preview').removeClass().addClass(obj.text());
		$('#icon_id').val(obj.text());
		$('#myModal').modal('toggle');
});
</script>
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>

<{include file ="common/ajaxSubmit.tpl"}>