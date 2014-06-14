<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->
<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
    
<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">菜单模块链接列表</a></li>
    </ul>	
	
	<div id="myTabContent" class="tab-content">
		  <div class="tab-list active in" id="home">

           <form id="tab" method="post" action="">
				 <table class="table table-hover">
              <thead>
                <tr>
					<th><input type="checkbox" id="checkAll" >全选</th>
					<th>#</th>
					<th>名称</th>
					<th>URL</th>
					<th>#Module</th>
					<th >菜单</th>
					<th >是否在线</th>
					<th >快捷菜单</th>
					<th>描述</th>
                </tr>
              </thead>
              <tbody>							  
                <{foreach name=menu from=$menus item=menu}>
					 
					<tr>
					 
					<td>
					<{if $menu->id <=100 }>
					<input type="checkbox" name="menu_ids[]" value="<{$menu->id}>" disabled>
					<{else }>
					<input type="checkbox" name="menu_ids[]" value="<{$menu->id}>" >
					<{/if }>
					</td>
					<td class="id"><a name="<{$menu->id}>"></a><{$menu->id}></td>
					<td><{$menu->menu_name}></td>
					<td><{$menu->menu_url}></td>
					<td><{$menu->module_id}></td>
					<td>
					<{if $menu->is_show}>
						是
					<{else}>
						否
					<{/if}>
					</td>
					<td>
					<{if $menu->online}>
						在线
					<{else}>
						已下线
					<{/if}></td>
					<td>
					<{if $menu->shortcut_allowed}>
						允许
					<{else}>
						不允许
					<{/if}>
					</td>
					<td><{$menu->menu_desc}></td>
					</tr>
				<{/foreach}>
              </tbody>
            </table> 
			<{if $module_id > 1 }>
			<div class="form-group">
			<label>选择菜单模块</label>
				<{html_options name=module id="DropDownTimezone" class="form-control" options=$module_options_list selected=0 }>
			</div>
			<div class="form-group">
				<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"><strong>修改菜单模块</strong></button>
				</div>
			</div>
			<{/if }>
			</form>
        </div>
    </div>
</div>

<script type="text/javascript">
$("#checkAll").click(function(){
     if($(this).attr("checked")){
		$("input[name='menu_ids[]']").attr("checked",$(this).attr("checked"));
	 }else{
		$("input[name='menu_ids[]']").attr("checked",false);
	 }
});
</script>

<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>