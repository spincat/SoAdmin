<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<{include file ='common/datepicker.tpl'}>
<!-- TPLSTART 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="btn-toolbar" style="margin-bottom:2px;">
	<a data-toggle="collapse" data-target="#search"  href="#" title= "检索"><button class="btn btn-primary" style="margin-left:5px"><i class="fa fa-search"></i> 检索</button></a>
</div>
<{if $_GET.search }>
<div id="search" class="collapse in">
	<{else }>
	<div id="search" class="collapse" >
		<{/if }>
		<form class="search-form container"  action="" method="GET">
			<div class="row">	
			<div class="form-group  col-md-3">
				<label>开始日期</label>
				<input type="text"  name="date_s" value="<{$_GET.date_s}>" class="publish_date form-control" >
			</div>
			<div class="form-group  col-md-3">
				<label>结束日期</label>
				<input type="text"  name="date_e" value="<{$_GET.date_e}>" class="publish_date form-control" >
			</div>
			<div class="form-group  col-md-3">
				<label>内容</label>
				 <input type="text" class="form-control" name="keyword" value="<{$_GET.keyword}>" placeholder="输入关键字" > 
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
		反馈列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>联系方式</th>
						<th style="width: 40%;">反馈内容</th>
						<th>IP</th>
						<th>反馈时间</th>
						<th>反馈状态</th>
						<th style="min-width: 80px;">操作</th>
					</tr>
				</thead>
				<tbody>							  
					<{foreach name=feedback from=$feedbacks item=feedback}>
					<tr>
						<td class="id"><a name="<{$feedback->id}>"></a><{$feedback->id}></td>
						<td><{$feedback->email}></td>
						<td><{$feedback->cont|truncate:32}></td>
						<td><{$feedback->clientip}></td>
						<td><{$feedback->createtime|date_format:"%Y-%m-%d %H:%M"}></td>
						<td><{if $feedback->status == 0}><span class="label label-danger">未查看</span>
							<{elseif $feedback->status == 1}><span class="label label-warning">待回复</span>
							<{else $feedback->status == 2}><span class="label label-success">已回复</span><{/if}></td>
							<td class="action"><a href="feedback_view.php?id=<{$feedback->id}>" title= "查看" ><i class="fa fa-eye"></i></a>
								&nbsp;<a class="confirm" action="del" title= "删除" ><i class="fa fa-times"></i></a>
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
<script>
$(function() {
	var date=$( ".publish_date" );
	date.datepicker();
});
</script>