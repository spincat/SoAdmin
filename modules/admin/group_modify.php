<?php
require ('../../include/init.inc.php');
$group_id = $group_name = $group_desc = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$group_name = $data['group_name'];
	$group_desc = $data['group_desc'];
	if($group_name =="" ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$update_data = array ('group_name' => $group_name, 'group_desc' => $group_desc);
		$result = UserGroup::updateGroupInfo ( $group_id,$update_data );
		
		if ($result>=0) {
			SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'UserGroup' ,$group_id, json_encode($update_data) );
			$info = array('type'=>'success','cont'=>'账号添加成功');
		} else {
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{

	Common::checkParam($group_id);
	$group = UserGroup::getGroupById ( $group_id );
	if(empty($group)){
		Common::exitWithError(ErrorMessage::GROUP_NOT_EXIST,"admin/groups.php");
	}

	$groupOptions=UserGroup::getGroupForOptions();

	Template::assign ( 'group', $group );
	Template::assign ( 'groupOptions', $groupOptions );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$group_id);
	Template::display ( 'admin/group_modify.tpl' );
}
