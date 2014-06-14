<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- TPLSTART 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
<div class="btn-toolbar">
	<a href="quicknote_add.php"  class="btn btn-primary"><i class="fa fa-plus"></i> Quick Note</a>
</div>
<div class="panel panel-default panel-list">
	<div class="panel-heading">
		Quick Note列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>#</th>
					<th>所有者</th>
					<th>内容</th>
					<th width="80px">操作</th>
				</tr>
			</thead>
			<tbody>							  
				<{foreach name=note from=$quicknotes item=note}>

				<tr>

					<td class="id"><a name="<{$note->id}>"></a><{$note->id}></td>
					<td><{$note->owner_name}></td>
					<td><{$note->note_content}></td>
					<td class="action">
						<{if $user_group ==1 || $note->owner_id == $current_user_id }>
						<a href="quicknote_modify.php?note_id=<{$note->id}>" title= "修改" ><i class="fa fa-pencil"></i></a>
						&nbsp;
						<a class="confirm" action="del" title= "删除" ><i class="fa fa-times"></i></a>
						<{/if}>
					</td>
				</tr>
				<{/foreach}>
			</tbody>
		</table>
		<!-- START 分页模板 -->

		<{$page_html}>

		<!-- END -->
	</div>
</div>


<!-- TPLEND 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<{include file="common/ajaxAction.tpl" }>