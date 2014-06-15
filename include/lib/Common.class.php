<?php

class Common {

	//获取OSAdmin的action_url，用于权限验证
	public static function getActionUrl(){
		$action_script=$_SERVER['SCRIPT_NAME'];
		$sub_url = parse_url(ADMIN_URL,PHP_URL_PATH);
		$filter_url = addcslashes($sub_url,'/');
		$action_url = preg_replace('/^'.$filter_url.'(\/modules)?/','',$action_script);//过滤默认模块访问路径
		return $action_url;
	}
	
	public static function exitWithMessage($message_detail, $forward_url, $second = 3,$type="message") {

		switch ($type) {
			case "success" :
			$page_title="操作成功！";
			break;
			case "error":
			$page_title="错误!";
			break;
			default:
			$page_title="嗯!";
			break;
		}
		$temp = explode('?',$forward_url);
		$file_url = $temp[0];
		if($file_url{0} !=="/"){
			$file_url ='/'.$file_url;
			$forward_url ='/'.$forward_url;
		}
		$menu = MenuUrl::getMenuByUrl($file_url);
		$forward_title = "首页";
		if(sizeof($menu)>0){
			$forward_title = $menu['menu_name'];
		}
		if ($forward_url) {
			$message_detail = "$message_detail <script>setTimeout(\"window.location.href ='".ADMIN_URL."$forward_url';\", " . ($second * 1000) . ");</script>";
		}
		Template::assign ( 'type', $type );
		Template::assign ( 'page_title', $page_title );
		Template::assign ( 'message_detail', $message_detail );
		Template::assign ( 'forward_url', $forward_url );
		Template::assign ( 'forward_title', $forward_title);
		Template::Display ( 'system/message.tpl' );
		exit();
	}
	
	public static function exitWithError($message_detail, $forward_url, $second = 3,$type="error") {
		self::exitWithMessage($message_detail, $forward_url, $second ,$type);
	}
	
	public static function exitWithSuccess($message_detail, $forward_url, $second = 3 ,$type="success") {
		self::exitWithMessage($message_detail, $forward_url, $second, $type);
	}
	
	public static function checkParam($param,$to_url=null){
		
		if($to_url == null ){
			if(array_key_exists('HTTP_REFERER',$_SERVER)){
				$referer = $_SERVER['HTTP_REFERER'];
			}
			if(!empty($referer)){
				$start = strpos($referer,ADMIN_URL);
				$to_url = substr($referer,$start+strlen(ADMIN_URL));
			}else{
				$to_url = 'index.php';
			}
		}
		
		if (empty ( $param )) {
			Common::exitWithError ( '缺少必要的参数', $to_url ,3,"error" );
		}
	}
	
	public static function jumpUrl($url) {
		
		Header ( "Location: ".ADMIN_URL."/$url" );
		return true;
	}
	
	public static function isPost() {
		return $_SERVER ['REQUEST_METHOD'] === 'POST' ? TRUE : FALSE;
	}
	
	public static function isGet() {
		return $_SERVER ['REQUEST_METHOD'] === 'GET' ? TRUE : FALSE;
	}
	
	public static function getIp() {
		if (getenv ( "HTTP_CLIENT_IP" ) && strcasecmp ( getenv ( "HTTP_CLIENT_IP" ), "unknown" )) {
			$ip = getenv ( "HTTP_CLIENT_IP" );
		} elseif (getenv ( "HTTP_X_FORWARDED_FOR" ) && strcasecmp ( getenv ( "HTTP_X_FORWARDED_FOR" ), "unknown" )) {
			$ip = getenv ( "HTTP_X_FORWARDED_FOR" );
		} elseif (getenv ( "REMOTE_ADDR" ) && strcasecmp ( getenv ( "REMOTE_ADDR" ), "unknown" )) {
			$ip = getenv ( "REMOTE_ADDR" );
		} elseif (isset ( $_SERVER ['REMOTE_ADDR'] ) && $_SERVER ['REMOTE_ADDR'] && strcasecmp ( $_SERVER ['REMOTE_ADDR'], "unknown" )) {
			$ip = $_SERVER ['REMOTE_ADDR'];
		} else {
			$ip = "unknown";
		}
		return ($ip);
	}
	
	public static function getDateTime($time = null) {
		
		return (!is_numeric($time)) ? date ( 'Y-m-d H:i:s' ) : date( 'Y-m-d H:i:s', $time);
	}
	
	public static function getTime() {
		return strtotime(date( 'Y-m-d H:i:s' ));
	}

		//返回当前时间（秒.微妙）
	public static function getFloatMicrotime()
	{
		list($usec, $sec) = explode(" ", microtime());
		return ((float)$usec + (float)$sec);
	}
	
	//计时函数   
	public static function runtime($mode=0){
		static $t;   
		if(!$mode){   
			$t = microtime();
			return;
		}   
		$t1 =  microtime();   
		list($m0,$s0) = explode(" ",$t);   
		list($m1,$s1) = explode(" ",$t1);   
		return sprintf("%.3f ",($s1+$m1-$s0-$m0));
	}

