<script type="text/javascript">
$(function () {

  //输入字数限制
  var limit_inp = $(".limit-input");
  var limit_num = $(".word-nums span");
  var max_num = limit_inp.attr("maxwords"); 
  window.inputs = limit_inp.val();
  limit_num.html(max_num-getCharNums(window.inputs));
  limit_inp.keyup(function(){
    var text = $(this).val();
    var nums = getCharNums(text);
    var ex_num = max_num-nums;
    if(ex_num<0){
      $(this).val(window.inputs);
    }else{
      limit_num.html(ex_num);
      window.inputs = text;
    } 
  })
  
});            

//获取字符总数 中文字符计两字
function getCharNums(text){
  var length = text.length;
  var chinese = text.match(/[^x00-xff]/g);
  var c_num = chinese?chinese.length:0;
  var nums = Math.ceil((length-c_num)/2+c_num);
  return nums;
}
</script>