<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div>
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
				<label>请选择操作记录类型</label>
				<{html_options class="form-control" name=class_name id="DropDownTimezone"  options=$class_options selected=$_GET.class_name}> 
			</div>
			<div class="form-group col-md-3">
				<label> 选择起始时间 </label>
				<input type="text" class="form-control" id="start_date" name="start_date" value="<{$_GET.start_date}>" placeholder="起始时间" >
			</div>
			<div class="form-group col-md-3">
				<label>选择结束时间</label>
				<input type="text" class="form-control" id="end_date" name="end_date" value="<{$_GET.end_date}>" placeholder="结束时间" > 
			</div>
			<div class="form-group col-md-3">
				<label>用户名，查询所有用户请留空</label>
				<input type="text" class="form-control" name="user_name" value="<{$_GET.user_name}>" placeholder="输入用户名" > 
			</div>
			<div class="button form-group col-md-3">
				<button type="submit" class="btn btn-primary">检索</button>
			</div>
		</form>
	</div>
</div>

    <div class="panel panel-default panel-list">
	<div class="panel-heading">
		操作记录<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
              <thead>
                <tr>
					<th style="width:30px">#</th>
					<th style="width:50px">操作员</th>
					<th style="width:35px">行为</th>
					<th style="width:35px">类型</th>
					<th style="width:35px">对象</th>
					<th style="width:250px">操作结果</th>
					<th style="width:100px">操作时间</th>
                </tr>
              </thead>
              <tbody>							  
                <{foreach name=sys_log from=$sys_logs item=sys_log}>
					<tr>
					<td class="id"><a name="<{$sys_log->id}>"></a><{$sys_log->id}></td>
					<td><{$sys_log->user_name}></td>
					<td><{$sys_log->action}></td>
					<td><{$sys_log->class_name}></td>
					<td><{$sys_log->class_obj}></td>
					<td style = "word-break: break-all; word-wrap:break-word;"><{$sys_log->result}></td>
					<td><{$sys_log.op_time}></td>
					
					</tr>
				<{/foreach}>
              </tbody>
            </table>
				<!-- START 分页模板 -->
               <{$page_html}>
			   <!-- END -->
        </div>
    </div>

<script>
$(function() {
	var date=$( "#start_date" );
	date.datepicker({ dateFormat: "yy-mm-dd" });
	date.datepicker( "option", "firstDay", 1 );
});
$(function() {
	var date=$( "#end_date" );
	date.datepicker({ dateFormat: "yy-mm-dd" });
	date.datepicker( "option", "firstDay", 1 );
});
</script>
	
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>