	public static function getSysInfo() {
		$sys_info_array = array ();
		$sys_info_array ['gmt_time'] = gmdate ( "Y年m月d日 H:i:s", time () );
		$sys_info_array ['bj_time'] = gmdate ( "Y年m月d日 H:i:s", time () + 8 * 3600 );
		$sys_info_array ['server_ip'] = gethostbyname ( $_SERVER ["SERVER_NAME"] );
		$sys_info_array ['software'] = $_SERVER ["SERVER_SOFTWARE"];
		$sys_info_array ['port'] = $_SERVER ["SERVER_PORT"];
		$sys_info_array ['admin'] = $_SERVER ["SERVER_ADMIN"];
		$sys_info_array ['diskfree'] = intval ( diskfreespace ( "." ) / (1024 * 1024) ) . 'Mb';
		$sys_info_array ['current_user'] = @get_current_user ();
		$sys_info_array ['timezone'] = date_default_timezone_get();
		$mysql_version = R::getAll("select version()");
		$sys_info_array ['mysql_version'] = $mysql_version[0]['version()'];
		return $sys_info_array;
	}
	
	public static function transact($options) {
		$temp_array = array ();
		foreach ( $options as $k => $v ) {
			if (is_null ( $v ) || (is_string ( $v ) && trim ( $v ) == ''))
				$v = '';
			else
				is_array ( $v ) ? $v = self::transact ( $v ) : $v = ( string ) $v;
			$temp_array [$k] = $v;
		}
		return $temp_array;
	}
	
	public static function getRandomIp() {
		$ip = '';
		for($i = 0; $i < 4; $i ++) {
			$ip_str = rand ( 1, 255 );
			$ip .= ".$ip_str";
		}
		$ip = substr($ip, 1);
		
		return $ip;
	}
	
	public static function filterText($text){
		if(ini_get('magic_quotes_gpc')){
			$text=stripslashes($text);
		}
		return $text;
	}

	public static function dealStr($conts){
		$text = preg_replace("/<.*?>|\s|&.*?;/i","",$conts);
		$fend = "。";
		$intro = str_ireplace("/<.*?>|\s|&.*?;/i",'',mb_substr($text,0,85,'utf-8'));
		if(substr($intro,-3,4)!=$fend)
			$intro .= ' ... ';
		return $intro;
	}

	public static function creatInfoCode($tablename){
		$tname = strtoupper($tablename);
		$prefix = substr($tname,0,1) ."-". substr($tname,-2,2);
		$infocode = uniqid($prefix);
		return $infocode;
	}

  //去除HTML代码中的空隙
	public static function delGap($html){
		$text = preg_replace("/>[\s　&nbsp;]*</i","><",$html);
		$text = preg_replace("/;(\s+)\"/",";\"",$text);
		return $text;
	}

  //过滤HTML中的部分标签 ex: <br> => <p> 
	public static function filterTag($html){
		$text = preg_replace("/<br \/>/i","</p><p>",$html);
		$text = preg_replace("/<p[^<]+?>(.*?)<p>/i","<p>$1</p><p>",$text);
		$text = preg_replace("/<p>[\s　&nbsp;]*?<\/?p>/i","",$text);
		$text = preg_replace("/<(\/?)p[^<]+?>/i","<$1p>",$text);
		$text = preg_replace("/<p>[\s　&nbsp;]*/i","<p>",$text);
		return self::delGap($text);
	}

  //按照资讯格式过滤HTML中的部分标签 ex: <br> 
	public static function filterNews($html){
		$text = preg_replace("/<br \/>/i","",$html);
		$text = preg_replace("/<p>[\s　&nbsp;]*/iu","<p>",$text);
		$text = preg_replace("/<p><\/p>/i","",$text);
		return self::delGap($text);
	}

	//过滤采集来的文章内容中的部分标签和属性 ex [style]、<script>
	//过滤白名单以外所有标签
	public static function filter4Collect($html,$white_list){
		$text = preg_replace("/<!--.*-->/i","",$html);
		$regexp = "/<(?!";
		foreach ($white_list as $i => $tag) {
			$regexp .= "\/?".$tag."|";
		}
		$regexp = rtrim($regexp,'|').').*?>/i';
		$text = preg_replace($regexp,"",$text);
		return self::delGap($text);
	}

  //将转义符转换为HTML标签 ex: text\n => <p>text</p>
	public static function convert2HTML($text){
		$text = preg_replace("/\n/i","</p><p>",$text);
		$text = "<p>".$text."</p>";
		return $text;
	}

  //转换HTML中的图片地址 
  //Mode 1 转换为绝对地址 0 转换为相对地址
	public static function convertImgUrl($html,$mode,$host){
		if($mode==1){
			$html =  preg_replace('/img([^>]*?)src=\"(.*?)\"/','img$1src="'.$host.'$2"',$html);
		}else if($mode==0){
			$html =  str_replace($host,'',$html);
		}
		return $html;
	}

  //自动加载类文件
	public static function OSAdminAutoLoad($classname){
		if(strchr($classname,'Model_')){
			return ;
		}
		$filename = str_replace('_', '/', $classname) . '.class.php';
    // class类
		$filepath = ADMIN_BASE_CLASS . $filename;
		if (file_exists($filepath)) {
			return include $filepath;
		}else{
		//仅对Class仅支持一级子目录
		//如果子目录中class文件与CLASS根下文件同名，则子目录里的class文件将被忽略

			$handle=opendir(ADMIN_BASE_CLASS);

			while (false !== ($file = readdir($handle))) {
				if (is_dir(ADMIN_BASE_CLASS. "/" . $file)) {
					$filepath=ADMIN_BASE_CLASS."/".$file."/".$filename;
					if (file_exists($filepath)) {
						return include $filepath;
					}
				}
			}
		}
    //lib库文件
		$filepath = ADMIN_BASE_LIB . $filename;
		if (file_exists($filepath)) {
			return include $filepath;
		}

		throw new Exception( $filepath . ' NOT FOUND!');
	}

	public static function getPureText($content){
		return preg_replace("/[^\x{4e00}-\x{9fa5}]/u",'',$content);
	}
}