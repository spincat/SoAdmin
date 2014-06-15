<?php
if(!defined('ACCESS')) {exit('Access denied.');}

require ADMIN_BASE_LIB.'rb.php';
class Base {

	public static function __instance($DB_ID=OSA_DB_ID){
		global $DATABASE_LIST;
		$DB = $DATABASE_LIST[$DB_ID];
		if($DB!=null){
			R::setup('mysql:host='.$DB['server'].';dbname='.$DB['db_name'],$DB['username'],$DB['password']);
			R::useWriterCache(true);
			R::freeze(true);
			R::selectDatabase('default');
		}
	}

	public static function __addProperty($bean,$properties){
		foreach ($properties as $key => $value) {
			$bean->$key = htmlspecialchars($value);
		}
		return $bean;
	}

	public static function __batchAddProperty($beans,$properties){
		$i = 0;
		foreach ($beans as $bean) {
			foreach ($properties as $key => $value) {
				$bean->$key = htmlspecialchars($value);
			}
			$beans[$i]=$bean;
			$i++;
		}
		return $beans;
	}
}
