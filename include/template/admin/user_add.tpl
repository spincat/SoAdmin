<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>
    
<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">请填写账号资料</a></li>
    </ul>	
	
    <div id="myTabContent" class="tab-content">
    	<div class="tab-pane active in" id="home">
    		<form id="tab" method="post" action="" role="form">
    			<div class="form-group">
    				<label>登录名</label>
    				<input type="text" name="user_name" value="<{$_POST.user_name}>" class="form-control"  required>
    			</div>
    			<div class="form-group">					
    				<label>密码</label>
    				<input type="password" name="password" value="<{$_POST.password}>" class="form-control"  required>
    			</div>
    			<div class="form-group">
    				<label>姓名</label>
    				<input type="text" name="real_name" value="<{$_POST.real_name}>" class="form-control"  required>
    			</div>
    			<div class="form-group">
    				<label>手机</label>
    				<input type="text" pattern="^[0-9]{11}$" length="11" name="mobile" value="<{$_POST.mobile}>" class="form-control" required>
    			</div>
				<div class="form-group">
	    			<label>邮件</label>
	    			<input type="email" name="email" value="<{$_POST.email}>"  class="form-control"  required>
				</div>
				<div class="form-group">
	    			<label>描述</label>
	    			<textarea name="user_des</div>c" rows="3" class="form-control"><{$_POST.user_desc}></textarea>
    			</div>
				<div class="form-group">
	    			<label>账号组</label>
	    			<{html_options name=user_group id="DropDownTimezone" class="form-control" options=$group_options selected=0}>
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

<{include file ="common/ajaxSubmit.tpl"}>