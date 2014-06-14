<?php
if(!defined('ACCESS')) {exit('Access denied.');}
class QuickNote extends Base {
	// 表名
	private static $table_name = 'quicknote';
	// 查询字段
	// private static $columns = 'id, note_content, owner_id';
	//状态定义
	
	public static function getTableName(){
		return self::$table_name;
	}
	
	//列表 
	public static function getNotes($start ='' ,$page_size='') {
		self::__instance();
		$limit = "";
		$params = array();
		if($page_size){
			$limit =" limit :start,:page_size ";
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		$sql="select q.*,coalesce(u.user_name,'已删除') as owner_name from ".self::getTableName()." q left join ".User::getTableName()." u on q.owner_id =  u.id order by q.id desc $limit";
		$notes = R::getAll($sql,$params);
		$notes = R::convertToBeans(self::getTableName(),$notes);
		if ($notes) {
			return $notes;
		}
		return array ();
	}
	
	public static function addNote($note_data) {
		if (! $note_data || ! is_array ( $note_data )) {
			return false;
		}
		self::__instance();
		$note = R::dispense(self::getTableName());
		$note = self::__addProperty($note,$note_data);
		$id = R::store($note);
		return $id;
	}

	public static function getNoteById($note_id) {
		if (! $note_id || ! is_numeric ( $note_id )) {
			return false;
		}
		self::__instance();
		$note = R::load(self::getTableName(),$note_id);
		if ($note) {
			return $note;
		}
		return array ();
	}
	
	public static function getRandomNote() {
		self::__instance();
		$sql="select min(id) min, max(id) max from ".self::getTableName();
		$list = R::getAll($sql);
		if ($list) {
			$note_id=rand($list[0]['min'],$list[1]['max']);
			$note = R::findOne(self::getTableName(),' id>=? ',array($note_id));
			if ($note) {
				return $note;
			}
		}
		return array ();
	}
	
	public static function count() {
		self::__instance();
		$num = R::count(self::getTableName());
		return $num;
	}
	
	public static function updateNote($note_id,$note_data) {
		if (! $note_data || ! is_array ( $note_data )) {
			return false;
		}
		self::__instance();
		$note = R::load(self::getTableName(),$note_id);
		$note = self::__addProperty($note,$note_data);
		$id = R::store($note);
		return $id;
	}
	
	public static function delNote($note_id) {
		if (! $note_id || ! is_numeric ( $note_id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id=?',array($note_id));
		return $result;
	} 
}
