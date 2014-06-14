<?php
require ('../../include/init.inc.php');
$note_id = $note_content ='';
extract ( $_REQUEST, EXTR_IF_EXISTS );
Common::checkParam($note_id);

$quicknote = QuickNote::getNoteById ( $note_id );
if(empty($quicknote)){
	Common::exitWithError(ErrorMessage::QUICKNOTE_NOT_EXIST,"admin/quicknotes.php");
}

if (Common::isPost ()) {
	$data = $_POST["data"];
	$note_content = $data['note_content'];
	$note_content = Common::filterText($note_content);
	if($note_content =="" ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$current_user_info=UserSession::getSessionInfo();
		$user_group = $current_user_info['usergroup_id'];
		$current_user_id = $current_user_info['id'];
		if($user_group ==1 || $quicknote->owner_id == $current_user_id){
			$note_content = htmlspecialchars($note_content);
			$update_data = array ('note_content' => $note_content);
			$result = QuickNote::updateNote( $note_id,$update_data );
			if ($result>=0) {
				SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'QuickNote' ,$note_id, json_encode($update_data) );
				$info = array('type'=>'success','cont'=>'更新完成');
			} else { 
				$info = array('type'=>'error','cont'=>'未知错误');
			}
		}else{
			$info = array('type'=>'error','cont'=>ErrorMessage::QUICKNOTE_NOT_OWNER);
		}
	}
	echo json_encode($info);
}else{
	Template::assign ( 'quicknote', $quicknote );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$note_id);
	Template::display ( 'admin/quicknote_modify.tpl' );
}
