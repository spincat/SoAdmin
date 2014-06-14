<?php
require ('../../include/init.inc.php');
$menu_id = $menu_name = $menu_url = $module_id = $is_show =$online = $shortcut_allowed = $menu_desc = $father_menu = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );

Common::checkParam($menu_id);

$menu = MenuUrl::getMenuById ( $menu_id );

if(empty($menu)){
	Common::exitWithError(ErrorMessage::MENU_NOT_EXIST,"admin/menus.php");
}

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
	if($menu_name == "" || $menu_url =="" || ($menu_id>100 && empty($module_id)) ){
		$info = array('type'=>'error','cont'=>ErrorMessage::NEED_PARAM);
	}else{
		$exist = false;
		$menu_exist = MenuUrl::getMenuByUrl($menu_url);
		if(!empty($menu_exist)){
			if($menu_id!=$menu_exist->id){
				$exist=true;
				$info = array('type'=>'error','cont'=>ErrorMessage::MENU_URL_CONFLICT);
			}
		}
		if(!$exist){
			$update_data = array ('menu_name' => $menu_name, 'menu_url' => $menu_url,  
				'is_show' => $is_show, "online" => $online,'menu_desc' => $menu_desc, 'shortcut_allowed' => $shortcut_allowed,
				'father_menu' => $father_menu);
			if($menu_id > 100){
				$update_data['module_id'] = $module_id;
			}
			$result = MenuUrl::updateMenuInfo ( $menu_id,$update_data );
			if ($result>=0) {
				SysLog::addLog ( UserSession::getUserName(), 'MODIFY', 'MenuUrl' ,$menu_id, json_encode($update_data) );
				$info = array('type'=>'success','cont'=>'更新完成');
			} else {
				$info = array('type'=>'error','cont'=>'未知错误');
			}
		}
	}
	echo json_encode($info);
}else{
	$module_options_list = Module::getModuleForOptions ();
	$father_menu_options_list = MenuUrl::getFatherMenuForOptions ();

	$show_options_list=array("1"=>"显示","0"=>"不显示");
	$online_options_list=array("1"=>"在线","0"=>"下线");
	$shortcut_allowed_options_list = array("1"=>"允许","0"=>"不允许");
	Template::assign ( 'menu', $menu );
	Template::assign ( 'module_options_list', $module_options_list );
	Template::assign ( 'father_menu_options_list', $father_menu_options_list );
	Template::assign ( 'show_options_list', $show_options_list );
	Template::assign ( 'online_options_list', $online_options_list );
	Template::assign ( 'shortcut_allowed_options_list', $shortcut_allowed_options_list );
	Template::assign ( 'back_url', $_SERVER['HTTP_REFERER']."#".$menu_id);
	Template::display ( 'admin/menu_modify.tpl' );	
}
