<div id="container" class="container main">
	<div class="row">

		<div class="nav-wrap">
			<nav id="menu" class="navbar navbar-inverse" role="navigation">
				<ul id="menu-list" class="nav nav-pills nav-stacked">
					<li>
						<div class="sidebar-toggler"></div>
					</li>
					<{foreach from=$sidebar item=module}>
							<{if $module->id == $current_module_id }>
								<li class="nav-li active">
									<{if $module->menu_list|count == 0}>
										<a href="<{$smarty.const.ADMIN_URL}><{$module->module_url}>">
										<i class="fa <{$module->module_icon}>"></i><span calss="module-wrap"><{$module->module_name}></span>
									<{else}>
										<a data-toggle="collapse" data-parent="#menu-list" href="#sidebar_menu_<{$module->id}>">
										<i class="fa <{$module->module_icon}>"></i><span calss="module-wrap"><{$module->module_name}></span>
										<i class="collapse fa fa-angle-left"></i><i class="collapse on fa fa-angle-down"></i>
									<{/if}>
										<span class="selected"></span>
									</a>
								<ul id="sidebar_menu_<{$module->id}>" class="nav collapse in sub-menu">
							<{else}>
								<li class="nav-li">
									<{if $module->menu_list|count == 0}>
										<{if strtolower(substr($module->module_url,0,7))=='http://'}>
											<a target=_blank href="<{$module->module_url}>">
										<{else}>
											<a href="<{$smarty.const.ADMIN_URL}><{$module->module_url}>">
										<{/if}>
										<i class="fa <{$module->module_icon}>"></i><span calss="module-wrap"><{$module->module_name}></span>
									<{else}>
										<a data-toggle="collapse" data-parent="#menu-list" href="#sidebar_menu_<{$module->id}>">
										<i class="fa <{$module->module_icon}>"></i><span calss="module-wrap"><{$module->module_name}></span>
										<i class="collapse on fa fa-angle-left"></i><i class="collapse fa fa-angle-down"></i>
									<{/if}>
									</a>
								<ul id="sidebar_menu_<{$module->id}>" class="nav collapse sub-menu">
							<{/if}>
							<{foreach from=$module->menu_list item=menu_list name=menu_url_list}>
								<{if strtolower(substr($menu_list->menu_url,0,7))=='http://'}>
									<li><a target=_blank href="<{$menu_list->menu_url}>"><{$menu_list->menu_name}></a></li>
								<{else}>
									<{if $content_header->id==$menu_list->id}>
									<li><a class="on" href="<{$smarty.const.ADMIN_URL}><{$menu_list->menu_url}>"><{$menu_list->menu_name}></a></li>
									<{else}>
									<li><a href="<{$smarty.const.ADMIN_URL}><{$menu_list->menu_url}>"><{$menu_list->menu_name}></a></li>
									<{/if}>
								<{/if}>
							<{/foreach}>
							</ul>
						</li>
					<{/foreach}>
				</ul>
			</nav>
		</div>
		<!-- End By NavWrap -->

		<div class="content-wrap">
			<div class="content">
				<div class="header">
					<p>
						<span class="father-menu"><{$content_header->module_name}></span><span class="child-menu"><{$content_header->module_desc}></span>
					</p>
				</div>
				<ol class="breadcrumb">
					<i class="fa fa-home"></i>
					<li><a href="<{$smarty.const.ADMIN_URL}>">首页</a></li>
					<i class="fa fa-angle-right"></i>
					<li><a href="<{$smarty.const.ADMIN_URL}><{$content_header->module_url}>"><{$content_header->module_name}></a></li>
					<{if $content_header->father_menu}>
						<i class="collapse fa fa-angle-right"></i>
						<li><a href="<{$smarty.const.ADMIN_URL}><{$content_header->father_menu_url}>"><{$content_header->father_menu_name}></a></li>
					<{/if}>
					<{if $content_header->menu_url != $content_header->module_url}>
						<i class="fa fa-angle-right"></i>
						<li><a href="<{$content_header.menu_url}>"><{$content_header->menu_name}></a></li>
					<{/if}>
					<{if $content_header->shortcut_allowed}>
						<{if $content_header->id|in_array:$user_info.shortcuts_arr}>
						<li class="shortcut active"><a class="shortcut-opt" title= "移除快捷菜单" method="del" url="<{$smarty.const.ADMIN_URL}>/ajax/shortcut.php?menu_id=<{$content_header->id}>"><i class="fa fa-minus"></i></a></li>
						<li class="shortcut"><a class="shortcut-opt" title= "加入快捷菜单" method="add" url="<{$smarty.const.ADMIN_URL}>/ajax/shortcut.php?menu_id=<{$content_header->id}>"><i class="fa fa-plus"></i></a></li>
						<{else}>
						<li class="shortcut active"><a class="shortcut-opt" title= "加入快捷菜单" method="add" url="<{$smarty.const.ADMIN_URL}>/ajax/shortcut.php?menu_id=<{$content_header->id}>"><i class="fa fa-plus"></i></a></li>
						<li class="shortcut"><a class="shortcut-opt" title= "移除快捷菜单" method="del" url="<{$smarty.const.ADMIN_URL}>/ajax/shortcut.php?menu_id=<{$content_header->id}>"><i class="fa fa-minus"></i></a></li>
						<{/if}>
					<{/if}>
				</ol>
				<div class="container">
					<div class="row">
						<div class="opt-info alert alert-info" style="display: none;">
							<span>操作成功</span>
						</div>
					</div>
				</div>
			</div>
			<!-- End By Content-->

