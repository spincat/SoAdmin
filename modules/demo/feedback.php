<?php
require ('../../include/init.inc.php'); 
$method = $id = $date_s = $date_e = $keyword = $page_no = $search = '';
extract ( $_GET, EXTR_IF_EXISTS );

if (Common::isPost()){
	$id = $_POST['id'];
	$method = $_POST['action'];
	$username = UserSession::getUserName();
	if ($method == 'del' && ! empty ( $id )) {
		$feedback = Feedback::getFeedbackById($id);
		$result = Feedback::delFeedback( $id );
		if ($result>=0) {
			SysLog::addLog($username, 'DELETE',  'Feedback' ,$id ,json_encode($feedback));
			$info = array('type'=>'success','cont'=>'记录已删除');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	//START 数据库查询及分页数据
	$page_size = PAGE_SIZE;
	$page_no=$page_no<1?1:$page_no;

	if($search){
		$row_count = Feedback::countSearch($date_s,$date_e,$keyword);
		$total_page=$row_count%$page_size==0?$row_count/$page_size:ceil($row_count/$page_size);
		$total_page=$total_page<1?1:$total_page;
		$page_no=$page_no>($total_page)?($total_page):$page_no;
		$start = ($page_no - 1) * $page_size;
		$feedbacks = Feedback::search($date_s,$date_e,$keyword,$start,$page_size);
	}else{
		$row_count = Feedback::count();
		$total_page=$row_count%$page_size==0?$row_count/$page_size:ceil($row_count/$page_size);
		$total_page=$total_page<1?1:$total_page;
		$page_no=$page_no>($total_page)?($total_page):$page_no;
		$start = ($page_no - 1) * $page_size;
		$feedbacks = Feedback::getAllFeedbacks( $start , $page_size );
	}

	$page_html=Pagination::showPager("feedback.php?date_s=$date_s&date_e=$date_e&keyword=$keyword&search=$search",$page_no,$page_size,$row_count);

	//追加操作的确认层
	$confirm_html = OSAdmin::renderJsConfirm("fa-pause,fa-play,fa-times");

	// 设置模板变量
	Template::assign ('feedbacks',$feedbacks);
	Template::assign ( '_GET', $_GET );
	Template::assign ( 'page_no', $page_no );
	Template::assign ( 'page_html', $page_html );

	Template::display ('demo/feedback.tpl' );
}