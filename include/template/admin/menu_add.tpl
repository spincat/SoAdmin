<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
    
<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">请填写功能资料</a></li>
    </ul>	
	
	<div id="myTabContent" class="tab-content">
		  <div class="tab-pane active in" id="home">

           <form id="tab" method="post" action="">
				<div class="form-group">
					<label>名称</label>
					<input type="text" name="menu_name" value="<{$_POST.menu_name}>" class="form-control" required="true" autofocus="true">
				</div>
				<div class="form-group">
					<label>链接 <span class="label label-important">不可重复，以/开头的相对路径或者http网址</span></label>
					<input type="text" name="menu_url" value="<{$_POST.menu_url}>" class="form-control" placeholder="/admin/"  required="true" >
				</div>
				<label>所属模块</label>
				<{html_options name=module_id id="DropDownTimezone" class="form-control" options=$module_options_list selected=0}>
				<div class="form-group">
					<label>是否左侧菜单栏显示</label>
					<select name="is_show" class="form-control" >
					<option value="1" selected >是</option>
					<option value="0">否</option>
				</select>
				</div>
				
				<label>所属菜单</label>
				 <{html_options name=father_menu id="DropDownTimezone" class="form-control" options=$father_menu_options_list selected=0}>
				
				
				<div class="form-group">
					<label>是否允许快捷菜单 <span class="label label-important">修改/ 删除类链接不允许</span></label>
					<select name="shortcut_allowed" class="form-control" >
					<option value="1" selected>是</option>
					<option value="0">否</option>
				</select>
				</div>				
				<div class="form-group">
					<label>描述</label>
					<textarea name="menu_desc" rows="3" class="form-control"><{$_POST.module_desc}></textarea>
				</div>
				<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"><strong>提交</strong></button>
				</div>
			</form>
        </div>
    </div>
</div>
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>

<{include file ="common/ajaxSubmit.tpl"}>