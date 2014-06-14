<?php
require ('../../include/init.inc.php');
$id = $date = $imgurl = $cont = $source = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );

Common::checkParam($id);
$info = Info::getInfoById($id);
if(empty($info)){
	Common::exitWithError(ErrorMessage::MAXIM_NOT_EXIST,"info/info.php");
}
if (Common::isPost ()){
	$data = $_POST["data"];
	$date = $data['date'];
	$imgurl = $data['imgurl'];
	$cont = $data['cont'];
	$source = $data['source'];
	if($date=="" || $imgurl=="" || $cont=="" ||  $source==""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$update_data = array ('date' => $date, 'imgurl' => $imgurl, 'cont' => $cont, 'source' => $source);
		$result = Info::updateInfo($id,$update_data);
		if ($result!=null) {
			SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'Info' , $id, json_encode($update_data) );
			$info = array('type'=>'success','cont'=>'更新完成');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	Template::assign ( 'info', $info );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$id);
	Template::display ( 'demo/info_modify.tpl' );
}
