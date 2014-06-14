<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- TPLSTART 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
<div class="btn-toolbar">
	<a href="group_add.php" class="btn btn-primary"><i class="fa fa-plus"></i> 账号组</a>
</div>
<div class="panel panel-default panel-list">
	<div class="panel-heading">
		账号组列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>账号组名</th>
					<th>所有者</th>
					<th>描述</th>
					<th width="80px">操作</th>
				</tr>
			</thead>
			<tbody>							  
				<{foreach name=group from=$groups item=group}>
				<tr>
					<td class="id"><a name="<{$group->id}>"></a><{$group->id}></td>
					<td><{$group->group_name}></td>
					<td><{$group->owner_name}></td>
					<td><{$group->group_desc}></td>
					<td class="action">
						<a href="group.php?group_id=<{$group->id}>" title= "成员列表" ><i class="fa fa-list-alt"></i></a>
						&nbsp;
						<a href="group_modify.php?group_id=<{$group->id}>" title= "修改账号组" ><i class="fa fa-pencil"></i></a>
						&nbsp;

						<{if $group->id != 1 }>
						<a class="confirm" action="del" title= "删除账号组" ><i class="fa fa-times"></i></a>
						<{/if }>
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