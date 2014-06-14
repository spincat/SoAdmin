<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class DemoBase extends Base{

	public static function __instance($DB_ID=DEMO_DB_ID){
		global $DATABASE_LIST;
		$DB = $DATABASE_LIST[$DB_ID];
		if($DB!=null){
			R::addDataBase('DEMO_DB','mysql:host='.$DB['server'].';dbname='.$DB['db_name'],$DB['username'],$DB['password'],true);
		}
		R::selectDatabase('DEMO_DB');
	}

	public static function __addProperty($bean,$properties){
		foreach ($properties as $key => $value) {
			$bean->$key = $value;
		}
		return $bean;
	}

	public static function __batchAddProperty($beans,$properties){
		$i = 0;
		foreach ($beans as $bean) {
			foreach ($properties as $key => $value) {
				$bean->$key = $value;
			}
			$beans[$i]=$bean;
			$i++;
		}
		return $beans;
	}
}
