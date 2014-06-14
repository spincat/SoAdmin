<?php
require ('../../include/init.inc.php');
$user_id = $user_name = $real_name = $mobile = $password = $email = $user_desc = $user_group = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );

Common::checkParam($user_id);
$user = User::getUserById ( $user_id );
if(empty($user)){
	Common::exitWithError(ErrorMessage::USER_NOT_EXIST,"admin/users.php");
}
if (Common::isPost ()) {
	$data = $_POST["data"];
	$user_name = $data['user_name'];
	$real_name = $data['real_name'];
	$mobile = $data['mobile'];
	$password = $data['password'];
	$email = $data['email'];
	$user_desc = $data['user_desc'];
	$user_group = $data['user_group'];
	if($real_name=="" || $mobile =="" || $email =="" || ($user_id !=1 && $user_group <= 0) ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$update_data = array ('real_name' => $real_name, 'mobile' => $mobile,'email' => $email, 'user_desc' => $user_desc );
		if($user_id > 1 ){
			$update_data["usergroup_id"]=$user_group;
		}
		if (! empty ( $password )) {
			$update_data = array_merge ( $update_data, array ('password' => md5 ( $password ) ) );
		}
		$result = User::updateUser ( $user_id,$update_data );
		if ($result>=0) {
			$current_user=UserSession::getSessionInfo();
			$ip = Common::getIp();
			$update_data['ip']=$ip;
			SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'User' , $user_id, json_encode($update_data) );
			$info = array('type'=>'success','cont'=>'更新完成');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	$group_options=UserGroup::getGroupForOptions();
	Template::assign ( 'user', $user );
	Template::assign ( 'group_options', $group_options );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$user_id);
	Template::display ( 'admin/user_modify.tpl' );
}
