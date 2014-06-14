<{include file ="./header.tpl"}>
<{include file ="./navibar.tpl"}>
<{include file ="./sidebar.tpl"}>
<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

			<div class="panel panel-default">
			  <div class="panel-heading">快捷菜单</div>
			  <div class="panel-body">
			    <p>
					<{if count($menus) >0  }>
					<{foreach name=menu from=$menus item=menu}>
						<a class="shortcut" href="<{$smarty.const.ADMIN_URL}><{$menu->menu_url}>">
						<{$menu->menu_name}>
						</a>
					<{/foreach}>
					<{/if}>
					</p>
			  </div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">当前用户信息</div>
				<table class="table table-hover">  
					<tr>
						<td>用户名</td>
						<td>真实姓名</td>
						<td>手机号</td>
						<td>Email</td>
						<td>登录时间</td>
						<td>登录IP</td>
					</tr>
					<tr>
						<td><{$user_info.user_name}></td>
						<td><{$user_info.real_name}></td>
						<td><{$user_info.mobile}></td>
						<td><{$user_info.email}></td>
						<td><{$user_info.login_time}></td>
						<td><{$user_info.login_ip}></td>
					</tr>
				</table>
			</div>
			<div class="alert alert-success">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<strong>注意！</strong>请保管好您的个人信息，一点发生密码泄露请紧急联系管理员。
			</div>

<{include file="./footer.tpl"}>
