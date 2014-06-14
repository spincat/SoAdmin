<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>

<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="btn-toolbar">
    <a href="user_add.php" class="btn btn-primary"><i class="fa fa-plus"></i> 账号</a>
	<a data-toggle="collapse" data-target="#search"  href="#" title= "检索">
		<button class="btn btn-primary"><i class="fa fa-search"></i></button>
	</a>
</div>

<{if $_GET.search }>
<div id="search" class="collapse in">
<{else }>
<div id="search" class="collapse" >
<{/if }>
	<form class="search-form container"  action="" method="GET">
		<div class="row">
			<div class="form-group col-md-3">
				<label>选择账号组</label>
				<{html_options name=user_group id="DropDownTimezone" class="form-control" options=$group_options selected=$_GET.user_group}>
			</div>
			<div class="form-group col-md-3">
				<label>查询所有用户请留空</label>
				<input class="form-control" type="text" name="user_name" value="<{$_GET.user_name}>" placeholder="输入登录名" > 
				<input type="hidden" name="search" value="1" > 
			</div>
			<div class="button form-group col-md-3">
				<button type="submit" class="btn btn-primary">检索</button>
			</div>
		</div>
	</form>
</div>

<div class="panel panel-default panel-list">
	<div class="panel-heading">
		账号列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
			<thead>
				<tr>
					<th style="width:20px">#</th>
					<th style="width:70px">登录名</th>
					<th style="width:70px">姓名</th>
					<th style="width:90px">手机</th>
					<th style="width:130px">邮箱</th>
					<th style="width:130px">登录时间</th>
					<th style="width:90px">登录IP</th>
					<th style="width:80px">帐号组</th>
					<th style="width:80px">描述</th>
					<th style="width:80px">操作</th>
				</tr>
			</thead>
			<tbody>							  
				<{foreach name=user from=$user_list item=user}>				 
				<tr>
					<td class="id"><a name="<{$user->id}>"></a><{$user->id}></td>
					<td><{$user->user_name}></td>
					<td><{$user->real_name}></td>
					<td><{$user->mobile}></td>
					<td><{$user->email}></td>
					<td><{$user->login_time}></td>
					<td><{$user->login_ip}></td>
					<td><{$user->group_name}></td>
					<td><{$user->user_desc}></td>
					<td class="action">
						<a href="user_modify.php?user_id=<{$user->id}>" title= "修改" ><i class="fa fa-pencil"></i></a>
						&nbsp;
						<{if $user->id != 1}>
						<{if $user->status == 1}>
						<a class="confirm" action="block" title= "封停账号" ><i class="fa fa-pause"></i></a>
						<{/if }>
						<{if $user->status == 0}>
						<a class="confirm" action="unblock" title= "解封账号" ><i class="fa fa-play"></i></a>
						<{/if }>
						&nbsp;
						<a class="confirm" action="del" title= "删除账号" ><i class="fa fa-times"></i></a>
						<{/if}>
					</td>
				</tr>
				<{/foreach}>
			</tbody>
		</table> 
		<!-- START 分页模板 -->
		<{$page_html}>
	</div>

</div>


<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<{include file="common/ajaxAction.tpl" }>