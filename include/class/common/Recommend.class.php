<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class Recommend extends ZugBase {

	private static $table_name = 'recommend';
	
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function getRecommendById($id) {
		self::__instance();
		$recommend = R::load(self::getTableName(),$id);
		return $recommend;
	}

	public static function getRecommendsByPre($table) {
		self::__instance();
		$pre = substr(ucfirst($table),0,1);
		$recommends = R::getAll('select * from '.self::getTableName().' where infocode like ?',array($pre.'-%'));
		return $recommends;
	}   

	public static function getRecommendByInfoCode($infocode) {
		self::__instance();
		$recommend = R::findOne(self::getTableName(),'infocode = ?',array($infocode));
		return $recommend;
	}  

	public static function addRecommend($data) {
		if (! $data || ! is_array ( $data )) {
			return false;
		}
		$recommend = R::dispense(self::getTableName());
		$recommend = self::__addProperty($recommend,$data);
		$id = R::store($recommend);
		return $id;
	}
	
	public static function delRecommend($id) {
		if (! $id || ! is_numeric ( $id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id = ? ',array($id));
		return $result;
	}

	public static function delRecommendByInfoCode($infocode) {
		if (! $infocode) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE infocode = ? ',array($infocode));
		return $result;
	}


	public static function count($condition = '') {
		self::__instance();
		$num = R::count(self::getTableName());
		return $num;
	}

}
