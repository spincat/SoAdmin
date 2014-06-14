<?php
require ('../../include/init.inc.php');

$id = '';

if($_POST['sended']){//已发送后回调
	Feedback::setFeedbackStatus($_POST['id'],2);
	Feedback::replyFeedback($_POST['id'],$_POST['cont']);
	echo $_POST['cont'];
	exit;
}


extract ( $_REQUEST, EXTR_IF_EXISTS );

$feedback = Feedback::getFeedbackById($id);
if($feedback->status==0){//设置为已查看状态
	Feedback::setFeedbackStatus($id,1);
}

$userinfo = User::getUserById(UserSession::getUserId());
Template::assign("feedback" ,$feedback);
Template::assign("SMTP_CONFIGS" ,json_encode($SMTP_CONFIGS));
Template::assign ('userinfo',$userinfo);
Template::assign("back_url" ,preg_replace('/&method.*$/','',$_SERVER['HTTP_REFERER']));
Template::display ( 'demo/feedback_view.tpl' );
