<?php
require '../include/config/config.inc.php';
require '../include/lib/Common.class.php';

spl_autoload_register(array('Common','OSAdminAutoLoad'));
ZugBase::__instance();

$sql = $_POST['sql'];
$result = R::exec($sql);

if($result){
  echo $result;
} else exit('ERROR');

?>
