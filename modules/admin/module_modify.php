<?php
require ('../../include/init.inc.php');
$module_id = $module_name = $module_sort = $module_url = $module_desc = $module_icon = $online = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );

Common::checkParam($module_id);

$module = Module::getModuleById ( $module_id );
if(empty($module)){
	Common::exitWithError(ErrorMessage::MODULE_NOT_EXIST,"admin/modules.php");
}

if (Common::isPost ()) {
	$data = $_POST["data"];
	$module_name = $data['module_name'];
	$module_desc = $data['module_desc'];
	$module_sort = $data['module_sort'];
	$module_url = $data['module_url'];
	$module_icon = $data['module_icon'];
	$online = $data['online'];
	if($module_name =="" || $module_url == "" ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$update_data = array ('module_name' => $module_name, 'module_desc' => $module_desc, 'module_icon' => $module_icon ,'module_url' => $module_url ,
						'module_sort' =>$module_sort);
		if($module_id >1){
			$update_data['online'] =$online;
		}
		$result = Module::updateModuleInfo ( $module_id,$update_data );
		
		if ($result>=0) {
			SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'Module' ,$module_id, json_encode($update_data) );
			$info = array('type'=>'success','cont'=>'更新完成');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	$module_online_optioins = array("1"=>"在线","0"=>"下线");
	Template::assign ( 'module', $module );
	Template::assign ( 'module_online_optioins', $module_online_optioins );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$module_id);
	Template::display ( 'admin/module_modify.tpl' );
}

