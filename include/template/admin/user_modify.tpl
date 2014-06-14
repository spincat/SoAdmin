<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="well well-sm form-well">
	<ul class="nav nav-tabs">
		<li class="active"><a href="#home">请修改账号资料</a></li>
	</ul>	
	
	<div id="myTabContent" class="tab-content">
		<div class="tab-pane active in" id="home">

			<form id="tab" method="post" action="" autocomplete="off">
				<div class="form-group">
					<label>登录名 <span class="label label-info">不可修改</span></label>
					<input type="text" name="user_name" value="<{$user->user_name}>" class="form-control" readonly="true">
				</div>
				<div class="form-group">
					<label>密码 <span class="label label-important" >如不修改请留空</span></label>
					<input type="password" name="password" value="" class="form-control">
				</div>
				<div class="form-group">
					<label>姓名</label>
					<input type="text" name="real_name" value="<{$user->real_name}>" class="form-control"  required>
				</div>
				<div class="form-group">
					<label>手机</label>
					<input type="text" pattern="^[0-9]{11}$" length="11" name="mobile" value="<{$user->mobile}>" class="form-control" required>
				</div>
				<div class="form-group">
					<label>邮件</label>
					<input type="email" name="email" value="<{$user->email}>"  class="form-control"  required>
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea name="user_desc" rows="3" class="form-control"><{$user->user_desc}></textarea>
				</div>
				<div class="form-group">
					<label>账号组</label>
					<{if $user->id == 1}>
					<{html_options name=user_group id="DropDownTimezone" class="form-control" options=$group_options disabled="true" selected=$user->usergroup_id}>
					<{else }>
					<{html_options name=user_group id="DropDownTimezone" class="form-control" options=$group_options  selected=$user->usergroup_id}>
					<{/if }>
				</div>
				<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"><strong>提交</strong></button>
					<div class="btn-group"></div>
				</div>
			</form>
		</div>
	</div>
</div>	
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<script>
window.back_url = "<{$back_url}>";
</script>
<{include file ="common/ajaxSubmit.tpl"}>