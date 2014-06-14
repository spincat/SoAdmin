<?php
/* Provides missing functionality for older versions of PHP.
 *
 * What:Use to recovery your table data from the osadmin.syslog
 * Copyright: Spincat <spincat.me@gmail.com>
 * Version: 1.0
 * LastModified: 2014-5-17 17:38:18
 * This library is free.  You can redistribute it and/or modify it under GPL.
 */

require '../include/config/config.inc.php';
require '../include/lib/Common.class.php';

spl_autoload_register(array('Common','OSAdminAutoLoad'));
Base::__instance();

$logs = R::getAll("select * from syslog where class_name like 'Book' and action like 'ADD' 
and class_obj not in(select class_obj from syslog where class_name like 'Book' and action like 'DELETE')
order by op_time");

ZugBase::__instance();

//Sec 1: First,We ADD all new records
/*
$sql = "insert into book values ";

foreach ($logs as $i => $log) {
	$infos = json_decode($log['result']);
	// print_r($infos->infocode);
	// exit();
	if($i>0) $sql .= ",";
	$sql .= "(".$log['class_obj'].",'".$infos->infocode."',".$infos->booktype_id.",'".$infos->title."','".$infos->alias."','".$infos->imgurl."','".$infos->author."',null,'".$infos->intro."','".$infos->authorintro."','".$infos->pubdate."',0,'".$infos->user."',"."null)";

}

//Execute the sql
R::exec($sql);

//Write the sql statement in the file
$fh = fopen('book.sql','w'); 
fwrite($fh, $sql);
fclose($fh);*/

Base::__instance();

$logs = R::getAll("select * from syslog where class_name like 'Book' and action like 'MODIFY' 
and class_obj not in(select class_obj from syslog where class_name like 'Book' and action like 'DELETE')
order by op_time desc ");

//Sec 2: Second,Modify some records

$update_sqls = array();
foreach ($logs as $i => $log) {
	$book_id = $log['class_obj'];
	$unique_log = R::getRow("select * from syslog where class_name like 'Book' and action like 'MODIFY' and class_obj = ? order by op_time desc limit 1",
		array($book_id));
	$infos = json_decode($unique_log['result']);
	$sql = "update book set booktype_id = ".$infos->booktype_id.", title = '".$infos->title."',alias = '".$infos->alias."',imgurl = '".$infos->imgurl."',author = '".$infos->author
	."', intro = '".$infos->intro."', authorintro = '".$infos->authorintro."',pubdate = '".$infos->pubdate."', user = '".$infos->user."' where id = ".$book_id;
	array_push($update_sqls,$sql);
}

ZugBase::__instance();
foreach ($update_sqls as $sql) {
	R::exec($sql);
}
?>
