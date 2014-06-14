<?php
require ('../../include/init.inc.php');
$user_name = $real_name = $mobile = $password  = $email = $user_desc = $user_group = '';
extract ( $_POST, EXTR_IF_EXISTS );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$user_name = $data['user_name'];
	$real_name = $data['real_name'];
	$mobile = $data['mobile'];
	$password = $data['password'];
	$email = $data['email'];
	$user_desc = $data['user_desc'];
	$user_group = $data['user_group'];
	$exist = User::getUserByName($user_name);
	if($exist){
		$info = array('type'=>'error','cont'=>ErrorMessage::NAME_CONFLICT);
	}else if($password=="" || $real_name=="" || $mobile =="" || $email =="" || $user_group <= 0 ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$input_data = array ('user_name' => $user_name, 'password' => md5 ( $password ), 'real_name' => $real_name, 'mobile' => $mobile, 'email' => $email, 'user_desc' => $user_desc, 'usergroup_id' => $user_group );
		$user_id = User::addUser ( $input_data );
		
		if ($user_id) {
			$input_data['password']="";
			SysLog::addLog ( UserSession::getUserName(), 'ADD', 'User' ,$user_id, json_encode($input_data) );
			$info = array('type'=>'success','cont'=>'账号添加成功');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	$group_options = UserGroup::getGroupForOptions();
	Template::assign("_POST" ,$_POST);
	Template::assign ( 'group_options', $group_options );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display ( 'admin/user_add.tpl' );
}
