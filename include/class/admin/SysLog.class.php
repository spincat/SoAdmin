<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class SysLog extends Base{
	private static $table_name = 'syslog';
	// private static $columns = 'id, user_name, action, class_name , class_obj, result , op_time';
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function addLog($user_name, $action, $class_name , $class_obj ,$result = "") {
		$now_time=time();
		$insert_data = array ('user_name' => $user_name, 'action' => $action, 'class_name' => $class_name ,'class_obj' => $class_obj , 'result' => $result ,'op_time' => $now_time);
		self::__instance();
		$log = R::dispense(self::getTableName());
		$log = self::__addProperty($log,$insert_data);
		$id = R::store($log);
		return $id;
	}
	
	public static function getLogs($class_name,$user_name,$start,$page_size,$start_date='',$end_date='') {
		self::__instance();
		$condition = '';
		$params = array();
		if($class_name !=''){
			$condition = 'class_name like :class_name';
			$params['class_name'] = $class_name;
		}
		if($user_name !=''){
			$condition = $condition?$condition.' and ':'';
			$condition .= 'user_name like :user_name';
			$params['user_name'] = $user_name;
		}
		if($start_date !='' && $end_date !=''){
			$condition = $condition?$condition.' and ':'';
			$condition .= ' op_time BETWEEN :start_date and :end_date ';
			$params['start_date'] = $start_date;
			$params['end_date'] = $end_date;
		}
		$order = ' ORDER BY id desc ';
		$limit = ' limit :start,:page_size ';
		$params['start'] = $start;
		$params['page_size'] = $page_size;
		$logs = R::findAll(self::getTableName(),$condition.$order.$limit,$params);
		if(!empty($logs)){
			foreach ($logs as &$log){
				$log->op_time = Common::getDateTime($log->op_time);
			}
		}

		if ($logs) {
			return $logs;
		}
		return array ();
	}
	
	public static function count($class_name='',$user_name=0) {
		self::__instance();
		$condition = '';
		$params = array();
		if($class_name != ''){
			$condition = ' class_name like :class_name ';
			$params['class_name'] = $class_name;
		}
		if($user_name != ''){
			$condition = $condition?$condition.' and ':'';
			$condition .= 'user_name like :user_name';
			$params['user_name'] = $user_name;
		}
		$num = R::count(self::getTableName(),$condition,$params);
		return $num;
	}
	
	public static function getCountByDate($class_name,$user_name,$start_date,$end_date) {
		self::__instance();
		$condition = '';
		$params = array();
		if($class_name != ''){
			$condition = ' class_name like :class_name ';
			$params['class_name'] = $class_name;
		}
		if($user_name != ''){
			$condition = $condition?$condition.' and ':'';
			$condition .= 'user_name like :user_name';
			$params['user_name'] = $user_name;
		}
		if($start_date !='' && $end_date !=''){
			$condition = $condition?$condition.' and ':'';
			$condition .= ' op_time BETWEEN :start_date and :end_date ';
			$params['start_date'] = $start_date;
			$params['end_date'] = $end_date;
		}
		$num = R::count(self::getTableName(),$condition,$params);
		return $num;
	}
}
?>