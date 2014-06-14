<?php
require ('../../include/init.inc.php');
$method = $group_id = '';
extract ( $_GET, EXTR_IF_EXISTS );

if (Common::isPost()){
	$group_id = $_POST['id'];
	$method = $_POST['action'];
	if ($method == 'del' && ! empty ( $group_id )) {
		$users = UserGroup::getGroupUsers($group_id);
		if(sizeof($users)>0){
			$info = array('type'=>'error','cont'=>ErrorMessage::HAVE_USER);
		}else if(intval($group_id) === 1){
			$info = array('type'=>'error','cont'=>ErrorMessage::CAN_NOT_DO_FOR_SUPER_GROUP);
		}else{
			$group = UserGroup::getGroupById($group_id);
			$result = UserGroup::delGroup ( $group_id );
			if ($result>0) {
				SysLog::addLog ( UserSession::getUserName(), 'DELETE', 'UserGroup',$group_id, json_encode($group->export()) );
				$info = array('type'=>'success','cont'=>'已删除');
			}else{
				$info = array('type'=>'error','cont'=>'未知错误');
			}
		}
		echo json_encode($info);
	}
}else{
	$groups = UserGroup::getAllGroup();
	$confirm_html = OSAdmin::renderJsConfirm("icon-remove");
	
	Template::assign ( 'groups', $groups );
	Template::display ( 'admin/groups.tpl' );
}
