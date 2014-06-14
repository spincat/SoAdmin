<?php
require ('../../include/init.inc.php');
$method = $page_no = $note_id = '';
extract ( $_GET, EXTR_IF_EXISTS );

$current_user_info=UserSession::getSessionInfo();
$user_group = $current_user_info['usergroup_id'];
$current_user_id = $current_user_info['id'];

if (Common::isPost()){
	$note_id = $_POST['id'];
	$method = $_POST['action'];
	if ($method == 'del' && ! empty ( $note_id )) {
		$note = QuickNote::getNoteById($note_id);
		//是超级管理员组的成员或者是quicknote的主人
		if($user_group ==1 || $note->owner_id == $current_user_id){
			$result = QuickNote::delNote ( $note_id );
			if($result>0){
				SysLog::addLog ( UserSession::getUserName(), 'DELETE', 'QuickNote',$note_id, json_encode($note->export()) );
				$info = array('type'=>'success','cont'=>'便签删除成功');
			}else{
				$info = array('type'=>'error','cont'=>'未知错误');
			}
		}else{
			$info = array('type'=>'error','cont'=>ErrorMessage::QUICKNOTE_NOT_OWNER);
		}
		echo json_encode($info);
	}
}else{
	//START 数据库查询及分页数据
	$row_count = QuickNote::count ();
	$page_size = PAGE_SIZE;
	$page_no=$page_no<1?1:$page_no;
	$total_page=$row_count%$page_size==0?$row_count/$page_size:ceil($row_count/$page_size);
	$total_page=$total_page<1?1:$total_page;
	$page_no=$page_no>($total_page)?($total_page):$page_no;
	$start = ($page_no - 1) * $page_size;


	$quicknotes = QuickNote::getNotes($start,$page_size);

	$confirm_html = OSAdmin::renderJsConfirm("icon-remove");

	$page_html=Pagination::showPager("",$page_no,PAGE_SIZE,$row_count);

	Template::assign ( 'page_no', $page_no );
	Template::assign ( 'page_size', PAGE_SIZE );
	Template::assign ( 'row_count', $row_count );
	Template::assign ( 'page_html', $page_html );
	Template::assign ( 'quicknotes', $quicknotes );
	
	Template::assign ( 'user_group', $user_group );
	Template::assign ( 'current_user_id', $current_user_id );
	Template::display ( 'admin/quicknotes.tpl' );
}