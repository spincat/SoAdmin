<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->
<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="well well-sm form-well">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home"><{$group.group_name}>成员列表</a></li>
	</ul>	
	
	<div id="myTabContent" class="tab-content">
		<div class="tab-list active in" id="home">

			<form id="tab" method="post" action="">
				<table class="table table-hover">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th>#</th>
							<th>登录名</th>
							<th>姓名</th>
							<th>手机</th>
							<th>邮箱</th>
							<th>登录时间</th>
							<th>登录IP</th> 
							<th>Group#</th>
							<th>描述</th>
						</tr>
					</thead>
					<tbody>							  
						<{foreach name=user from=$user_infos item=user_info}>
						<tr>
							<td><input type="checkbox" name="user_ids[]" value="<{$user_info.id}>" <{if $user_info.id == 1}>disabled<{/if}>></td>
							<td><{$user_info.id}></td>
							<td><{$user_info.user_name}></td>
							<td><{$user_info.real_name}></td>
							<td><{$user_info.mobile}></td>
							<td><{$user_info.email}></td>
							<td><{$user_info.login_time}></td>
							<td><{$user_info.login_ip}></td>
							<td><{$user_info.usergroup_id}></td>
							<td><{$user_info.user_desc}></td>
						</tr>
						<{/foreach}>
					</tbody>
				</table> 
				<div class="form-group">
					<label>选择账号组</label>
					<{html_options name=user_group id="DropDownTimezone" class="form-control" options=$groupOptions selected=$group.id}>
				</div>
				<div class="form-group">
					<div class="btn-toolbar">
						<button type="submit" class="btn btn-primary"><strong>修改账号组</strong></button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<script type="text/javascript">
	$("#checkAll").click(function(){
		if($(this).attr("checked")){
			$("input[name='user_ids[]']").attr("checked",$(this).attr("checked"));
		}else{
			$("input[name='user_ids[]']").attr("checked",false);
		}
	});
	</script>

	<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
	<{include file="system/footer.tpl" }>
	<{include file="common/ajaxAction.tpl" }>