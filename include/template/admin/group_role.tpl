<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
<div class="row">
	<div class="form-group col-md-2">
		<select class="form-control" name="group_id" onchange="javascript:location.replace('group_role.php?group_id='+this.options[this.selectedIndex].value)">
			<{html_options options=$group_option_list selected=$group_id}>
		</select>
	</div>
</div>
<form id="tab" method="post" action="">
	<{foreach from=$role_list item=role}>
	<{if count($role->menu_info) >0 }>
	<div class="panel panel-default panel-list">
		<div class="panel-heading">
			<{$role->module_name}><a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target="#page-stats_<{$role->id}>"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
		</div>
		<div id="page-stats_<{$role->id}>" class="panel-body collapse in">
			<div class="wrapper">
				<{html_checkboxes name="ids" options=$role->menu_info checked=$group_role labels="1"}>						
			</div>
		</div>
	</div>
	<{/if }>
	<{/foreach}>
	<input type="hidden" class="menu_ids" name="menu_ids" value="">
	<div class="btn-toolbar">
		<button type="submit" class="btn btn-primary"><strong>更新</strong></button>
	</div>
</form>

<{include file="system/footer.tpl" }>
<{include file ="common/ajaxSubmit.tpl"}>
<script type="text/javascript" src="<{$admin_url}>/assets/js/jquery.json-2.4.min.js"></script>
<script>
	$("#tab").submit(function(e){
		var ids = $("#tab").serializeObject()['ids[]'];
    	$(".menu_ids").val($.toJSON(ids));
  	});
</script>