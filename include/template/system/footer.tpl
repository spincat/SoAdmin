                    
	
					<footer>
                        <hr>
                        <p class="pull-right">Base on SomewhereYu's <a href="http://osadmin.org/" target="_blank">OSAdmin</a></p>

                        <p>&copy; 2014 <a href="http://spincat.me" target="_blank">Spincat.me</a></p>
                    </footer>
				</div>
			</div>
		</div>
    <script src="<{$smarty.const.ADMIN_URL}>/assets/lib/bootstrap/js/bootstrap.js"></script>
	
<!-- + -快捷方式的提示 -->
	
<script type="text/javascript">	
	
alertDismiss("alert-success",3);
alertDismiss("alert-info",10);
	
listenShortCut("fa fa-plus");
listenShortCut("fa fa-minus");
window.back_url = "<{$back_url}>";
</script>
  </body>
</html>