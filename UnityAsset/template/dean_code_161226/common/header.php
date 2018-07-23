<?php echo 'www.188yule.com,感谢大家的支持';exit;?>
<!--{subtemplate common/header_common}-->
	<meta name="application-name" content="$_G['setting']['bbname']" />
	<meta name="msapplication-tooltip" content="$_G['setting']['bbname']" />
	<!--{if $_G['setting']['portalstatus']}--><meta name="msapplication-task" content="name=$_G['setting']['navs'][1]['navname'];action-uri={echo !empty($_G['setting']['domain']['app']['portal']) ? 'http://'.$_G['setting']['domain']['app']['portal'] : $_G[siteurl].'portal.php'};icon-uri={$_G[siteurl]}{IMGDIR}/portal.ico" /><!--{/if}-->
	<meta name="msapplication-task" content="name=$_G['setting']['navs'][2]['navname'];action-uri={echo !empty($_G['setting']['domain']['app']['forum']) ? 'http://'.$_G['setting']['domain']['app']['forum'] : $_G[siteurl].'forum.php'};icon-uri={$_G[siteurl]}{IMGDIR}/bbs.ico" />
	<!--{if $_G['setting']['groupstatus']}--><meta name="msapplication-task" content="name=$_G['setting']['navs'][3]['navname'];action-uri={echo !empty($_G['setting']['domain']['app']['group']) ? 'http://'.$_G['setting']['domain']['app']['group'] : $_G[siteurl].'group.php'};icon-uri={$_G[siteurl]}{IMGDIR}/group.ico" /><!--{/if}-->
	<!--{if helper_access::check_module('feed')}--><meta name="msapplication-task" content="name=$_G['setting']['navs'][4]['navname'];action-uri={echo !empty($_G['setting']['domain']['app']['home']) ? 'http://'.$_G['setting']['domain']['app']['home'] : $_G[siteurl].'home.php'};icon-uri={$_G[siteurl]}{IMGDIR}/home.ico" /><!--{/if}-->
	<!--{if $_G['basescript'] == 'forum' && $_G['setting']['archiver']}-->
		<link rel="archives" title="$_G['setting']['bbname']" href="{$_G[siteurl]}archiver/" />
	<!--{/if}-->
	<!--{if !empty($rsshead)}-->$rsshead<!--{/if}-->
	<!--{if widthauto()}-->
		<link rel="stylesheet" id="css_widthauto" type="text/css" href="data/cache/style_{STYLEID}_widthauto.css?{VERHASH}" />
		<script type="text/javascript">HTMLNODE.className += ' widthauto'</script>
	<!--{/if}-->
	<!--{if $_G['basescript'] == 'forum' || $_G['basescript'] == 'group'}-->
		<script type="text/javascript" src="{$_G[setting][jspath]}forum.js?{VERHASH}"></script>
	<!--{elseif $_G['basescript'] == 'home' || $_G['basescript'] == 'userapp'}-->
		<script type="text/javascript" src="{$_G[setting][jspath]}home.js?{VERHASH}"></script>
	<!--{elseif $_G['basescript'] == 'portal'}-->
		<script type="text/javascript" src="{$_G[setting][jspath]}portal.js?{VERHASH}"></script>
	<!--{/if}-->
	<!--{if $_G['basescript'] != 'portal' && $_GET['diy'] == 'yes' && check_diy_perm($topic)}-->
		<script type="text/javascript" src="{$_G[setting][jspath]}portal.js?{VERHASH}"></script>
	<!--{/if}-->
	<!--{if $_GET['diy'] == 'yes' && check_diy_perm($topic)}-->
	<link rel="stylesheet" type="text/css" id="diy_common" href="data/cache/style_{STYLEID}_css_diy.css?{VERHASH}" />
	<!--{/if}-->
     <script type="text/javascript" src='$_G['style'][styleimgdir]/js/jquery-1.8.3.min.js'></script>
	 <script type="text/javascript">
        var jq=jQuery.noConflict();
     </script>
	 <link rel="stylesheet" type="text/css" href="$_G['style'][styleimgdir]/js/animate.min.css">
     <script type="text/javascript" src="$_G['style'][styleimgdir]/js/jquery.pagnation.js"></script>
	 <script type="text/javascript" src="$_G['style'][styleimgdir]/js/jquery.SuperSlide.2.1.1.js"></script>
     
    <script type="text/javascript" src="$_G['style'][styleimgdir]/js/jquery.flexslider-min.js"></script>
            <script type="text/javascript">
            jQuery(document).ready(function(){
                jQuery('.flexslider').flexslider({
                    directionNav: true,
                    pauseOnAction: false
                });
            });
            </script>
     <script language="javascript" type="text/javascript">
		function killErrors() {
			return true;
		}
		window.onerror = killErrors;
	</script>
