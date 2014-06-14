<?php
require ('../../include/init.inc.php');
$module_name = $module_desc = $module_sort = $module_url = $module_icon ='';
$_POST['module_sort'] = 1;
extract ( $_POST, EXTR_IF_EXISTS );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$module_name = $data['module_name'];
	$module_desc = $data['module_desc'];
	$module_sort = $data['module_sort'];
	$module_url = $data['module_url'];
	$module_icon = $data['module_icon'];
	$exist = Module::getModuleByName($module_name);
	if($exist){
		$info = array('type'=>'error','cont'=>ErrorMessage::NAME_CONFLICT);
	}else if($module_name =="" || $module_url == ""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$input_data = array ('module_name' => $module_name, 'module_desc' => $module_desc, 'module_url' => $module_url ,'module_sort' =>$module_sort,'module_icon' =>$module_icon);
		$module_id = Module::addModule ( $input_data );
		if ($module_id) {
			SysLog::addLog ( UserSession::getUserName(), 'ADD', 'Module' , $module_id, json_encode($input_data) );
			$info = array('type'=>'success','cont'=>'模块添加成功');
		}else{
			$info = array('type'=>'error','cont'=>'未知错误');
		}
	}
	echo json_encode($info);
}else{
	Template::assign("_POST" ,$_POST);
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display('admin/module_add.tpl' );
}
