<?php
require ('../../include/init.inc.php');
$t = '';
extract ( $_REQUEST, EXTR_IF_EXISTS );
$current_user_id = UserSession::getUserId();
$templates=array("default","lumen","wintertide","schoolpainting");

if(!in_array($t,$templates)){
	$t="default";
}
$ret=User::setTemplate(UserSession::getUserId(),$t);

$_SESSION[UserSession::SESSION_NAME]['template']=$t;
$rand=rand(0,10000);
$back_url=$_SERVER['HTTP_REFERER']."#".$rand;
header("Location:$back_url");