</head>

<body id="nv_{$_G[basescript]}" class="pg_{CURMODULE}{if $_G['basescript'] === 'portal' && CURMODULE === 'list' && !empty($cat)} {$cat['bodycss']}{/if}" onkeydown="if(event.keyCode==27) return false;">
	<div id="append_parent"></div><div id="ajaxwaitid"></div>
	<!--{if $_GET['diy'] == 'yes' && check_diy_perm($topic)}-->
		<!--{template common/header_diy}-->
	<!--{/if}-->
	<!--{if check_diy_perm($topic)}-->
		<!--{template common/header_diynav}-->
	<!--{/if}-->
	<!--{if CURMODULE == 'topic' && $topic && empty($topic['useheader']) && check_diy_perm($topic)}-->
		$diynav
	<!--{/if}-->
	<!--{if empty($topic) || $topic['useheader']}-->
		<!--{if $_G['setting']['mobile']['allowmobile'] && (!$_G['setting']['cacheindexlife'] && !$_G['setting']['cachethreadon'] || $_G['uid']) && ($_GET['diy'] != 'yes' || !$_GET['inajax']) && ($_G['mobile'] != '' && $_G['cookie']['mobile'] == '' && $_GET['mobile'] != 'no')}-->
			<div class="xi1 bm bm_c">
			    {lang your_mobile_browser}<a href="{$_G['siteurl']}forum.php?mobile=yes">{lang go_to_mobile}</a> <span class="xg1">|</span> <a href="$_G['setting']['mobile']['nomobileurl']">{lang to_be_continue}</a>
			</div>
		<!--{/if}-->
		<!--{if $_G['setting']['shortcut'] && $_G['member'][credits] >= $_G['setting']['shortcut']}-->
			<div id="shortcut">
				<span><a href="javascript:;" id="shortcutcloseid" title="{lang close}">{lang close}</a></span>
				{lang shortcut_notice}
				<a href="javascript:;" id="shortcuttip">{lang shortcut_add}</a>

			</div>
			<script type="text/javascript">setTimeout(setShortcut, 2000);</script>
		<!--{/if}-->
		
		<!--{if !IS_ROBOT}-->
			<!--{if $_G['uid']}-->
			<ul id="myprompt_menu" class="p_pop" style="display: none;">
				<li><a href="home.php?mod=space&do=pm" id="pm_ntc" style="background-repeat: no-repeat; background-position: 0 50%;"><em class="prompt_news{if empty($_G[member][newpm])}_0{/if}"></em>{lang pm_center}</a></li>

					<li><a href="home.php?mod=follow&do=follower"><em class="prompt_follower{if empty($_G[member][newprompt_num][follower])}_0{/if}"></em><!--{lang notice_interactive_follower}-->{if $_G[member][newprompt_num][follower]}($_G[member][newprompt_num][follower]){/if}</a></li>

				<!--{if $_G[member][newprompt] && $_G[member][newprompt_num][follow]}-->
					<li><a href="home.php?mod=follow"><em class="prompt_concern"></em><!--{lang notice_interactive_follow}-->($_G[member][newprompt_num][follow])</a></li>
				<!--{/if}-->
				<!--{if $_G[member][newprompt]}-->
					<!--{loop $_G['member']['category_num'] $key $val}-->
						<li><a href="home.php?mod=space&do=notice&view=$key"><em class="notice_$key"></em><!--{echo lang('template', 'notice_'.$key)}-->(<span class="rq">$val</span>)</a></li>
					<!--{/loop}-->
				<!--{/if}-->
				<!--{if empty($_G['cookie']['ignore_notice'])}-->
				<li class="ignore_noticeli"><a href="javascript:;" onClick="setcookie('ignore_notice', 1);hideMenu('myprompt_menu')" title="{lang temporarily_to_remind}"><em class="ignore_notice"></em></a></li>
				<!--{/if}-->
				</ul>
			<!--{/if}-->
			<!--{if $_G['uid'] && !empty($_G['style']['extstyle'])}-->
				<div id="sslct_menu" class="cl p_pop" style="display: none;">
					<!--{if !$_G[style][defaultextstyle]}--><span class="sslct_btn" onClick="extstyle('')" title="{lang default}"><i></i></span><!--{/if}-->
					<!--{loop $_G['style']['extstyle'] $extstyle}-->
						<span class="sslct_btn" onClick="extstyle('$extstyle[0]')" title="$extstyle[1]"><i style='background:$extstyle[2]'></i></span>
					<!--{/loop}-->
				</div>
			<!--{/if}-->
            <!--{if $_G['uid']}-->
				<ul id="myitem_menu" class="p_pop" style="display: none;">
					<li><a href="forum.php?mod=guide&view=my">{lang mypost}</a></li>
					<li><a href="home.php?mod=space&do=favorite&view=me">{lang favorite}</a></li>
					<li><a href="home.php?mod=space&do=friend">{lang friends}</a></li>
					<!--{hook/global_myitem_extra}-->
				</ul>
			<!--{/if}-->
			<!--{subtemplate common/header_qmenu}-->
		<!--{/if}-->
		<!--{ad/headerbanner/wp a_h}-->
		<div id="hd">
            <div class="deanheaderbg">
            	<div class="w1180">
                	<div class="deanlogo"><h2><!--{if !isset($_G['setting']['navlogos'][$mnid])}--><a href="{if $_G['setting']['domain']['app']['default']}http://{$_G['setting']['domain']['app']['default']}/{else}./{/if}" title="$_G['setting']['bbname']">{$_G['style']['boardlogo']}</a><!--{else}-->$_G['setting']['navlogos'][$mnid]<!--{/if}--></h2></div>
                    <div class="deansearch">
                        <!--{subtemplate common/pubsearchform}-->
                    </div>
                    <div class="deantoptools">
                    	<!--快捷导航-->
                        <div class="deansubnav">
                            <a href="javascript:;" id="qmenu" onMouseOver="delayShow(this, function () {showMenu({'ctrlid':'qmenu','pos':'34!','ctrlclass':'a','duration':2});showForummenu($_G[fid]);})">
                                <span class="deanlines1"></span>
                                <span class="deanlines2"></span>
                                <span class="deanlines3"></span>
                                <p>快捷导航</p>
                            </a>
                        </div>
                    	<!--我的收藏-->
                        <div class="deantopmyfav">
                        	<a href="home.php?mod=space&do=favorite&view=me" target="_blank">
                            	<i></i>
                                <p>我的收藏</p>
                            </a>
                        </div>
                        <!--快速上传-->
                        <div class="deanfuploading">
                        	<a onClick="showWindow('nav', this.href, 'get', 0)" href="forum.php?mod=misc&amp;action=nav">
                            	<i></i>
                                <p>快速上传</p>
                            </a>
                        </div>
                        <!--开通会员-->
                        <div class="deanbecomemems">
                        	<a href="#" target="_blank">
                            	<i></i>
                                <p>开通会员</p>
                            </a>
                        </div>
                        <!--手机版-->
                        <div class="deantopapp">
                        	<div class="deanappdsd">
                            	<i></i>
                                <p>手机版</p>
                            </div>
                            <div class="deandropcon">
                                <div class="deandropcon_download">
                                    <div class="deanappbox">
                                        <img src="$_G['style'][styleimgdir]/dl/ewm.png" alt="二维码">
                                        <span>下载手机移动客户端</span>
                                    </div>
                                    <a class="deankokrebtn" href="#" target="_blank">进入产品中心</a>
                                </div>
                            </div>
                        </div>
                    	
                        <div class="clear"></div>
                    </div>
                	<div class="clear"></div>
                </div>
        	</div>
            <div>
            	<div class="w1180">
                	<!--{hook/global_cpnav_top}-->
                    <div class="z"><!--{hook/global_cpnav_extra1}--></div>
                    <div class="y"><!--{hook/global_cpnav_extra2}--></div>
                    <div class="clear"></div>
                </div>
            </div>
            <div id="deannavbox">
            	<div class="w1180">
                   <div class="deannav">
                       <!--{eval $mnid = getcurrentnav();}-->
                       <ul>
                        <!--{loop $_G['setting']['navs'] $nav}-->
                            <!--{if $nav['available'] && (!$nav['level'] || ($nav['level'] == 1 && $_G['uid']) || ($nav['level'] == 2 && $_G['adminid'] > 0) || ($nav['level'] == 3 && $_G['adminid'] == 1))}--><li {if $mnid == $nav[navid]}class="a" {/if}$nav[nav]></li><!--{/if}-->
                        <!--{/loop}-->
                       </ul>
                       <!--{hook/global_nav_extra}-->
                    	<script type="text/javascript" src="$_G['style'][styleimgdir]/js/nv.js"></script>
                    </div>
                    <div class="deandl">
                    	<!--{hook/global_cpnav_extra2}-->
                    	<!--{template common/header_userstatus}-->
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
             <!--侧边工具栏-->
            <div class="deansidetools">
            	<ul>
                	<li class="kefu_part_box" style="color: rgb(153, 153, 153);">
                        <a class="kefu_part">
                            <i class="icon_kefu"></i>
                            客服
                        </a>
                        <div class="kefu_part_open">
                        	<i class="deansideicon_qq"></i>
                        	<a href="http://wpa.qq.com/msgrd?v=3&uin=1691779149&site=qq&amp;menu=yes" title="在线咨询" class="deanonline">在线咨询</a>
                        	<p class="deansidetime">在线时间：9:00~18：00</p>
                        	<p class="deansidephone">固定电话：0592-3593333</p>
                        	<p class="deansidetel">客服热线：400-9907-315</p>
                        </div>
                    </li>
                    <li class="weixin_part_box" style="color: rgb(153, 153, 153);">
                        <a class="weixin_part">
                            <i class="icon_erweima"></i>
                            微信
                        </a>
                        <div class="weixin_part_open"></div>
                    </li>
                    <li class="app_part_box" style="color: rgb(217, 86, 54); border-bottom:0;">
                        <a class="app_part">
                            <i class="icon_app"></i>
                            APP
                        </a>
                        <div class="app_part_open">
                            <i class="app"></i>
                            <a href="#" class="d_iphone" target="_blank">iphone版</a>
                            <a href="#" class="d_android" target="_blank">安卓版</a>
                        </div>
                    </li>
                    <!--返回顶部-->
                    <div id="scrolltop">
                        <!--{if $_G[fid] && $_G['mod'] == 'viewthread'}-->
                        <!--{/if}-->
                        <span hidefocus="true"><a title="{lang scrolltop}" onClick="window.scrollTo('0','0')" class="scrolltopa" ><b>{lang scrolltop}</b></a></span>
                        <!--{if $_G[fid]}-->
                        <span>
                            <!--{if $_G['mod'] == 'viewthread'}-->
                            <a href="forum.php?mod=forumdisplay&fid=$_G[fid]" hidefocus="true" class="returnlist" title="{lang return_list}"><b>{lang return_list}</b></a>
                            <!--{else}-->
                            <a href="forum.php" hidefocus="true" class="returnboard" title="{lang return_forum}"><b>{lang return_forum}</b></a>
                            <!--{/if}-->
                        </span>
                        <!--{/if}-->
                    </div>
                    
                </ul>
            </div>
			<div class="wp">
				<div class="hdc cl">
					
					
					
				</div>

				
				<!--{if !empty($_G['setting']['plugins']['jsmenu'])}-->
					<ul class="p_pop h_pop" id="plugin_menu" style="display: none">
					<!--{loop $_G['setting']['plugins']['jsmenu'] $module}-->
						 <!--{if !$module['adminid'] || ($module['adminid'] && $_G['adminid'] > 0 && $module['adminid'] >= $_G['adminid'])}-->
						 <li>$module[url]</li>
						 <!--{/if}-->
					<!--{/loop}-->
					</ul>
				<!--{/if}-->
				$_G[setting][menunavs]
				<div id="mu" class="cl">
				<!--{if $_G['setting']['subnavs']}-->
					<!--{loop $_G[setting][subnavs] $navid $subnav}-->
						<!--{if $_G['setting']['navsubhover'] || $mnid == $navid}-->
						<ul class="cl {if $mnid == $navid}current{/if}" id="snav_$navid" style="display:{if $mnid != $navid}none{/if}">
						$subnav
						</ul>
						<!--{/if}-->
					<!--{/loop}-->
				<!--{/if}-->
				</div>
				<!--{ad/subnavbanner/a_mu}-->
				
			</div>
        </div>
		<!--{hook/global_header}-->
	<!--{/if}-->
	<div id="wp" class="wp">
		