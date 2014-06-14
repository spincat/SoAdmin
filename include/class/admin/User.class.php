<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class User extends Base{
	// 表名
	private static $table_name = 'user';
	// 查询字段
	// private static $columns = 'id, user_name, password, real_name, mobile, email, user_desc, login_time, status, login_ip, usergroup_id, template,shortcuts,show_quicknote';
	//状态定义
	const ACTIVE = 1;
	const DEACTIVE = 0;
	public static function getTableName(){
		return self::$table_name;
	}
	
	public static function getUserByName($user_name) {
		self::__instance();
		$sql= "select u.* ,g.group_name from ".self::getTableName() ." u,".UserGroup::getTableName()." g where u.user_name = ? and u.usergroup_id=g.id";
		$users = R::getAll($sql,array($user_name));
		$users = R::convertToBeans(self::getTableName(),$users);
		$user = $users[0];
		if ($user) {
			$user->login_time=Common::getDateTime($user->login_time);
			return $user;
		}
		return array ();
	}
	
	public static function getUserById($user_id) {
		if (! $user_id || ! is_numeric ( $user_id )) {
			return false;
		}
		self::__instance();
		$user = R::load(self::getTableName(),$user_id);
		if ($user) {
			$user->login_time=Common::getDateTime($user->login_time);
			return $user;
		}
		return array ();
	}
	
	public static function setCookieRemember($encrypted,$day=7){
		setcookie("osa_remember",$encrypted,time()+3600*24*$day);
	}
	
	public static function getCookieRemember(){
		$encrypted = $_COOKIE["osa_remember"];
		$base64=urldecode($encrypted);
		return OSAEncrypt::decrypt($base64);
	}
	
	public static function logout(){
		setcookie("osa_remember","",time()-3600);
		unset($_SESSION[UserSession::SESSION_NAME]);
		unset($_SESSION['osa_timezone']);
	}
	
	public static function getAllUsers( $start ='' ,$page_size='' ) {
		self::__instance();
		$limit ="";
		$params = array();
		if($page_size){
			$limit =" limit :start,:page_size ";
			$params['start']=$start;
			$params['page_size']=$page_size;
		}
		$sql = "select u.* ,coalesce(g.group_name,'已删除') group_name from ".self::getTableName()." u left join ".UserGroup::getTableName()." g on u.usergroup_id = g.id order by u.id desc $limit";
		$users = R::getAll($sql,$params);
		$users = R::convertToBeans(self::getTableName(),$users);
		if(!empty($users)){
			foreach($users as &$item){
				$item->login_time=Common::getDateTime($item->login_time);
			}
		}
		if ($users) {
			return $users;
		}
		return array ();
	}
	
	public static function search($user_group ,$user_name, $start ='' ,$page_size='' ) {
		self::__instance();
		$limit ="";
		$where = "";
		$params = array();
		if($page_size){
			$limit =" limit :start,:page_size ";
			$params['start'] = $start;
			$params['page_size'] = $page_size;
		}
		if($user_group >0  && $user_name!=""){
			$where = " where u.usergroup_id=:user_group and u.user_name like :user_name";
			$params['user_group'] = $user_group;
			$params['user_name'] = '%'.$user_name.'%';
		}else{
			if($user_group>0){
				$where = " where u.usergroup_id=:user_group ";
				$params['user_group'] = $user_group;
			}
			if($user_name!=""){
				$where = " where u.user_name like :user_name ";
				$params['user_name'] = '%'.$user_name.'%';
			}
		}
		$sql = "select u.* ,coalesce(g.group_name,'已删除') group_name from ".self::getTableName()." u left join ".UserGroup::getTableName()." g on u.usergroup_id = g.id $where order by u.id desc $limit";
		$users = R::getAll($sql,$params);
		$users = R::convertToBeans(self::getTableName(),$users);
		if(!empty($users)){
			foreach($users as &$item){
				$item->login_time = Common::getDateTime($item->login_time);
			}
		}
		if ($users) {
			return $users;
		}
		return array ();
	}
	
	public static function getUsersByGroup( $group_id ) {
		self::__instance();
		$users = R::findAll(self::getTableName(),' usergroup_id = ? ',array($group_id));
		if ($users) {
			foreach($users as &$item){
				if($item->login_time==null){
					;
				}else{
					$item->login_time=Common::getDateTime($item->login_time);
				}
			}
			return $users;
		}
		return array ();
	}
	
	public static function checkLogin() {
		$user_info = UserSession::getSessionInfo();
		if (empty ( $user_info )) {
			Common::jumpUrl("login.php");
			return true;
		}
	}
	
	public static function checkActionAccess($action_url) {
		$user_info = UserSession::getSessionInfo();
		$role_menu_url = MenuUrl::getMenuByRole($user_info['user_role']);
		$search_result = in_array($action_url, $role_menu_url);
		$user = User::getUserById(1);
		if (!$search_result) {
			Common::exitWithMessage('您当前没有权限访问该功能，如需访问请联系管理员开通权限','index.php');
			return true;
		}
	}
	
	public static function checkPassword($user_name, $password) {
		$md5_pwd = md5 ( $password );
		self::__instance();
		$user = R::findOne(self::getTableName(),' user_name = ? and password = ?',array($user_name,$md5_pwd));
		if ($user) {
			return $user;
		} else {
			return false;
		}
	}
	
	public static function updateUser($user_id,$user_data) {
		if (! $user_data || ! is_array ( $user_data )) {
			return false;
		}
		self::__instance();
		$user = R::load(self::getTableName(),$user_id);
		$user = self::__addProperty($user,$user_data);
		$id = R::store($user);
		return $id;
	}
	
	/**
	* 批量修改用户，如批量修改用户分组
	* user_ids 可以为无key数组，也可以为1,2,3形势的字符串
	*/
	public static function batchUpdateUsers($user_ids,$user_data) {
		if (! $user_data || ! is_array ( $user_data )) {
			return false;
		}
		if(!is_array($user_ids)){
			$user_ids=explode(',',$user_ids);
		}
		self::__instance();
		$users = R::batch(self::getTableName(),$user_ids);
		$users = self::__batchAddProperty($users,$user_data);
		$ids = R::storeAll($users);
		return $ids;
	}
	
	public static function addUser($user_data) {
		if (! $user_data || ! is_array ( $user_data )) {
			return false;
		}
		self::__instance();
		$user = R::dispense(self::getTableName());
		$user = self::__addProperty($user,$user_data);
		$id = R::store($user);
		return $id;
	}
	
	public static function delUser($user_id) {
		if (! $user_id || ! is_numeric ( $user_id )) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE id=?',array($user_id));
		return $result;
	}
	
	public static function delUserByUserName($user_name) {
		if (! $user_name ) {
			return false;
		}
		self::__instance();
		$result = R::exec('DELETE FROM '.self::getTableName().' WHERE user_name=?',array($user_name));
		return $result;
	}
	
	public static function count() {
		self::__instance();
		$num = R::count(self::getTableName());
		return $num;
	}
	
	public static function countSearch($user_group,$user_name) {
		self::__instance();
		$condition = '';
		$params = array();
		if($user_group >0  && $user_name!=""){
			$condition = ' usergroup_id = :user_group and user_name like :user_name ';
			$params['user_group'] = $user_group;
			$params['user_name'] = $user_name;
		}else{
			if($user_group>0){
				$condition = ' usergroup_id = :user_group ';
				$params['user_group'] = $user_group;
			}
			if($user_name!=""){
				$condition = ' user_name like :user_name ';
				$params['user_name'] = $user_name;
			}
		}
		$num = R::count(self::getTableName(),$condition,$params);
		return $num;
	}
	
	public static function setTemplate($user_id,$template){
		$user_data=array("template"=>$template);
		$ret=self::updateUser($user_id,$user_data);
		return $ret;
	}
	
	public static function loginDoSomething($user_id){
		$user = User::getUserById($user_id);
		$user_info = $user->export();
		if($user->status!=1){
			Common::jumpUrl("login.php");
			return;
		}
		//读取该用户所属用户组将该组的权限保存在$_SESSION中
		$user_group = UserGroup::getGroupById($user->usergroup_id);
		$user_info['usergroup_id']= $user_group->id;
		$user_info['user_role'] = $user_group->group_role;
		$user_info['shortcuts_arr'] = explode(',',$user->shortcuts);
		$menu = MenuUrl::getMenuByUrl('/admin/setting.php');
		if(strpos($user_group->group_role,$menu->id)){
			$user_info['setting'] = 1;
		}
		$login_time = time();
		$login_ip = Common::getIp();
		$update_data = array ('login_ip' => $login_ip, 'login_time' => $login_time );
		User::updateUser( $user_info['id'] , $update_data );
		$user_info['login_ip'] =$login_ip;
		$user_info['login_time'] =Common::getDateTime($login_time);
		UserSession::setSessionInfo( $user_info);
	}
}