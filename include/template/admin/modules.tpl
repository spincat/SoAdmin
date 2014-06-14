<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- TPLSTART 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
<div class="btn-toolbar">
	<a href="module_add.php" class="btn btn-primary"><i class="fa fa-plus"></i> 模块</a>
</div>
<div class="panel panel-default panel-list">
	<div class="panel-heading">
		模块列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
			<thead>
			<tr>
				<th>#</th>
				<th>模块名</th>
				<th>模块链接</th>
				<th>排序</th>
				<th>是否在线</th>
				<th>描述</th>
				<th>图标</th>
				<th width="80px">操作</th>
			</tr>
			</thead>
			<tbody>							  
			<{foreach name=module from=$modules item=module}>
				 
				<tr>
				 
				<td class="id"><a name="<{$module->id}>"></a><{$module->id}></td>
				<td><{$module->module_name}></td>
				<td><{$module->module_url}></td>
				<td><{$module->module_sort}></td>
				<td>
					<{if $module->online}>
						在线
					<{else}>
						已下线
					<{/if}>
				</td>
				<td><{$module->module_desc}></td>
				<td><i class="fa <{$module->module_icon}>"></i></td>
				<td class="action">
				<a href="module.php?module_id=<{$module->id}>" title= "菜单链接列表" ><i class="fa fa-list-alt"></i></a>
				&nbsp;
				<a href="module_modify.php?module_id=<{$module->id}>" title= "修改" ><i class="fa fa-pencil"></i></a>
				&nbsp;
				<{if $module->id != 1 }>
				<a class="confirm" action="del" title= "删除模块" ><i class="fa fa-times"></i></a>
				<{/if}>
				</td>
				</tr>
			<{/foreach}>
		  </tbody>
		</table>  
	</div>
</div>

	
<!-- TPLEND 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<{include file="common/ajaxAction.tpl" }>