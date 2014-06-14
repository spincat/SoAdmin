<?php
require ('../../include/init.inc.php');
$note_content = '';
extract ( $_POST, EXTR_IF_EXISTS );
$note_content = Common::filterText($note_content);
if (Common::isPost ()) {
	$data = $_POST["data"];
	$note_content = $data['note_content'];
	if($note_content ==""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$note_content = htmlspecialchars($note_content);
		$input_data = array ('note_content' => $note_content, 'owner_id' => UserSession::getUserId() );
		$note_id = QuickNote::addNote ( $input_data );
		if ($note_id) {
			SysLog::addLog ( UserSession::getUserName(), 'ADD', 'QuickNote' ,$note_id, json_encode($input_data) );
			$info = array('type'=>'success','cont'=>'便签添加成功');
		}
	}
	echo json_encode($info);
}else{
	Template::assign("_POST" ,$_POST);
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display('admin/quicknote_add.tpl' );
}

