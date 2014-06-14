<?php
require ('../../include/init.inc.php');
$method = $module_id = '';
extract ( $_GET, EXTR_IF_EXISTS );

if (Common::isPost()){
	$module_id = $_POST['id'];
	$method = $_POST['action'];
	if ($method == 'del' && ! empty ( $module_id )) {
		$menus = Module::getModuleMenu($module_id);
		if(sizeof($menus)>0){
			$info = array('type'=>'error','cont'=>ErrorMessage::HAVE_FUNC);
		}else if(intval($module_id) === 1){
			$info = array('type'=>'error','cont'=>ErrorMessage::CAN_NOT_DELETE_SYSTEM_MODULE);
		}else{
			$module=Module::getModuleById($module_id);
			$result = Module::delModule ( $module_id );
			if ($result) {
				SysLog::addLog ( UserSession::getUserName(), 'DELETE', 'Module' ,$module_id, json_encode($module->export()) );
				$info = array('type'=>'success','cont'=>'模块删除成功');
			}
		}
		echo json_encode($info);
	}
}else{
	$modules = Module::getAllModules();
	$confirm_html = OSAdmin::renderJsConfirm("icon-remove");
	Template::assign ( 'modules', $modules );
	
	Template::display ( 'admin/modules.tpl' );
}