<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class MenuUrl extends Base {
	private static $table_name = 'menuurl';
	// 查询字段
	// private static $columns = 'id, menu_name, menu_url, module_id, is_show, online, shortcut_allowed,menu_desc,father_menu';
	const SESSION_NAME = 'osa_menuurl_list';
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function getMenuByRole($user_role,$online=1) {
		$url_array = array ();
		self::__instance();
		$sql ="select * from ".self::getTableName()." me ,".Module::getTableName()." mo where me.id in ($user_role) and me.online=? and me.module_id = mo.id and  mo.online=1";
		$menus = R::getAll($sql,array($online));
		if ($menus) {
			foreach ( $menus as $menu_info ) {
				$url_array [] = $menu_info['menu_url'];
			}
			return $url_array;
		}
		return array ();
	}
	
	public static function getMenuByUrl($url) {
		self::__instance();
		$menu = R::findOne(self::getTableName(),'menu_url=?',array($url));
		if ($menu) {
			 $module = Module::getModuleById($menu->module_id);
			 $menu->module_id=$module->id;
			 $menu->module_name=$module->module_name;
			 $menu->module_url=$module->module_url;
			 $menu->module_desc=$module->module_desc;
			 if($menu->father_menu>0){
				 $father_menu=self::getMenuById($menu->father_menu);
				 $menu->father_menu_url = $father_menu->menu_url;
				 $menu->father_menu_name = $father_menu->menu_name;
			 }
			 return $menu;
		}
		return array ();
	}
	
	public static function getListByModuleId($module_id,$type="all" ) {
		if (! $module_id || ! is_numeric ( $module_id )) {
			return array ();
		}
		$condition = '';
		switch ($type){
			case "sidebar":
				$condition = 'is_show = 1 and online = 1 and ';
				break;
			case "role":
				$condition = 'online = 1 and ';
				break;
			case "navibar":
				$condition = 'is_show = 1 and online = 1 and ';
				break;
			default:
		}
		$condition .= ' module_id = ? ';
		self::__instance();
		$menus = R::findAll(self::getTableName(),$condition,array($module_id));
		if ($menus) {
			return $menus;
		}
		return array ();
	}
	
	public static function getFatherMenuForOptions() {
		$menu_options_array=array("0"=>"无");
		$modules = Module::getAllModules();
		foreach($modules as $module){
			$menus = self::getListByModuleId($module->id,'navibar');
			foreach ($menus as $menu){
				$menu_options_array[$module->module_name][$menu->id]=$menu->menu_name;
			}
		}
		return $menu_options_array;
	}
	
	public static function addMenu($function_data) {
		if (! $function_data || ! is_array ( $function_data )) {
			return false;
		}
		self::__instance();
		$menu = R::dispense(self::getTableName());
		$menu = self::__addProperty($menu,$function_data);
		$id = R::store($menu);
		self::clearSession();
		return $id;
	}
	
	public static function getAllMenus($start ='' ,$page_size='') {
		self::__instance();
		$limit = '';
		$params = array();
		if($page_size){
			$limit = ' limit :start,:page_size ';
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		$menus = R::findAll(self::getTableName(),$limit,$params);
		$session_list = self::getSessionMenus();
		foreach($menus as &$menu){
			if($menu->father_menu>0){
				$menu->father_menu_name = $session_list[$menu->father_menu]->menu_name;
			}
		}
		if ($menus) {
			return $menus;
		}
		return array ();
	}
	
	public static function clearSession(){
		unset($_SESSION[self::SESSION_NAME]);
	}
	
	public static function getSessionMenus() {
		if(array_key_exists(self::SESSION_NAME,$_SESSION)){
			return $_SESSION[self::SESSION_NAME];
		}else{
			self::__instance();
			$list = R::findAll(self::getTableName());
			$new_list=array();
			foreach($list as $menu){
				$new_list[$menu->id] = $menu;
			}
			foreach($new_list as $menu_id =>&$menu){
				if($menu->father_menu>0){
					$menu->father_menu_name = $new_list[$menu->father_menu]->menu_name;
				}
			}
			if ($new_list) {
				$_SESSION[self::SESSION_NAME] = $new_list;
			}
			return $new_list;
		}	
	}
	
	public static function search($module_id,$menu_name,$start,$page_size) {
		self::__instance();
		$limit ="";
		$where = "";
		$params = array();
		if($page_size){
			$limit =" limit :start,:page_size ";
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		if($module_id >0  && $menu_name!=""){
			$where = " where me.module_id=:module_id and me.menu_name like :menu_name";
			$params['module_id'] = $module_id;
			$params['menu_name'] = '%'.$menu_name.'%';
		}else{
			if($module_id>0){
				$where = " where me.module_id=:module_id ";
				$params['module_id'] = $module_id;
			}
			if($menu_name!=""){
				$where = " where me.menu_name like :menu_name ";
				$params['menu_name'] = '%'.$menu_name.'%';
			}
		}

		$sql = "select me.*,coalesce(mo.module_name,'已删除') module_name from ".self::getTableName()." me left join ".Module::getTableName()." mo on me.module_id = mo.id $where order by me.module_id,me.id $limit";
		$menus=R::getAll($sql,$params);
		$menus = R::convertToBeans(self::getTableName(),$menus);
		$session_list = self::getSessionMenus();
		foreach($menus as &$menu){
			if($menu->father_menu>0){
				$menu->father_menu_name = $session_list[$menu->father_menu]->menu_name;
			}
		}
		if ($menus) {
			return $menus;
		}
		return array ();
	}
	
	public static function count() {
		self::__instance();
		$num = R::count(self::getTableName());
		return $num;
	}
	
	public static function countSearch($module_id,$menu_name) {
		self::__instance();
		$condition = '';
		$params = array();
		if($module_id >0  && $menu_name!=""){
			$condition = ' module_id = :module_id and menu_name like :menu_name ';
			$params['module_id'] = $module_id;
			$params['menu_name'] = $menu_name;
		}else{
			if($module_id>0){
				$condition = ' module_id = :module_id ';
				$params['module_id'] = $module_id;;
			}
			if($menu_name!=""){
				$condition = ' menu_name like :menu_name ';
				$params['menu_name'] = $menu_name;;
			}
		}
		$num = R::count(self::getTableName(),$condition,$params);
		return $num;
	}
	
	public static function delMenu($menu_id) {
		if (! $menu_id || ! is_numeric ( $menu_id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id=?',array($menu_id));
		return $result;
	}
	
	public static function getMenuById($menu_id) {
		if (! $menu_id || ! is_numeric ( $menu_id )) {
			return false;
		}
		self::__instance();
		$menu = R::load(self::getTableName(),$menu_id);
		if ($menu) {
			return $menu;
		}
		
		return array ();
	}
	
	
	public static function getMenuByIds($menu_ids,$online=null,$shortcut_allowed=null) {
		$condition = ' id in ('.(empty($menu_ids)?'null':$menu_ids).')';
		$params = array();
		if(isset($online)){
			$condition= ' and online = :online ';
			$params['online'] = $online;
		}
		if(isset($shortcut_allowed)){
			$condition= ' and shortcut_allowed = :shortcut_allowed ';
			$params['shortcut_allowed'] = $shortcut_allowed;
		}
		self::__instance();
		$menus = R::findAll(self::getTableName(),$condition,$params);
		if ($menus) {
			return $menus;
		}
		return array ();
	}
	
	public static function updateMenuInfo($menu_id,$function_data) {
		if (! $function_data || ! is_array ( $function_data )) {
			return false;
		}
		self::__instance();
		$menu = R::load(self::getTableName(),$menu_id);
		$menu = self::__addProperty($menu,$function_data);
		$id = R::store($menu);
		return $id;
	}
	
	/**
	* 批量修改菜单，如批量修改所属模块
	* menu_ids 可以为无key数组，也可以为1,2,3形势的字符串
	*/
	public static function batchUpdateMenus($menu_ids,$function_data) {
		if (! $function_data || ! is_array ( $function_data )) {
			return false;
		}
		if(!is_array($menu_ids)){
			$menu_ids=explode(',',$menu_ids);
		}
		self::__instance();
		$menus = R::batch(self::getTableName(),$menu_ids);
		$menus = self::__batchAddProperty($menus,$function_data);
		$ids = R::storeAll($menus);
		return $ids;
	}
}