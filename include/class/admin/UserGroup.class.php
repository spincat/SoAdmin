<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class UserGroup extends Base {
	// 表名
	private static $table_name = 'usergroup';
	// 查询字段
	// private static $columns = 'id, group_name, group_role, owner_id , group_desc';
	public static function getTableName(){
		return self::$table_name;
	}
	
	//列表 
	public static function getAllGroup() {
		self::__instance();
		$sql="select g.*,u.user_name as owner_name from ".self::getTableName()." g left join ".User::getTableName()." u on g.owner_id =  u.id order by g.id";
		$groups = R::getAll($sql);
		$groups = R::convertToBeans(self::getTableName(),$groups);
		if ($groups) {
			return $groups;
		}
		return array ();
	}
	
	public static function addGroup($group_data) {
		if (! $group_data || ! is_array ( $group_data )) {
			return false;
		}
		self::__instance();
		$group = R::dispense(self::getTableName());
		$group = self::__addProperty($group,$group_data);
		$id = R::store($group);
		return $id;
	}

	public static function getGroupById($group_id) {
		if (! $group_id || ! is_numeric ( $group_id )) {
			return false;
		}
		self::__instance();
		$group = R::load(self::getTableName(),$group_id);
		if ($group) {
			return $group;
		}
		return array ();
	}
	
	public static function getGroupByName($group_name) {
		if ( $group_name == "" ) {
			return false;
		}
		self::__instance();
		$group = R::findOne(self::getTableName(),' group_name = ? ',array($group_name));
		if ($group) {
			return $group;
		}
		return array ();
	}
	
	public static function updateGroupInfo($group_id,$group_data) {
		if (! $group_data || ! is_array ( $group_data )) {
			return false;
		}
		self::__instance();
		$group = R::load(self::getTableName(),$group_id);
		$group = self::__addProperty($group,$group_data);
		$id = R::store($group);
		return $id;
	}
	
	public static function delGroup($group_id) {
		if (! $group_id || ! is_numeric ( $group_id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id=?',array($group_id));
		return $result;
	}
	
	public static function getGroupForOptions() {
		$group_list = self::getAllGroup ();
		foreach ( $group_list as $group ) {
			$group_options_array [$group->id] = $group->group_name;
		}
		
		return $group_options_array;
	}
	
	public static function getGroupUsers($group_id) {
		self::__instance();
		$sql="select g.*,u.id as user_id,u.user_name as user_name,u.real_name as real_name from ".self::getTableName()." g,".User::getTableName()." u where g.id = :group_id and g.id = u.usergroup_id order by g.id,u.id";
		$users = R::getAll($sql,array('group_id'=>$group_id));
		$users = R::convertToBeans(self::getTableName(),$users);
		if ($users) {
			return $users;
		}
		return array ();
	}
}
