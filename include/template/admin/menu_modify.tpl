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
					<input type="text" name="menu_name" value="<{$menu.menu_name}>" class="form-control" required="true">
				</div>
				<div class="form-group">
					<label>链接 <span class="label label-important">不可重复</span></label>
					<input type="text" name="menu_url" value="<{$menu.menu_url}>" class="form-control" required="true" >
				</div>
				
				<label>所属模块</label>
				<{if $menu.id >100 }>
				<{html_options name=module_id id="DropDownTimezone" class="form-control" options=$module_options_list selected=$menu.module_id}>
				<{else }>
				<{html_options name=module_id id="DropDownTimezone" class="form-control" options=$module_options_list disabled="true" selected=$menu.module_id}>
				<{/if}>
				<label>是否显示为左侧菜单</label>
				<{html_options name=is_show id="DropDownTimezone" class="form-control" options=$show_options_list selected=$menu.is_show}>
				<label>所属菜单</label>
				<{html_options name=father_menu id="DropDownTimezone" class="form-control" options=$father_menu_options_list selected=$menu.father_menu}>
				<label>是否有效</label>
				<{html_options name=online id="DropDownTimezone" class="form-control" options=$online_options_list selected=$menu.online}>			 
				<label>是否允许快捷菜单 <span class="label label-important">修改/ 删除类链接不允许</span></label>
				<{html_options name=shortcut_allowed id="DropDownTimezone" class="form-control" options=$shortcut_allowed_options_list selected=$menu.shortcut_allowed}>
				<div class="form-group">
					<label>描述</label>
					<textarea name="menu_desc" rows="3" class="form-control"><{$menu.menu_desc}></textarea>
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