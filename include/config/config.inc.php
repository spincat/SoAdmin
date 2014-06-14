<?php
define ('ACCESS',1); 
error_reporting(E_ALL ^ E_NOTICE);
//autoload 使用常量
define ( 'ADMIN_BASE', dirname ( __FILE__ ) . '/../../include' );
define ( 'ADMIN_BASE_LIB', ADMIN_BASE . '/lib/' );
define ( 'ADMIN_BASE_CLASS', ADMIN_BASE . '/class/' );

//Smarty模板使用常量
define ( 'TEMPLATE_DIR', ADMIN_BASE . '/template/' );
define ( 'TEMPLATE_COMPILED', ADMIN_BASE . '/compiled/' );
define ( 'TEMPLATE_PLUGINS', ADMIN_BASE_LIB . 'Smarty/plugins/' );
define ( 'TEMPLATE_SYSPLUGINS', ADMIN_BASE_LIB . 'Smarty/sysplugins/' );
define ( 'TEMPLATE_CONFIGS', ADMIN_BASE . '/config/' );
define ( 'TEMPLATE_CACHE', ADMIN_BASE . '/cache/' );

//后台常量
define ( 'ADMIN_TITLE' ,'SoAdmin');
define ( 'COMPANY_NAME' ,'SoAdmin轻后台 - v1.0');
define ( 'ADMIN_URL' ,'http://www.soadmin.com');
define ( 'COSMODOM_URL' ,'http://www.soadmin.com/cosmodom');

//后台数据库设置
define ( 'OSA_DB_ID' ,'soadmin');
define ( 'OSA_DB_URL','localhost');
define ( 'OSA_DB_PORT','3306');
define ( 'OSA_DB_NAME' ,'soadmin');
define ( 'OSA_USER_NAME','root');
define ( 'OSA_PASSWORD','root');

//样例数据库设置
define ( 'DEMO_DB_ID' ,'soadmin_demo');
define ( 'DEMO_DB_URL','localhost');
define ( 'DEMO_DB_PORT','3306');
define ( 'DEMO_DB_NAME' ,'soadmin_demo');
define ( 'DEMO_USER_NAME','root');
define ( 'DEMO_PASSWORD','root');

//SMTP设置（要测试SMTP邮件功能，请先确定后台账户的邮件地址及邮件密码可用）
define ( 'SMTP_HOST' ,'smtp.ym.163.com');
define ( 'SMTPAUTH',true);    //安全认证
define ( 'SMTPSECURE','ssl'); //SMTP协议
define ( 'SMTP_PORT',994); 
define ( 'SMTP_COMPANY','SOADMIN'); 
define ( 'SMTP_DEBUG',false); 
$SMTP_CONFIGS = array("host"=>SMTP_HOST,"port"=>SMTP_PORT,"auth"=>SMTPAUTH,"secure"=>SMTPSECURE,"company"=>SMTP_COMPANY,"debug"=>SMTP_DEBUG);


//COOKIE加密密钥，建议修改
define( 'OSA_ENCRYPT_KEY','klkii23432sxaa');


//页面设置
define ( 'DEBUG' ,false);
define ( 'PAGE_SIZE', 25 );

//数据库配置
$DATABASE_LIST[OSA_DB_ID] =array ("server"=>OSA_DB_URL,"port"=>OSA_DB_PORT,"username"=> OSA_USER_NAME, "password"=>OSA_PASSWORD, "db_name"=>OSA_DB_NAME );
$DATABASE_LIST[DEMO_DB_ID] = array ("server"=>DEMO_DB_URL,"port"=>DEMO_DB_PORT,"username"=> DEMO_USER_NAME, "password"=>DEMO_PASSWORD, "db_name"=>DEMO_DB_NAME );


$OSADMIN_COMMAND_FOR_LOG=array(	
							'SUCCESS'=>'成功',
							'ERROR'=>'失败',
							'ADD'=>'增加',
							'DELETE'=>'删除',
							'MODIFY'=>'修改',
							'LOGIN'=>'登录',
							'LOGOUT'=>'退出',
							'PAUSE'=>'封停',
							'PLAY'=>'解封',
				);

$OSADMIN_CLASS_FOR_LOG=array(
							'ALL' => '全部',
							'User'=>'用户',
							'UserGroup'=>'账号组',
							'Module'=>'菜单模块',
							'MenuUrl'=>'功能',
							'GroupRole'=>'权限',
							'QuickNote'=>'QuickNote',
              				'Info'=>'信息',
					);
?>