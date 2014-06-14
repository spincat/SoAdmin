<?php
class GroupRole {

	public static function getGroupRoles($group_id) {
		if (! $group_id || ! is_numeric ( $group_id )) {
			return false;
		}
		$modules = Module::getAllModules(1);
		//用户组的权限
		foreach ( $modules as $k => $module ) {
			$menus = MenuUrl::getListByModuleId ($module->id,"role");
			$menu_info = array();
			foreach ( $menus as $menu ) {
				$menu_info[$menu->id] = $menu->menu_name;
			}
			$modules[$k]->menu_info = $menu_info;
		}
		return $modules;
	}
	
	public static function getGroupForOptions() {
		$group_list = UserGroup::getAllGroup ();
		foreach ( $group_list as $group ) {
			$group_options_array [$group->id] = $group->group_name;
		}
		
		return $group_options_array;
	}
	
}