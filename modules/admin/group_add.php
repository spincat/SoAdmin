<?php
require ('../../include/init.inc.php');
$group_name = $group_desc = '';
extract ( $_POST, EXTR_IF_EXISTS );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$group_name = $data['group_name'];
	$group_desc = $data['group_desc'];
	$exist = UserGroup::getGroupByName($group_name);
	if($exist){
		$info = array('type'=>'error','cont'=>ErrorMessage::NAME_CONFLICT);
	}else if($group_name ==""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$input_data = array ('group_name' => $group_name, 'group_desc' => $group_desc, 'group_role' => "1,5,17,18,22,23,24,25" ,'owner_id' => UserSession::getUserId() );
		$group_id = UserGroup::addGroup ( $input_data );
		if ($group_id) {
			SysLog::addLog ( UserSession::getUserName(), 'ADD', 'UserGroup' ,$group_id, json_encode($input_data) );
			$info = array('type'=>'success','cont'=>'账号添加成功');
		}
	}
	echo json_encode($info);
}else{
	Template::assign("_POST" ,$_POST);
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display('admin/group_add.tpl' );
}

