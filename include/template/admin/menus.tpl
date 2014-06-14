<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>

<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmin_action_alert}>
<{$osadmin_quick_note}>

<div class="btn-toolbar"  style="margin-bottom:2px;">
    <a href="menu_add.php"  class="btn btn-primary"><i class="fa fa-plus"></i> 功能</a>
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
		<label>选择菜单模块</label>
		<{html_options name=module_id id="DropDownTimezone" class="form-control" options=$module_options_list selected=$_GET.module_id}>
	</div>
	<div class="form-group col-md-3">
		<label>查询所有请留空</label>
		 <input type="text" class="form-control" name="menu_name" value="<{$_GET.menu_name}>" placeholder="输入菜单名称" > 
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
		功能列表<a href="javacript:;" class="block-heading collapse-switch" data-toggle="collapse" data-target=".panel-body"><i class="fa fa-chevron-up on"></i><i class="fa fa-chevron-down"></i></a>
	</div>
	<div class="panel-body collapse in">
		<table class="table table-hover">
              <thead>
                <tr>
					<th style="width:30px">#</th>
					<th style="width:90px">名称</th>
					<th style="width:180px">URL</th>
					<th style="width:80px">所属模块</th>
					<th style="width:80px">菜单</th>
					<th style="width:80px">所属菜单</th>
					<th style="width:80px">是否在线</th>
					<th style="width:80px">快捷菜单</th>
					<th style="width:180px">描述</th>
					<th style="width:80px">操作</th>
                </tr>
              </thead>
              <tbody>							  
                <{foreach name=menu from=$menus item=menu}>
					 
					<tr>
					 
					<td class="id"><a name="<{$menu->id}>"></a><{$menu->id}></td>
					<td><{$menu->menu_name}></td>
					<td><{$menu->menu_url}></td>
					<td><{$module_options_list[$menu->module_id]}></td>
					<td>
					<{if $menu->is_show}>
						是
					<{else}>
						否
					<{/if}>
					</td>
					<td><{if $menu->father_menu>0}><{$menu->father_menu_name}><{/if}></td>
					
					<td>
					<{if $menu->online}>
						在线
					<{else}>
						已下线
					<{/if}></td>
					<td>
					<{if $menu->shortcut_allowed}>
						允许
					<{else}>
						不允许
					<{/if}>
					</td>
					<td><{$menu->menu_desc}></td>
				
					<td class="action">
					<a href="menu_modify.php?menu_id=<{$menu->id}>" title= "修改" ><i class="fa fa-pencil"></i></a>
					
					<{if $menu->id > 100}>
					&nbsp;
					<a class="confirm" action="del" title= "删除" ><i class="fa fa-times"></i></a>
					<{/if }>
					</td>
					</tr>
				<{/foreach}>
              </tbody>
            </table> 
<!-- START 分页模板 -->
               <{$page_html}>
<!-- END 分页-->			   
        </div>
    </div>
	
	
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<{include file="common/ajaxAction.tpl" }>