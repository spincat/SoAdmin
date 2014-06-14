<script type="text/javascript" src="<{$admin_url}>/assets/js/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/phprpc/phprpc_3.0.1_js/compressed/phprpc_client.js"></script>
<script>

function replaceImgs(cont,old_imgurls,new_imgurls){
  var conts = cont;
  for(var i=0;i<old_imgurls.length;i++){
    conts = conts.replace(old_imgurls[i],new_imgurls[i]);
  }
  return conts;
}  

</script>