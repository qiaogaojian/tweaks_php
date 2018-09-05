<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<!-- saved from url=(0026)game/ -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <title><?php echo C('MT_SITE_TITLE');?></title>    
	<meta name="keywords" content="<?php echo C('WEB_SITE_KEYWORD');?>">    
	<meta name="description" content="<?php echo C('WEB_SITE_DESCRIPTION');?>">            
	<meta http-equiv="Cache-Control" content="no-transform">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <meta name="mobile-agent" content="format=html5;url=">
    <meta http-equiv="mobile-agent" content="format=xhtml; url=">
    <link rel="shortcut icon" href="favicon.ico">
    <link rel="stylesheet" type="text/css" media="all" href="/project/vlcms/Public/Media/css/base.css">
    <link rel="stylesheet" type="text/css" media="all" href="/project/vlcms/Public/Media/css/index.css">
    <script type="text/javascript" src="/project/vlcms/Public/static/jquery-2.0.3.min.js"></script>
	<!-- <script type="text/javascript" src="/project/vlcms/Public/Media/js/jquery.min.js"></script> -->
	<script type="text/javascript" src="/project/vlcms/Public/Media/js/function.js"></script>
</head>
<body>
<div class="topbar">
    <div class="wrap_w">
        <div class="topleft"><a href="<?php echo U('Game/game_list');?>">游戏中心</a> <span>|</span> <a href="<?php echo U('Game/gift_list');?>">礼包中心</a> </div>
        <div class="top">

                 <div class="fl">
                        <div id="xguc_login_script">
							
						</div>
                </div>

            </div>
        </div>
    </div>
