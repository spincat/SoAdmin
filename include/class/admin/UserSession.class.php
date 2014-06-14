<?php
if(!defined('ACCESS')) {exit('Access denied.');}

class UserSession{
	const SESSION_NAME="osa_user_info";
	public static function setSessionInfo($user_info){
		$_SESSION[self::SESSION_NAME] = $user_info;
		return true;
	}
	
	public static function getSessionInfo(){
		$user_info = $_SESSION[self::SESSION_NAME];
		return $user_info;
	}
	
	public static function getUserName(){
		$user_name = '';
		$user_name = $_SESSION[self::SESSION_NAME]['user_name'];
		return $user_name;
	}
	
	public static function getUserId(){
		$admin_id = '';
		$admin_id = $_SESSION[self::SESSION_NAME]['id'];
		return $admin_id;
	}
	
	public static function getRealName(){
		$real_name = '';
		$real_name = $_SESSION[self::SESSION_NAME]['real_name'];
		return $real_name;
	}
	
	public static function getUserGroup(){
		$purviews = '';
		$purviews = $_SESSION[self::SESSION_NAME]['usergroup_id'];
		return $purviews;
	}
	
	public static function getTemplate(){
		$template = '';
		$template = $_SESSION[self::SESSION_NAME]['template'];
		return $template;
	}
	
    public static function clear(){
        $_SESSION[self::SESSION_NAME] = null;
        return true;
    }
	
	public static function reload(){
		$current_user_info = $_SESSION[self::SESSION_NAME];
		$user = User::getUserById($current_user_info['id']);
		$user_info = $user->export();//将user对象导出为数组
		if($user->status!=1){
			Common::jumpUrl("login.php");
			return;
		}
		//读取该用户所属用户组将该组的权限保存在$_SESSION中
		$user_group = UserGroup::getGroupById($user->usergroup_id);
		$user_info['usergroup_id'] = $user_group->id;
		$user_info['user_role'] = $user_group->group_role;
		$user_info['shortcuts_arr'] = explode(',',$user->shortcuts);
		$menu = MenuUrl::getMenuByUrl('/admin/setting.php');
		if(strpos($user_group->group_role,$menu->id)){
			$user_info['setting'] = 1;
		}
		$user_info['login_time'] = Common::getDateTime($user->login_time);
		UserSession::setSessionInfo($user_info);
	}
}