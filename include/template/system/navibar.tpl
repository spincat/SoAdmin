<body class=""> 
    <div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-inner">
            <ul class="nav nav-pills navbar-nav navbar-right">
                <{if $user_info.setting}>
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" title="设置">
                            <i class="fa fa-cog"></i>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="<{$smarty.const.ADMIN_URL}>/admin/setting.php">系统设置</a></li>
                        </ul>
                    </li>
                <{/if}>
                <li class="dropdown">
                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" title="皮肤">
                        <i class="fa fa-magic"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="<{$smarty.const.ADMIN_URL}>/admin/set.php?t=default">默认模板</a></li>
                        <li><a href="<{$smarty.const.ADMIN_URL}>/admin/set.php?t=lumen">光影流年</a></li>
                        <li><a href="<{$smarty.const.ADMIN_URL}>/admin/set.php?t=wintertide">冰雪冬季</a></li>
                        <li><a href="<{$smarty.const.ADMIN_URL}>/admin/set.php?t=schoolpainting">青葱校园</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown" title="<{$user_info.user_name}>">
                        <i class="fa fa-user"></i>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="<{$smarty.const.ADMIN_URL}>/admin/profile.php">我的账号</a></li>
                        <li><a tabindex="-1" href="<{$smarty.const.ADMIN_URL}>/logout.php">登出</a></li>
                    </ul>
                </li>
            </ul>
            <p class="navbar-text navbar-left">
                <strong><a class="navbar-link" href="<{$smarty.const.ADMIN_URL}>/index.php"><{$smarty.const.COMPANY_NAME}></a></strong>
            </p>
        </div>
        <!--End By Navibar Inner-->
    </div>
    <!--End By Navibar-->