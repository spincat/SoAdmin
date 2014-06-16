<?php
require ('../../include/init.inc.php');
include ("../../assets/lib/phprpc/phprpc_3.0.1_php/phprpc_client.php"); 

$method = $id = $date = $keyword = $page_no = $search = '';
extract ( $_GET, EXTR_IF_EXISTS );

if (Common::isPost()){
  $id = $_POST['id'];
  $method = $_POST['action'];
  if ($method == 'del' && ! empty ( $id )) {
    $info = Info::getInfoById($id);
    $result = Info::delInfo( $id );
    if ($result>=0) {
      //DEL Images
      $imginfo = explode("/",$info->imgurl);
      $ex_path = "/".$imginfo[2]."/";
      $imgname = $imginfo[3];
      $client = new PHPRPC_Client();  
      $client->useService(COSMODOM_URL.'/apps/Fileserver/del4file.php');  
      $client->delImage($ex_path,$imgname); 
      SysLog::addLog ( UserSession::getUserName(), 'DELETE',  'Info' ,$id ,json_encode($info) );
      $info = array('type'=>'success','cont'=>'记录已删除');
    }else{
      $info = array('type'=>'error','cont'=>'未知错误');
    }
  }
  echo json_encode($info);
}else{

  //START 数据库查询及分页数据
  $page_size = PAGE_SIZE;
  $page_no=$page_no<1?1:$page_no;

  if($search){
   $row_count = Info::countSearch($date,$keyword);
   $total_page=$row_count%$page_size==0?$row_count/$page_size:ceil($row_count/$page_size);
   $total_page=$total_page<1?1:$total_page;
   $page_no=$page_no>($total_page)?($total_page):$page_no;
   $start = ($page_no - 1) * $page_size;
   $infos = Info::search($date,$keyword,$start,$page_size);
 }else{
   $row_count = Info::count();
   $total_page=$row_count%$page_size==0?$row_count/$page_size:ceil($row_count/$page_size);
   $total_page=$total_page<1?1:$total_page;
   $page_no=$page_no>($total_page)?($total_page):$page_no;
   $start = ($page_no - 1) * $page_size;
   $infos = Info::getAllInfos( $start , $page_size );
 }

 $page_html=Pagination::showPager("info.php?date=$date&keyword=$keyword&search=$search",$page_no,$page_size,$row_count);

  // 设置模板变量
 Template::assign ('infos',$infos);
 Template::assign ( '_GET', $_GET );
 Template::assign ( 'page_no', $page_no );
 Template::assign ( 'page_html', $page_html );

 Template::display ( 'demo/info.tpl' );

}