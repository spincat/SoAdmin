<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class System extends Base{
	private static $table_name = 'system';
	private static $columns = 'id,key_name, key_value';
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function set($key_name, $key_value) {
	
		$key_value= json_encode($key_value);
		$sql = "insert into ".self::getTableName() ." (key_name,key_value) values (:key_name ,:key_value) on duplicate key update key_value=:key_value";
		self::__instance();
		$id = R::exec($sql,array('key_name'=>$key_name,'key_value'=>$key_value));
		return $id;
	}
	
	public static function get($key_name) {
		self::__instance();
		$key = R::findOne(self::getTableName(),'key_name = ?',array($key_name));
		if($key){
			return json_decode($key->key_value);
		}
		return null;
	}
}
?>