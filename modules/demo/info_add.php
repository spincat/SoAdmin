<?php
require ('../../include/init.inc.php');
$date = $imgurl = $cont = $source = '';//页面参数
extract ( $_POST, EXTR_IF_EXISTS );

$author = UserSession::getUserName();
if (Common::isPost ()) {//提交表单
	$data = $_POST["data"];
	$date = $data['date'];
	$imgurl = $data['imgurl'];
	$cont = $data['cont'];
	$source = $data['source'];
	$info = Info::getInfoByDate($date);
	if($info){
		$info = array('type'=>'error','cont'=>ErrorMessage::DATE_CONFLICT);
	}else if($date=="" || $imgurl=="" || $cont=="" ||  $source==""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$input_data = array ('date' => $date, 'imgurl' => $imgurl, 'cont' => $cont, 'source' => $source, 'user' => $author);
		$id = Info::addInfo ( $input_data );
		if ($id) {
			SysLog::addLog ( UserSession::getUserName(), 'ADD', 'Info' ,$id, json_encode($input_data) );
			$info = array('type'=>'success','cont'=>'信息添加成功');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	Template::assign("user" ,$author);
	Template::assign("_POST" ,$_POST);
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display ( 'demo/info_add.tpl' );
}
