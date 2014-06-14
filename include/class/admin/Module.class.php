<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class Module extends Base {
	// 表名
	private static $table_name = 'module';
	// 查询字段
	// private static $columns = 'id, module_name, module_url, module_sort, module_desc,module_icon,online';
	public static function getTableName(){
		return self::$table_name;
	}
	//列表 
	public static function getAllModules($is_online=null) {
		self::__instance();
		$order = ' order by module_sort asc,id asc ';
		$condition = '';
		$params = array();
		if($is_online){
			$condition = ' online = ? ';
			array_push($params,$is_online);
		}
		$modules = R::findAll(self::getTableName(),$condition.$order,$params);
		if ($modules) {
			return $modules;
		}
		return array ();
	}
	
	public static function addModule($module_data) {
		if (! $module_data || ! is_array ( $module_data )) {
			return false;
		}
		self::__instance();
		$module = R::dispense(self::getTableName());
		$module = self::__addProperty($module,$module_data);
		$id = R::store($module);
		return $id;
	}
	
	public static function getModuleById($module_id) {
		if (! $module_id || ! is_numeric ( $module_id )) {
			return false;
		}
		self::__instance();
		$module = R::load(self::getTableName(),$module_id);
		if ($module) {
			return $module;
		}
		return array ();
	}
	
	public static function getModuleByName($module_name) {
		if (! $module_name || ! is_numeric ( $module_name )) {
			return false;
		}
		self::__instance();
		$module = R::findOne(self::getTableName(),' module_name = ? ',array($module_name));
		if ($module) {
			return $module;
		}
		return array ();
	}
	
	public static function getModuleMenu($module_id) {
		if (! $module_id || ! is_numeric ( $module_id )) {
			return false;
		}
		self::__instance();
		$sql="select * from ".self::getTableName() ." m,".MenuUrl::getTableName()." u where m.id = ? and m.id = u.module_id order by m.id,u.id";
		$modules = R::getAll($sql,array($module_id));
		$modules = R::convertToBeans(self::getTableName(),$modules);
		if ($modules) {
			return $modules[$module_id];
		}
		return array ();
	}
	
	public static function updateModuleInfo($module_id,$module_data) {
		if (! $module_data || ! is_array ( $module_data )) {
			return false;
		}
		self::__instance();
		$module = R::load(self::getTableName(),$module_id);
		$module = self::__addProperty($module,$module_data);
		$id = R::store($module);
		return $id;
	}
	
	public static function delModule($module_id) {
		if (! $module_id || ! is_numeric ( $module_id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id=?',array($module_id));
		return $result;
	}
	
	public static function getModuleForOptions() {
		$module_options_array = array ();
		$module_list = self::getAllModules (1);
		foreach ( $module_list as $module ) {
			$module_options_array [$module->id] = $module->module_name;
		}
		
		return $module_options_array;
	}
}
