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
    
<div class="main wrap_w">
    <div class="col_1 clearfix">
        <div class="l">
            <div class="slide" id="slide">
                <ul class="slide-cont">
				<?php if(is_array($slide_data)): foreach($slide_data as $key=>$vo): ?><li class="slide-item" > 
                    <a href="<?php echo ($vo["slideurl"]); ?>" target="_blank" title="<?php echo ($vo["slidetitle"]); ?>"> 
                        <img src="/project/vlcms<?php echo (get_cover($vo["cover"],'path')); ?>" alt="<?php echo ($vo["slidetitle"]); ?>">
                        <span class="slide-txt"> 
                            <span class="slide-tit"><?php echo ($vo["slidetitle"]); ?></span> 
                            <span class="slide-des"></span> 
                        </span> 
                        <span class="slide-mask"></span>
                    </a>
                </li><?php endforeach; endif; ?>  
				</ul>
                <div class="slide-nav">
                    <a href="javascript:" class="">1</a>
                    <a href="javascript:" class="nownav">2</a>
                    <a href="javascript:" class="">3</a>
                    <a href="javascript:" class="">4</a>
                    <div class="nav-mask"></div>
                </div>
                <a href="javascript:;" title="" id="next"></a> 
                <a href="javascript:;" title="" id="prev"></a> 
            </div>
        </div>

        <div class="headlines"> 
			<?php $__CATE__ = D('Category')->getChildrenId(43);$__LIST__ = D('Document')->lists_limit($__CATE__, '`level` DESC,`id` DESC', 1,true,2); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><h3>
                <a href="<?php echo U('Article/detail?id='.$list['id']);?>" title="<?php echo ($list["title"]); ?>" target="_blank"><?php echo ($list["title"]); ?></a>
            </h3>
            <p>
                <span><?php echo ($list["description"]); ?>
                <a href="<?php echo U('Article/detail?id='.$list['id']);?>">详情&gt;</a>
                </span>
            </p><?php endforeach; endif; else: echo "" ;endif; ?>
            <div class="hl3">
                <ul> 
					<?php $__CATE__ = D('Category')->getChildrenId(42);$__LIST__ = D('Document')->lists_limit($__CATE__, '`level` DESC,`id` DESC', 1,true,2); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li>
                        <em class='ev'>公告</em>
                        <a href="<?php echo U('Article/detail?id='.$list['id']);?>" target="_blank" title="<?php echo ($list["title"]); ?>"><?php echo ($list["title"]); ?></a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    <?php $__CATE__ = D('Category')->getChildrenId(44);$__LIST__ = D('Document')->lists_limit($__CATE__, '`level` DESC,`id` DESC', 1,true,2); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li>
                        <em class='ns'>活动</em>
                        <a href="<?php echo U('Article/detail?id='.$list['id']);?>" target="_blank" title="<?php echo ($list["title"]); ?>"><?php echo ($list["title"]); ?></a>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>
    </div>

    <!--推荐游戏-->
    <div class="col_2">
        <div class="title">
            <span>推荐游戏</span> <em><a href="<?php echo U('Game/game_list');?>">更多&gt;&gt;</a></em> 
        </div>
        <ul class="clearfix">
			<?php if(is_array($recommend)): $i = 0; $__LIST__ = $recommend;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li> 
                <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">
                    <img src="/project/vlcms<?php echo (get_cover($vo["cover"],'path')); ?>" class="gpic">
                </a>
                <p><?php echo ($vo["game_name"]); ?></p>
                <div class="img_hover"> 
                    <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>">
                        <div class="l">
                            <img src="<?php echo U('Game/dow_url_generate?game_id='.$vo['id']);?>">
                        </div>
                    </a>
                    <div class="r">
                        <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>">
                            <h3><?php echo msubstr(strip_tags($vo['game_name']),0,5,'utf-8',false);?></h3>
                            <div class="info"></div>
                            <div class="star <?php echo ($vo["recommend_level"]); ?>">推荐:</div>
                        </a>
                        <div class="dl">
                            <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>"></a>
                            <a style="color: #0ab837;" href="<?php echo U('Down/down_file?game_id='.$vo['id'].'&type=1');?>"> 立即下载 </a>
                        </div>
                    </div>  
                    <div class="clear"></div>
                    <div class="notice"></div>
                </div>
                <div class="bg" style="opacity: 0.85;"></div>
            </li><?php endforeach; endif; else: echo "" ;endif; ?>
        </ul>
    </div>

        <!--热门游戏-->
    <div class="col_3 clearfix">
        <div class="l">
            <div class="title"> <span>热门游戏</span> <em><a href="<?php echo U('Game/game_list');?>">更多&gt;&gt;</a></em> </div>
            <div class="mcs clearfix">

                <?php if(is_array($hot)): $i = 0; $__LIST__ = $hot;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><dl>
                    <dt>
                        <a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">
						  <img src="/project/vlcms<?php echo (get_cover($vo["icon"],'path')); ?>">
                        </a>
                    </dt>
                    <dd>
                        <h3><a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank"><?php echo ($vo["game_name"]); ?></a></h3>
                        <p class="gamestyle">
                            <span></span>
                            <span><?php echo get_game_type($vo['game_type']);?></span>
                        </p>
                        <div class="gamedown"><a href="<?php echo U('Down/down_file?game_id='.$vo['id'].'&type=1');?>" class="down">下载</a>
							<a href="<?php echo U('Game/gift_list?game_id='.$vo['id'].'');?>" class="gift">独家礼包</a> </div>
                    </dd>
                </dl><?php endforeach; endif; else: echo "" ;endif; ?>
                
                
            </div>
        </div>
        <div class="r">
            <div class="tabs">
                <ul class="tabNavigation clearfix">
                    <li class="big">礼包开服</li>
                    <li class="nor"><a href="#gift" class="on">游戏礼包</a></li>
                    <li class="nor"><a href="#kaifu">最新开服</a></li>
                </ul>
                <div class="tabcon" id="gift" style="display: block;">
                    <ul class="clearfix">
						<?php if(is_array($gift)): $i = 0; $__LIST__ = $gift;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><li class="">
                            <div class="game-package-now">
                                <span><a href="" class="get">领取</a></span>
							    <a onclick="XGUC.get_game_gift(707, &#39; $vo['giftbag_name'] &#39;)" class="name">
							         <?php echo ($vo["giftbag_name"]); ?>
                                </a>
                            </div>
                            <dl>
                                <dt>
                                    <a href="<?php echo U('Game/detail?id='.$vo['game_id'].'');?>" target="_blank">
                                        <img src="/project/vlcms<?php echo (get_cover($vo["icon"],'path')); ?>">
                                    </a>
                                </dt>
                                <dd>
                                    <h3><a href="<?php echo U('Game/gift_list?game_id='.$vo['game_id'].'');?>" target="_blank"><?php echo ($vo['giftbag_name']); ?></a></h3>
                                    <p><?php echo get_gift_type($vo['giftbag_type']);?></p>
                                    <a class="package-btn" onclick="XGUC.get_game_gift(<?php echo ($vo['gift_id']); ?>, &#39;<?php echo ($vo['giftbag_name']); ?>&#39;)">领取</a> 
                                </dd>
                            </dl>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>
                    </ul>
                </div>
                <div class="tabcon" id="kaifu" style="display: none;">
                    <ul>
					<?php if(is_array($area)): $i = 0; $__LIST__ = $area;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$at): $mod = ($i % 2 );++$i;?><li>
                            <dl>
                                <dt><a href="<?php echo U('Game/game_detail?id='.$at['game_id'].'');?>" target="_blank">
								<img src="/project/vlcms<?php echo (get_cover($at["icon"],'path')); ?>"></a></dt>
                                <dd>
                                    <h3><a href="<?php echo U('Game/game_detail?id='.$at['game_id'].'');?>" target="_blank"><?php echo ($at["game_name"]); ?></a></h3>
                                    <p>
                                        <?php echo ($at["area_name"]); ?><br>
                                        开服时间：<?php echo (date("m.d H:i",$at['start_time'])); ?>
									</p>
                                </dd>
                            </dl>
                        </li><?php endforeach; endif; else: echo "" ;endif; ?>                           
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--活动-->

    <div class="col_4 clearfix">
        <div class="l">
            <div class="title"> 
                <span>游戏活动</span> 
                <em><a href="<?php echo U('Article/lists/category/media_activity');?>" target="_blank">更多&gt;&gt;</a></em> 
            </div>
            <div class="lcons">
                <ul class="clearfix">
				<?php $__CATE__ = D('Category')->getChildrenId(44);$__LIST__ = D('Document')->lists_limit($__CATE__, '`level` DESC,`id` DESC', 1,true,3); if(is_array($__LIST__)): $i = 0; $__LIST__ = $__LIST__;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$list): $mod = ($i % 2 );++$i;?><li> <a href="<?php echo U('Article/detail?id='.$list['id']);?>" target="_blank">
					<img src="/project/vlcms<?php echo (get_cover($list["cover_id"],'path')); ?>" class="gpic"></a>
                        <p><a href="<?php echo U('Article/detail?id='.$list['id']);?>" target="_blank"><?php echo ($list["title"]); ?></a></p>
                        <div class="cover"></div>
                    </li><?php endforeach; endif; else: echo "" ;endif; ?>
                </ul>
            </div>
        </div>

        <div class="r">
            <div class="title"> <span>游戏客服</span></div>                    
            <div class="cons">
                <div class="mc">                    
                    <span><?php echo C('MT_SITE_TEL');?></span>
                    <p>工作时间：<?php echo C('MT_SITE_TIME');;?></p>
                   
                </div>

                <div class="ot">
                    客服QQ：<?php echo C('MT_SITE_QQ');?><br> 
                    客服邮箱:<?php echo C('MT_SITE_EMAIL');?><br>
                    投诉邮箱:<?php echo C('MT_SITE_TEMAIL');?><br></div>
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