<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class Feedback extends DemoBase {

	private static $table_name = 'feedback';
	
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function getFeedbackById($id) {
		self::__instance();
		$feedback = R::load(self::getTableName(),$id);
		return $feedback;
	}  

	public static function getFeedbacksByDate($date_s,$date_e) {
		self::__instance();
		$time_s = self::getTimeFromDate($date_s);
		$time_e = $date_e?self::getTimeFromDate($date_e):$time_s+86400;
		$feedbacks = R::findAll(self::getTableName(),'createtime in ('.$time_s.','.$time_e.')');
		return $feedbacks;
	}

	public static function getTimeFromDate($date){
		$temp=explode("-",$date);
		$time = mktime(0,0,0,$temp[1],$temp[2],$temp[0]);
		return $time;
	}

	public static function getAllFeedbacks($start ='' ,$page_size='') {
		self::__instance();
		$limit = '';
		$params = array();
		if($page_size){
			$limit =' limit :start,:page_size ';
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		$order = ' ORDER BY CREATETIME DESC ';
		$feedbacks = R::findAll(self::getTableName(),$order.$limit,$params);
		return $feedbacks;
	}

	public static function setFeedbackStatus($id,$status) {
		self::__instance();
		$result = R::exec('UPDATE '.self::getTableName().' set status = ? where id = ?',
			array($status,$id));
		return $result;
	} 

	public static function replyFeedback($id,$replycont) {
		self::__instance();
		$result = R::exec('UPDATE '.self::getTableName().' SET replycont = ? WHERE id = ? ',
			array($replycont,$id));
		return $result;
	}

	public static function addFeedback($data) {
		if (! is_array ( $data )) {
			return false;
		}
		self::__instance();
		$feedback = R::dispense(self::getTableName());
		$feedback = self::__addProperty($feedback,$data);
		$id = R::store($feedback);
		return $id;
	}

	public static function delFeedback($id) {
		if (! $id || ! is_numeric ( $id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id = ? ',array($id));
		return $result;
	}

	public static function search($date_s ,$date_e,$keyword, $start ='' ,$page_size='' ) {
		self::__instance();
		$condition = '';
		$params = array();
		$limit = '';
		if($page_size){
			$limit =' limit :start,:page_size ';
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		if($date_s){
			$time_s = self::getTimeFromDate($date_s);
			$time_e = $date_e?self::getTimeFromDate($date_e):$time_s+86400;
			$condition = ' createtime >= :time_s and createtime <= :time_e ';
			$params['time_s'] = $time_s;
			$params['time_e'] = $time_e;
		}
		if($date_s!="" && $keyword!=""){
			$condition .= ' and cont like :keyword ';
			$params['time_s'] = '%'.$keyword.'%';
		}else if($keyword!=""){
			$condition = ' cont like :keyword ';
			$params['keyword'] = '%'.$keyword.'%';
		}
		$order = ' ORDER BY id DESC ';
		$feedbacks = R::find(self::getTableName(),$condition.$order.$limit,$params);
		return $feedbacks;
	}

	public static function countSearch($date_s,$date_e,$keyword) {
		self::__instance();
		$condition = '';
		$params = array();
		if($date_s){
			$time_s = self::getTimeFromDate($date_s);
			$time_e = $date_e?self::getTimeFromDate($date_e):$time_s+86400;
			$condition = ' createtime >= :time_s and createtime <= :time_e ';
			$params['time_s'] = $time_s;
			$params['time_e'] = $time_e;
		}
		if($date_s!="" && $keyword!=""){
			$condition .= ' and cont like :keyword ';
			$params['time_s'] = '%'.$keyword.'%';
		}else if($keyword!=""){
			$condition = ' cont like :keyword ';
			$params['keyword'] = '%'.$keyword.'%';
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
