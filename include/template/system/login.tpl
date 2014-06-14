<{include file = "./simple_header.tpl"}>

<body class="login-body"> 
  <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <strong><a class="navbar-brand" href=""><{$smarty.const.COMPANY_NAME}></a></strong>
  </nav>

  <!-- <div class="header"><a href="<{$smarty.const.ADMIN_URL}>/index.php" class="logo"><{$smarty.const.COMPANY_NAME}></a></div> -->
  <div class="content-wrapper container">
    <div class="content row">
        <div class="form-wrapper col-md-4 col-md-offset-4">
          <{$osadmin_action_alert}>
            <form name="loginForm" method="post" data-toggle="validator" role="form">
                <div class="form-header"><p class="form-name">用户登入</p></div>
                <div class="form-group">
                    <input type="text" maxlength="20" class="form-control" name="user_name" value="<{$_POST.user_name}>" placeholder="账号" required>
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" value="<{$_POST.password}>"  placeholder="密码" required>
                </div>
                <div class="form-group verify">
                    <input type="text" class="form-control" name="verify_code"  placeholder="输入验证码" required>
                    <a href="#"><img title="验证码" id="verify_code" src="<{$smarty.const.ADMIN_URL}>/verify_code_cn.php" style="vertical-align:top"></a>
                </div>
                <div class="clearfix"><input type="checkbox" name="remember" value="remember-me"> 记住我 
                   <input type="submit" class="btn btn-primary pull-right" name="loginSubmit" value="登入"/>
               </div>
           </form>
       </div>
   </div>
</div>

<script type="text/javascript">
$("#verify_code").click(function(){
 var d = new Date()
 var hour = d.getHours(); 
 var minute = d.getMinutes();
 var sec = d.getSeconds();
 $(this).attr("src","<{$smarty.const.ADMIN_URL}>/verify_code_cn.php?"+hour+minute+sec);
});
</script>

<{include file = "./footer.tpl"}>


