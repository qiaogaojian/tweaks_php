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
    
<div class="main_sub wrap_w">
    <div class="crumbs"><em>当前位置：</em>
	<span></span><a href="<?php echo U('Game/game_list');?>">游戏中心</a></div>
    <div class="gameclass">
        <h2 class="titi">游戏<span>分类</span></h2>
        <ul class="gameclasslist">
            <li><span>游戏类型</span>
                <p>
                    <a href="<?php echo U('Game/game_list?game_type=0');?>" class="<?php if(I("game_type") == 0): ?>curr<?php endif; ?>">全部</a>
                    <?php $_result=get_game_type_arr();if(is_array($_result)): $k = 0; $__LIST__ = $_result;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($k % 2 );++$k;?><a href="<?php echo U('Game/game_list?game_type='.$vo["id"]);?>" class="<?php if(I("game_type")== $k): ?>curr<?php endif; ?>"><?php echo ($vo["name"]); ?></a><?php endforeach; endif; else: echo "" ;endif; ?>
				</p>
            </li>
        </ul>
    </div>
    <ul class="gameslist clearfix">
        <?php if(is_array($list_data)): $i = 0; $__LIST__ = $list_data;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li>
				
			<span class="gampi gx"></span>
			
            <a href="<?php echo U('Game/game_detail','id='.$vo['id'].'');?>" target="_blank" class="gameslistl">   
			<img src="/project/vlcms<?php echo (get_cover($vo["icon"],'path')); ?>">
            </a>
            <div class="gameslistr">
                <h3>
                    <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">
                        <?php echo ($vo["game_name"]); ?>
                    </a>
                </h3>
                <p>
                    <span>类型：<?php echo get_game_type($vo['game_type']);?></span>
					<span>更新时间：<?php echo (date("Y-m-d",$vo["create_time"])); ?></span>
                </p>
                <p class="jianjie"> 
                    <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">
                        简介：<?php echo get_game_introduction($vo['id'],25);?>
                    </a>
                </p>
                <p class="ganlink">
                    <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">游戏专区</a>
				    <a href="<?php echo U('Down/down_file?game_id='.$vo['id'].'&type=1');?>">点击下载</a>            
				    <a href="<?php echo U('Game/gift_list?game_id='.$vo['id'].'');?>" target="_blank">
                        领取礼包
                    </a>
                </p>
            </div>
        </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    <div class="page">
        <?php echo ((isset($_page) && ($_page !== ""))?($_page):''); ?>
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