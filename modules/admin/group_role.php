<?php
require ('../../include/init.inc.php');
$group_id = '';
$menu_ids = array ();
extract ( $_REQUEST, EXTR_IF_EXISTS );

//根据分组ID获取权限列表
$group_id =  $group_id == ""? 1:intval($group_id);
/*if(isset($_POST["data"])){//POST修改模式
	$group_id = $_POST["data"]['group_id'];
}*/
$group_option_list = GroupRole::getGroupForOptions ();
$group_info = UserGroup::getGroupById ( $group_id );

if(!$group_info){
	$group_id =1;
	$group_info = UserGroup::getGroupById ( $group_id );
}

$role_list = GroupRole::getGroupRoles ( $group_id );
$group_role = $group_info->group_role;
$group_role_array = explode ( ',', $group_role );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$menu_ids = json_decode($data['menu_ids']);
	if($group_id==1){
		$temp = array();
		foreach ($group_role_array as $group_role){
			//系统预留菜单id为100以内
			if($group_role>100){
				$temp[]=$group_role;
			}
		}		
		$admin_role = array_diff($group_role_array,$temp);
		$menu_ids = array_merge($admin_role,$menu_ids);
		$menu_ids = array_unique($menu_ids);
		asort($menu_ids);
	}
	$group_role = join ( ',', $menu_ids );
	$group_data = array ('group_role' => $group_role );
	$result = UserGroup::updateGroupInfo ( $group_id, $group_data );
	if ($result>=0) {
		UserSession::reload();
		SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'UserGroup' ,$group_id, json_encode($group_data) );
		$info = array('type'=>'success','cont'=>'权限更新成功');
	}else{
		$info = array('type'=>'error','cont'=>'未知错误');
	}
	echo json_encode($info);	
}else{
	Template::assign ( 'role_list', $role_list );
	Template::assign ( 'group_id', $group_id );
	Template::assign ( 'group_option_list', $group_option_list );
	Template::assign ( 'group_role', $group_role_array );
	Template::assign ( 'back_url',Common::getActionUrl());
	Template::display ( 'admin/group_role.tpl' );	
}