<{include file ="system/header.tpl"}>
<{include file ="system/navibar.tpl"}>
<{include file ="system/sidebar.tpl"}>
<!-- START 以上内容不需更改，保证该TPL页内的标签匹配即可 -->

<{$osadmid_actiod_alert}>
<{$osadmid_quick_note}>

<div class="well well-sm form-well">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home">详细反馈信息</a></li>
    </ul>	

  <div id="myTabContent" class="tab-content">
    <div class="tab-pane active in" id="home">
      <table class="table table-striped table-bordere table-hover">
        <tbody>
          <tr><td style='width:80px;'>反馈邮箱</td><td><{$feedback->email}></td></tr>
          <tr><td>反馈时间</td><td><{$feedback->createtime|date_format:"%Y-%m-%d %H:%M"}></td></tr>
          <tr><td>反馈IP</td><td><{$feedback->clientip}></td></tr>
          <tr><td>反馈状态</td>
            <td class="status"><{if $feedback->status == 2}>
              <span class="label label-success">已回复</span><{else}>
              <span class="label label-warning">待回复</span><{/if}></td></tr>
              <tr><td>反馈内容</td><td><{$feedback->cont}></td></tr>
              <tr class='success' <{if !$feedback->replycont }> style='display:none;' <{/if}> >
                <td>回复内容</td><td class='reply-cont'><{$feedback->replycont}></td></tr>
            </tbody>
          </table>
          <a href="#myModal" data-toggle="modal" class="btn btn-success reply-button">
            <strong>回复</strong></a>
          <a href="<{$back_url}>" class="btn  btn-primary"><strong>返回</strong></a>
        </div>
      </div>
    </div>

<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">回复邮件</h3>
  </div>
  <div class="modal-body"></div>
  <div class="modal-footer">
    <button class="btn btn-primary submit">发送</button>
    <button class="btn" data-dismiss="modal" aria-hidden="true">取消</button>
  </div>
</div>
<script>
  $("#myModal .submit").click(function(){
    var content = $("#myModal .conts").attr("value");
    if(content){
      var address = '<{$feedback->email}>';
      var subject = "感谢您的反馈";
      var mailData = {address:address,subject:subject,content:content,account:'<{$userinfo->email}>',password:'<{$userinfo->email_password}>',username:'<{$userinfo->real_name}>'}
      sendEmail(mailData);
    }
  })

  $("#myModal").on('show',function() {
    var formStr = "<form><textarea class='conts' name='cont' style='width:480px;height:100px;' placeholder='输入回复内容'></textarea></form>";
    $(".modal-body").html(formStr);
    if($('.reply-button').hasClass('disabled')){
      return false;
    }
  })

  var status = <{$feedback->status}>;
  var debug = $.parseJSON('<{$SMTP_CONFIGS}>').debug;
  checkSendable(status,debug);

/*
* 发送邮件
*/
function sendEmail(mailData){
  var data = $.toJSON(mailData);
  var configs = '<{$SMTP_CONFIGS}>';
  showLoading();
  var client = new PHPRPC_Client('<{$smarty.const.COSMODOM_URL}>/apps/PHPMailer/sendMail.php', ['sendMail']);  
     client.setEncryptMode(2);  
     client.sendMail(data,configs,function(result){  
      if(result.match(/Success/)){
        $.post("<{$admin_url}>/feedback/feedback_view.php",{sended:true,id:<{$feedback->id}>,cont:mailData.content},function(msg,status){
          if(msg){
            $('.status span').html("已回复").attr('class','label label-success');
            $('.reply-cont').html(mailData.content).parent("tr").fadeIn();
            $('#myModal').modal('hide');
            if(!$.parseJSON(configs).debug){
              $('.reply-button').addClass('disabled');
            }
          }
        });
      }else{
        $('.modal-body').html(result.replace(/Error/,''));
        clearTimeout(window.showtip);
      }
    });
}

/*
  检查可发送状态
 */
function checkSendable(status,debug){
  if(status==2&&!debug){
    $('.reply-button').addClass('disabled');
  }
}

var nums = 0;
var tip = "正在发送中";

/*
  显示正在加载提示
 */
function showLoading(){
  var n = nums++;
  var t = tip;
  while(n-->0){
    t += ".";
  }
  $('.modal-body').html(t);
  if(nums>6){
    nums = 0;
  }
  window.showtip =  setTimeout("showLoading('"+t+"')",600);
};

</script>
<!-- END 以下内容不需更改，请保证该TPL页内的标签匹配即可 -->
<{include file="system/footer.tpl" }>
<script type="text/javascript" src="<{$admin_url}>/assets/js/jquery.json-2.4.min.js"></script>
<script type="text/javascript" src="<{$admin_url}>/assets/lib/phprpc/phprpc_3.0.1_js/compressed/phprpc_client.js"></script>