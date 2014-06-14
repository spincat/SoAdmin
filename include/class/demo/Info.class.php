<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class Info extends DemoBase {

	private static $table_name = 'info';
	
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function getInfoById($id) {
		self::__instance();
		$info = R::load(self::getTableName(),$id);
		return $info;
	}  

	public static function getInfoByDate($date) {
		self::__instance();
		$info = R::findOne(self::getTableName(),'date = ?',array($date));
		return $info;
	}

	public static function getAllInfos($start ='' ,$page_size='') {
		self::__instance();
		$limit = '';
		$params = array();
		if($page_size){
			$limit =' limit :start,:page_size ';
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		$order = ' ORDER BY DATE DESC ';
		$infos = R::findAll(self::getTableName(),$order.$limit,$params);
		return $infos;
	}

	public static function addInfo($data) {
		if (! $data || ! is_array ( $data )) {
			return false;
		}
		self::__instance();
		$info = R::dispense(self::getTableName());
		$info = self::__addProperty($info,$data);
		$id = R::store($info);
		return $id;
	}

	public static function delInfo($id) {
		if (! $id || ! is_numeric ( $id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id = ? ',array($id));
		return $result;
	}

	public static function updateInfo($id,$data) {
		if (! $data || ! is_array ( $data )) {
			return false;
		}
		self::__instance();
		$info = R::load(self::getTableName(),$id);
		$info = self::__addProperty($info,$data);
		$id = R::store($info);
		return $id;
	}

	public static function search($date ,$keyword, $start ='' ,$page_size='' ) {
		self::__instance();
		$condition = '';
		$params = array();
		$limit = '';
		if($page_size){
			$limit =' limit :start,:page_size ';
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		if($date!='' && $keyword!=''){
			$condition = ' date = :date and cont like :keyword ';
			$params['date'] = $date;
			$params['keyword'] = '%'.$keyword.'%';
		}else{
			if($date!=""){
				$condition = ' date = :date ';
				$params['date'] = $date;
			}
			if($keyword!=""){
				$condition = ' cont like :keyword ';
				$params['keyword'] = '%'.$keyword.'%';
			}
		}
		$order = 'ORDER BY id DESC';
		$infos = R::find(self::getTableName(),$condition.$order.$limit,$params);
		return $infos;
	}

	public static function countSearch($date,$keyword) {
		self::__instance();
		$condition = '';
		$params = array();
		if($date!='' && $keyword!=''){
			$condition = ' date = :date and cont like :keyword ';
			$params['date'] = $date;
			$params['keyword'] = '%'.$keyword.'%';
		}else{
			if($date!=""){
				$condition = ' date = :date ';
				$params['date'] = $date;
			}
			if($keyword!=""){
				$condition = ' cont like :keyword ';
				$params['keyword'] = '%'.$keyword.'%';
			}
		}
		$num = R::count(self::getTableName(),$condition,$params);
		return $num;
	}

	public static function count() {
		self::__instance();
		$num = R::count(self::getTableName());
		return $num;
	}
}
