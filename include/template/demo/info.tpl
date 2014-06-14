<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<{include file ='common/datepicker.tpl'}>
<!-- TPLSTART 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="btn-toolbar" style="margin-bottom:2px;">
    <a href="info_add.php" class="btn btn-primary"><i class="fa fa-plus"></i> 信息</a>
	<a data-toggle="collapse" data-target="#search"  href="#" title= "检索"><button class="btn btn-primary" style="margin-left:5px"><i class="fa fa-search"></i></button></a>
</div>
<{if $_GET.search }>
<div id="search" class="collapse in">
<{else }>
<div id="search" class="collapse" >
<{/if }>
<form class="search-form container"  action="" method="GET">
	<div class="row">	
	<div class="form-group col-md-3">
		<label>日期</label>
		<input type="text" id="publish_date" name="date" value="<{$_GET.date}>" class="form-control" >
	</div>
	<div class="form-group col-md-3">
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
		信息列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
			<thead>
			<tr>
        <th style="display:none">#</th>
        <th>日期</th>
        <th style="width: 60%;">内容</th>
        <th>出自</th>
        <th>作者</th>
        <th style="min-width: 80px;">操作</th>
			</tr>
			</thead>
			<tbody>							  
			<{foreach name=info from=$infos item=info}>
				<tr>
		<td class="id" style="display:none"><{$info->id}></td>
        <td><{$info->date}></td>
        <td><{$info->cont}></td>
        <td><{$info->source}></td>
        <td><{$info->user}></td>
        <td class="action"><a href="info_modify.php?id=<{$info->id}>" title= "修改" ><i class="fa fa-pencil"></i></a>
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
	var date=$( "#publish_date" );
	date.datepicker();
});
</script>