<div class="header">
    <div class="wrap_w clearfix">
        <div class="logo" style="background:url({/project/vlcms:get_cover(C('MT_SITE_LOGO'),'path')}) no-repeat 0 0;"><a href="<?php echo U('Index/index');?>">溪谷游戏</a></div>
        <div class="header-search">
            <div class="searchbar">
                <form action="<?php echo U('Game/game_list');?>" method="post">
					<input type="hidden" name="search_page" value="<?php echo CONTROLLER_NAME.'/'.ACTION_NAME;?>"/>				
                    <input type="text"   class="searchstyle" name="search_key" value="" x-webkit-speech="" speech="">
                    <input type="submit" class="searchebtn" value="搜索">
                </form>
            </div>
           <!--  <div class="searchhot"><span>热门搜索词：</span>
				<?php if(is_array($aaa)): $i = 0; $__LIST__ = $aaa;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$s): $mod = ($i % 2 );++$i;?><a href="/index.php/Search/index?keywords=<?php echo ($s["game_name"]); ?>"><?php echo ($s["game_name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
			</div> -->
        </div>
        <div class="header-flash">
			<a  href="<?php echo ($single_img['slideurl']); ?>" target="_blank"><img src="<?php echo ($single_img['cover']); ?>"></a>
		</div>
    </div>
</div>
<div class="menu clearfix">
    <ul class="wrap_w">
        <li class="<?php if(CONTROLLER_NAME== Index): ?>cur<?php endif; ?>"><a href="<?php echo U('Index/index');?>">首  页</a></li>
        <li class="<?php if((ACTION_NAME == game_list) or (ACTION_NAME == game_detail) or ($search_page == game_list)): ?>cur<?php endif; ?>">
            <a href="<?php echo U('Game/game_list');?>">游戏中心</a>
        </li>
        <li class="<?php if((ACTION_NAME == gift_list) or ($search_page == gift_list)): ?>cur<?php endif; ?>">
            <a href="<?php echo U('Game/gift_list');?>">独家礼包</a>
        </li>
        <li class="<?php if(CONTROLLER_NAME== Article): ?>cur<?php endif; ?>"><a href="<?php echo U('Article/index?category=media');?>">新闻中心</a></li>
        <li class="<?php if(CONTROLLER_NAME== Service): ?>cur<?php endif; ?>"><a href="<?php echo U('Service/index');?>">客服中心</a></li>
        
    </ul>
    
</div> 

	<?php if(!(CONTROLLER_NAME== Index)): ?><link rel="stylesheet" type="text/css" media="all" href="/project/vlcms/Public/Media/css/sub.css"><?php endif; ?>
    
<style>
#q_05{ position:relative;}
#q_05 em{ background:#F00; border-radius:15px; text-align:center; position:absolute; width:45px; height:25px; line-height:25px; color:#fff; right:-10px;top:0;}

</style>
<!--main-->
<div class="wrap_w">
  <div class="crumbs"><em>当前位置：</em><span></span>
  <a href="<?php echo U('Service/index');?>">客服中心</a></div>
  <div id="service_box">
    <div id="service_main">
      <ul class="clearfix">
        <li id="q_01"><a href="<?php echo U('Service/spwd');?>"><span>密码问题</span></a></li>
        <li id="q_02"><a href="<?php echo U('Service/spay');?>"><span>充值问题</span></a></li>
        <li id="q_03"><a href="<?php echo U('Service/saccont');?>"><span>账户问题</span></a></li>
        <li id="q_04"><a href="<?php echo U('Service/sgift');?>"><span>礼包问题</span></a></li>
<!--         <li id="q_05"><a href=""><span>申诉中心</span></a><em>即时</em></li>
        <li id="q_01"><a href=""><span>密码问题</span></a></li>
        <li id="q_02"><a href=""><span>充值问题</span></a></li>
        <li id="q_03"><a href=""><span>账户问题</span></a></li>
        <li id="q_04"><a href=""><span>礼包问题</span></a></li> -->
      </ul>
    </div>
    <div id="service_bot" class="clearfix">
      <div id="left">
        <div id="left_t" class="clearfix">
          <div class="l">常见问题</div>
          <div class="r">
<!--             <form class="clearfix">
              <input type="text" class="txt">
              <input type="submit" class="sub">
            </form> -->
          </div>
        </div>
        <div id="left_ms">
          <ul>
			<!-- <?php if(is_array($sindex)): foreach($sindex as $key=>$si): ?><li> <a href="<?php echo U('Service/'.$si['sMark'].'?#'.$si['id'].'');?>"><?php echo ($si["sName"]); ?></a></li><?php endforeach; endif; ?> -->
				<li> <a href="<?php echo U('Service/saccont#23');?>">游戏闪退和无法登录解决方法？</a></li>
				<li> <a href="<?php echo U('Service/spay#14');?>">充值中心提供了哪些充值方式?</a></li>
				<li> <a href="<?php echo U('Service/spay#15');?>">如何选择合适的充值方式?</a></li>
				<li> <a href="<?php echo U('Service/spwd#12');?>">游戏账号的密码忘记了，怎么办?</a></li>
				<li> <a href="<?php echo U('Service/saccont#30');?>">游戏账号忘记了,怎么办?</a></li>
				<li> <a href="<?php echo U('Service/saccont#58');?>">一个手机号码可以绑定几个账号？</a></li>
				<li> <a href="<?php echo U('Service/sgift#62');?>">什么时候发放最新的礼包？</a></li>
				<li> <a href="<?php echo U('Service/sgift#19');?>">平台游戏的新手卡激活码如何领取?</a></li>
				<li> <a href="<?php echo U('Service/saccont#22');?>">梦幻游戏账号问题?</a></li>
				<li> <a href="<?php echo U('Service/spay#24');?>">先玩后付用不了?</a></li>
          </ul>
        </div>
        
      </div>
      <div id="right">
        <div class="right_each" id="right_01">
          <h2>在线客服</h2>
          <div class="con">
            <!-- WPA Button Begin -->
            <!-- <script charset="utf-8" type="text/javascript" src="images/wpa.php"></script> -->
            <!-- WPA Button End -->
            <p>通过在线客服咨询产品问题<br>
              工作时间：<?php echo C('MT_SITE_TIME');;?></p>
          </div>
        </div>
        <div class="right_each" id="right_02">
          <h2>服务热线</h2>
          <div class="con">
           <span><?php echo C('MT_SITE_TEL');?></span>
            <p>服务热线仅收市话费<br>
              工作时间：<?php echo C('MT_SITE_TIME');;?></p>
          </div>
        </div>
        <div class="right_each" id="right_03">
          <h2>官方微信</h2>
          <div class="con">
            <p>扫描关注官方微信</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="footer">
    <div class="area wrap_w">
            <div class="f-links"> <span>友情链接：</span>
            <div class="roll">
                <ul>
					<?php $_result=get_links_list(2);if(is_array($_result)): $i = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$data): $mod = ($i % 2 );++$i;?><li><a target="_blank" href="<?php echo ($data["link_url"]); ?>" title="<?php echo ($data["title"]); ?>" ><?php echo ($data["title"]); ?></a></li><?php endforeach; endif; else: echo "" ;endif; ?>
				</ul>
            </div>
            </div>
                <div class="infoot">
                                <!-- <div class="logo" ><a href="<?php echo U('Index/index');?>">溪谷游戏</a></div> -->

            <div class="ifl" style="background:url(<?php echo get_cover(C('MT_SITE_LOGO'),'path');?>) no-repeat 0 0;"> </div>
            <div class="ifc">
                <p>
					<a href="<?php echo U('Article/detail/id/10');?>" target="_blank" class="leftno">关于我们</a><span>|</span>
					<a href="<?php echo U('Article/detail/id/11');?>" target="_blank">商务合作</a><span>|</span>
					<a href="<?php echo U('Article/detail/id/13');?>" target="_blank">合作伙伴</a><span>|</span>
					<a href="<?php echo U('Article/detail/id/12');?>" target="_blank">家长监督</a><span>|</span>
					<a href="<?php echo U('Service/index');?>" target="_blank"> 客服帮助</a><span>|</span>
					<!-- <a href="<?php echo U('About/index?type=74');?>" target="_blank"> 移动版</a> -->
				</p>
				<p>客服电话：<?php echo C('MT_SITE_TEL');?></p>
				<p>网站备案：<?php echo C('WEB_SITE_ICP');?>&nbsp;&nbsp;<?php if(C('MT_SITE_LICENSE') == ''): ?>网络文化经营许可证编号：<?php echo C('MT_SITE_LICENSE'); endif; ?></p>
				<p><?php echo C('MT_SITE_B');?></p>
            </div>

            <div class="ifr"  style="background:url(<?php echo get_cover(C('MT_SITE_DIMENSION'),'path');?>) no-repeat 0 0;background-size: 80px 80px">
                <p>扫描二维码</p>
                <p>关注官方微信</p>
               
            </div>
        </div>
    </div>
</div>
<!--用户登录显示-->
<div class="mask" id="xguc_mask"></div>
<div class="login" id="xguc_login">
    <h3><span class="login_close">×</span>溪谷用户登录</h3>
    <p class="tips"><!-- 小提示:溪谷论坛用户和溪谷游戏用户均可登录哟 --></p>
    <form class="formbox" id="xguc_login_form" onsubmit="return false;">
        <div class="login_u">
            <input name="account" id="username" class="txtinput" type="text" placeholder="用户名" value="">
        </div>
        <div class="login_p">
            <input name="password" id="password" class="txtinput" type="password" placeholder="密码" value="">
        </div>
        <div class="login_m">
            <span class="l">
                <input type="checkbox" name="save" id="save" value="1">
                下次自动登录
            </span>
            <!-- <span class="r"><a href="#">忘记密码</a></span> -->
        </div>
        <div class="login_b">
            <input id="sub" value="登录" type="submit">
        </div>
        <div class="login_notice"></div>
    </form>
    <div class="login_else"><a href="javascript:;" onclick="XGUC.reg()">没有帐号，立即注册！</a></div>
</div>
<!--用户登录显示 END-->
<!--用户注册显示-->
<div class="reg" id="xguc_reg">
    <h3><span class="reg_close">×</span>溪谷用户注册</h3>
    <form class="formbox" id="xguc_reg_form" onsubmit="return false;">
        <div class="reg_u">
            <label>用户名</label>
            <input name="account" id="username" class="txtinput" type="text" placeholder="用户名" value="">
        </div>
        <div class="reg_p">
            <label>密  码</label>
            <input name="password" id="password" class="txtinput" type="password" placeholder="密码" value="">
        </div>
        <div class="reg_p">
            <label>验证码</label>
            <input name="verifycode" id="verifycode" class="txtcode" type="text" placeholder="验证码" value="">
            <img src="/project/vlcms/index.php?s=/Member/verify" onclick="javascript:this.src=&#39;/project/vlcms/index.php?s=/Member/verify/&#39;+Math.random()" style="cursor:pointer;">
        </div>
        <div class="reg_m">
            <input type="checkbox" id="reg_is_ok" checked="checked" value="1"> 我已阅读并接受<a href="javascript:;">《溪谷最终用户协议》</a></div>
        <div class="reg_b">
            <input id="sub" value="注册" type="submit">
        </div>
        <div class="reg_notice"></div>
    </form>
    <div class="reg_else"><a href="javascript:;" onclick="XGUC.login()">已有帐号，立即登录</a></div>
    <div class="reg_other">
    </div>
</div>
<!--用户注册显示 END-->
<script type="text/javascript" src="/project/vlcms/Public/Media/js/jquery.zclip.min.js"></script>
<script type="text/javascript" src="/project/vlcms/Public/Media/js/xigu.uc.js"></script>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
    $("img").error(function() { 
        $(this).attr("src", "logo.png"); 
    }); 
}) 
</script>