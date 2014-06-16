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
					<input type="text" name="module_name" value="<{$module->module_name}>" class="form-control" required="true" autofocus="true">
				</div>
				<div class="form-group">
					<label>模块链接</label>
					<input type="text" name="module_url" value="<{$module->module_url}>" class="form-control" required="true">
				</div>
				<div class="form-group inline clearfix">
					<label>模块图标</label>
					<span class="form-control span1 text-center"><i id="icon-preview" class="fa <{$module->module_icon}>"></i></span>
					<input class="form-control span3" id="icon-name" type="text" name="module_icon" value="<{$module->module_icon}>" placeholder="fa-icon">
					<span class="form-control span2 btn btn-info" id="icon-select">更改图标</span>
				</div>
				<{include file="admin/icon_select.tpl" }>
				
				<div class="form-group">
					<label>模块排序数字(数字越小越靠前)</label>
					<input type="text" name="module_sort" value="<{$module->module_sort}>" class="form-control" >
				</div>
				<label>是否有效</label>
				<{if $module->id ==1 }>
				<{html_options name=online id="DropDownTimezone" class="form-control" options=$module_online_optioins disabled="true" selected=$module->online}>
				<{else }>
				<{html_options name=online id="DropDownTimezone" class="form-control" options=$module_online_optioins selected=$module->online}>
				<{/if}>
				<div class="form-group">
					<label>描述</label>
					<textarea name="module_desc" rows="3" class="form-control"><{$module->module_desc}></textarea>
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