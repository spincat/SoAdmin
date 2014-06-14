<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>


<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
		<{if $change_password }>
			<li ><a href="#home" data-toggle="tab">资料</a></li>
			<li class="active"><a href="#profile" data-toggle="tab">密码</a></li>
		<{else }>
			<li class="active"><a href="#home" data-toggle="tab">资料</a></li>
			<li><a href="#profile" data-toggle="tab">密码</a></li>
		<{/if}>
    </ul>
    <div id="myTabContent" class="tab-content">
		
		<{if $change_password }>
		  <div class="tab-pane fade" id="home">
		<{else }>
		  <div class="tab-pane active in" id="home">
		<{/if}>
			<form id="tab" method="post" action="" autocomplete="off">
				<div class="form-group">
					<label>登录名</label>
					<input type="text" name="user_name" value="<{$user_info.user_name}>" class="form-control" readonly="true">
				</div>
				<div class="form-group">
					<label>姓名</label>
					<input type="text" name="real_name" value="<{$user_info.real_name}>" class="form-control">
				</div>
				<div class="form-group">
					<label>手机</label>
					<input type="text" name="mobile" value="<{$user_info.mobile}>" class="form-control">
				</div>
				<div class="form-group">
					<label>邮件</label>
					<input type="text" name="email" value="<{$user_info.email}>" class="form-control">
				</div>
				<div class="form-group">
					<label>邮件密码</label>
					<input type="password" name="email_password" value="<{$user_info.email_password}>" class="form-control">
				</div>
				<div class="form-group">
					<label>描述</label>
					<textarea name="user_desc" value="Smith" rows="3" class="form-control"><{$user_info.user_desc}></textarea>
				</div>
				<div class="form-group">
					<label>显示QuickNote</label>	
					<{html_options name=show_quicknote id="DropDownTimezone" class="form-control" options=$quicknoteOptions selected=$user_info.show_quicknote}>
				</div>
				<div class="btn-toolbar">
					<button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> 保存</button>
					<div class="btn-group"></div>
				</div>
			</form>
		  </div>
		<{if $change_password }>
		<div class="tab-pane active in" id="profile">
		<{else }>
		<div class="tab-pane fade" id="profile">
		<{/if}>
		<form id="tab2" method="post" action="" autocomplete="off">
			<input type="hidden" name="change_password" value="yes" >
			<div class="form-group">
				<label>原密码</label>
				<input type="password" name="old" class="form-control">
			</div>
			<div class="form-group">
				<label>新密码</label>
				<input type="password" name="new" class="form-control">
			</div>
			<div class="btn-toolbar">
				<button class="btn btn-primary">更新</button>
				<div class="btn-group"></div>
			</div>
			</form>
		</div>
  </div>
</div>
<{include file="system/footer.tpl" }>