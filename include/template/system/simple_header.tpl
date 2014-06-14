<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title><{$page_title}> - <{$smarty.const.ADMIN_TITLE}></title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="<{$smarty.const.ADMIN_URL}>/assets/lib/bootstrap/css/bootstrap.css">
    
    <link rel="stylesheet" href="<{$smarty.const.ADMIN_URL}>/assets/stylesheets_<{if $user_info}><{$user_info.template}><{else}>default<{/if}>/theme.css">
    <link rel="stylesheet" href="<{$smarty.const.ADMIN_URL}>/assets/lib/font-awesome/css/font-awesome.css">

    <script src="<{$smarty.const.ADMIN_URL}>/assets/lib/jquery-1.8.1.min.js" ></script>
    <script src="<{$smarty.const.ADMIN_URL}>/assets/js/other.js" ></script>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
      <![endif]-->
  </head>