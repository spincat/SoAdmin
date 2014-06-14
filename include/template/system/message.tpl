<{include file="./simple_header.tpl"}>
<body class=""> 
    <div class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-inner">
            <p class="navbar-text navbar-left">
                <strong><a class="navbar-link" href="<{$smarty.const.ADMIN_URL}>/index.php"><{$smarty.const.COMPANY_NAME}></a></strong>
            </p>
        </div>
        <!--End By Navibar Inner-->
    </div>
    <!--End By Navibar-->

    <div class="container message">
		<div class="row">
			<div class="col-md-12">
				<div class="back-info">
					<{if $type =="success" }>
					<h1>Yep!</h1>
					<{elseif $type=="error" }>
					<h1>Oops!</h1>
					<{else }>
					<h1>O~!</h1>
					<{/if }>
					<p class="info"><{$message_detail}></p>
					<h2>返回 <a href="<{$smarty.const.ADMIN_URL}><{$forward_url}>"><{$forward_title}></a></h2>
				</div>
			</div>
		</div>

<{include file="./footer.tpl"}>


