<?php
require ('../../include/init.inc.php');
$menu_name = $module_id = $is_show = $online = $shortcut_allowed = $menu_desc = $father_menu = '';
extract ( $_POST, EXTR_IF_EXISTS );

if (Common::isPost ()) {
	$data = $_POST["data"];
	$menu_name = $data['menu_name'];
	$module_id = $data['module_id'];
	$menu_url = $data['menu_url'];
	$is_show = $data['is_show'];
	$online = $data['online'];
	$shortcut_allowed = $data['shortcut_allowed'];
	$menu_desc = $data['menu_desc'];
	$father_menu = $data['father_menu'];
	if($menu_name=="" || $module_id == ""|| $menu_url == ""){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$menu = MenuUrl::getMenuByUrl($menu_url);
		if(!empty($menu)){
			$info = array('type'=>'error','cont'=>ErrorMessage::MENU_URL_CONFLICT);
		}else{
			$input_data = array ('menu_name' => $menu_name, 'module_id' => $module_id, 'menu_url' => $menu_url,  
				'is_show' => $is_show, 'online' =>1 , 'menu_desc' => $menu_desc ,'shortcut_allowed'=>$shortcut_allowed,'father_menu'=>$father_menu );
			$menu_id = MenuUrl::addMenu ( $input_data );
			if ($menu_id) {
				SysLog::addLog ( UserSession::getUserName(), 'ADD', 'MenuUrl' ,$menu_id ,json_encode($input_data));
				$info = array('type'=>'success','cont'=>'链接添加成功');
			}else{
				$info = array('type'=>'error','cont'=>'未知错误');
			}
		}
	}
	echo json_encode($info);
}else{
	$module_options_list = Module::getModuleForOptions ();
	$father_menu_options_list = MenuUrl::getFatherMenuForOptions ();
	Template::assign ( '_POST', $_POST );
	Template::assign ( 'module_options_list', $module_options_list );
	Template::assign ( 'father_menu_options_list', $father_menu_options_list );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']);
	Template::display ( 'admin/menu_add.tpl' );
}
