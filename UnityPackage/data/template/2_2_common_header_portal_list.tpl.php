<?php if(!defined('IN_DISCUZ')) exit('Access Denied'); 
0
|| checktplrefresh('./template/dean_source_170511/common/header.htm', './template/default/common/header_common.htm', 1501343778, '2', './data/template/2_2_common_header_portal_list.tpl.php', './template/dean_source_170511', 'common/header_portal_list')
|| checktplrefresh('./template/dean_source_170511/common/header.htm', './template/default/common/header_qmenu.htm', 1501343778, '2', './data/template/2_2_common_header_portal_list.tpl.php', './template/dean_source_170511', 'common/header_portal_list')
|| checktplrefresh('./template/dean_source_170511/common/header.htm', './template/dean_source_170511/common/pubsearchform.htm', 1501343778, '2', './data/template/2_2_common_header_portal_list.tpl.php', './template/dean_source_170511', 'common/header_portal_list')
;
block_get('166');?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET;?>" />
<?php if($_G['config']['output']['iecompatible']) { ?><meta http-equiv="X-UA-Compatible" content="IE=EmulateIE<?php echo $_G['config']['output']['iecompatible'];?>" /><?php } ?>
<title><?php if(!empty($navtitle)) { ?><?php echo $navtitle;?> - <?php } if(empty($nobbname)) { ?> <?php echo $_G['setting']['bbname'];?> - <?php } ?> Powered by Discuz!</title>
<?php echo $_G['setting']['seohead'];?>

<meta name="keywords" content="<?php if(!empty($metakeywords)) { echo dhtmlspecialchars($metakeywords); } ?>" />
<meta name="description" content="<?php if(!empty($metadescription)) { echo dhtmlspecialchars($metadescription); ?> <?php } if(empty($nobbname)) { ?>,<?php echo $_G['setting']['bbname'];?><?php } ?>" />
<meta name="generator" content="Discuz! <?php echo $_G['setting']['version'];?>" />
<meta name="author" content="Discuz! Team and Comsenz UI Team" />
<meta name="copyright" content="2001-2017 Comsenz Inc." />
<meta name="MSSmartTagsPreventParsing" content="True" />
<meta http-equiv="MSThemeCompatible" content="Yes" />
<base href="<?php echo $_G['siteurl'];?>" /><link rel="stylesheet" type="text/css" href="data/cache/style_2_common.css?<?php echo VERHASH;?>" /><link rel="stylesheet" type="text/css" href="data/cache/style_2_portal_list.css?<?php echo VERHASH;?>" /><?php if($_G['uid'] && isset($_G['cookie']['extstyle']) && strpos($_G['cookie']['extstyle'], TPLDIR) !== false) { ?><link rel="stylesheet" id="css_extstyle" type="text/css" href="<?php echo $_G['cookie']['extstyle'];?>/style.css" /><?php } elseif($_G['style']['defaultextstyle']) { ?><link rel="stylesheet" id="css_extstyle" type="text/css" href="<?php echo $_G['style']['defaultextstyle'];?>/style.css" /><?php } ?><script type="text/javascript">var STYLEID = '<?php echo STYLEID;?>', STATICURL = '<?php echo STATICURL;?>', IMGDIR = '<?php echo IMGDIR;?>', VERHASH = '<?php echo VERHASH;?>', charset = '<?php echo CHARSET;?>', discuz_uid = '<?php echo $_G['uid'];?>', cookiepre = '<?php echo $_G['config']['cookie']['cookiepre'];?>', cookiedomain = '<?php echo $_G['config']['cookie']['cookiedomain'];?>', cookiepath = '<?php echo $_G['config']['cookie']['cookiepath'];?>', showusercard = '<?php echo $_G['setting']['showusercard'];?>', attackevasive = '<?php echo $_G['config']['security']['attackevasive'];?>', disallowfloat = '<?php echo $_G['setting']['disallowfloat'];?>', creditnotice = '<?php if($_G['setting']['creditnotice']) { ?><?php echo $_G['setting']['creditnames'];?><?php } ?>', defaultstyle = '<?php echo $_G['style']['defaultextstyle'];?>', REPORTURL = '<?php echo $_G['currenturl_encode'];?>', SITEURL = '<?php echo $_G['siteurl'];?>', JSPATH = '<?php echo $_G['setting']['jspath'];?>', CSSPATH = '<?php echo $_G['setting']['csspath'];?>', DYNAMICURL = '<?php echo $_G['dynamicurl'];?>';</script>
<script src="<?php echo $_G['setting']['jspath'];?>common.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php if(empty($_GET['diy'])) { $_GET['diy'] = '';?><?php } if(!isset($topic)) { $topic = array();?><?php } ?>
<meta name="application-name" content="<?php echo $_G['setting']['bbname'];?>" />
<meta name="msapplication-tooltip" content="<?php echo $_G['setting']['bbname'];?>" />
<?php if($_G['setting']['portalstatus']) { ?><meta name="msapplication-task" content="name=<?php echo $_G['setting']['navs']['1']['navname'];?>;action-uri=<?php echo !empty($_G['setting']['domain']['app']['portal']) ? 'http://'.$_G['setting']['domain']['app']['portal'] : $_G['siteurl'].'portal.php'; ?>;icon-uri=<?php echo $_G['siteurl'];?><?php echo IMGDIR;?>/portal.ico" /><?php } ?>
<meta name="msapplication-task" content="name=<?php echo $_G['setting']['navs']['2']['navname'];?>;action-uri=<?php echo !empty($_G['setting']['domain']['app']['forum']) ? 'http://'.$_G['setting']['domain']['app']['forum'] : $_G['siteurl'].'forum.php'; ?>;icon-uri=<?php echo $_G['siteurl'];?><?php echo IMGDIR;?>/bbs.ico" />
<?php if($_G['setting']['groupstatus']) { ?><meta name="msapplication-task" content="name=<?php echo $_G['setting']['navs']['3']['navname'];?>;action-uri=<?php echo !empty($_G['setting']['domain']['app']['group']) ? 'http://'.$_G['setting']['domain']['app']['group'] : $_G['siteurl'].'group.php'; ?>;icon-uri=<?php echo $_G['siteurl'];?><?php echo IMGDIR;?>/group.ico" /><?php } if(helper_access::check_module('feed')) { ?><meta name="msapplication-task" content="name=<?php echo $_G['setting']['navs']['4']['navname'];?>;action-uri=<?php echo !empty($_G['setting']['domain']['app']['home']) ? 'http://'.$_G['setting']['domain']['app']['home'] : $_G['siteurl'].'home.php'; ?>;icon-uri=<?php echo $_G['siteurl'];?><?php echo IMGDIR;?>/home.ico" /><?php } if($_G['basescript'] == 'forum' && $_G['setting']['archiver']) { ?>
<link rel="archives" title="<?php echo $_G['setting']['bbname'];?>" href="<?php echo $_G['siteurl'];?>archiver/" />
<?php } if(!empty($rsshead)) { ?><?php echo $rsshead;?><?php } if(widthauto()) { ?>
<link rel="stylesheet" id="css_widthauto" type="text/css" href="data/cache/style_<?php echo STYLEID;?>_widthauto.css?<?php echo VERHASH;?>" />
<script type="text/javascript">HTMLNODE.className += ' widthauto'</script>
<?php } if($_G['basescript'] == 'forum' || $_G['basescript'] == 'group') { ?>
<script src="<?php echo $_G['setting']['jspath'];?>forum.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } elseif($_G['basescript'] == 'home' || $_G['basescript'] == 'userapp') { ?>
<script src="<?php echo $_G['setting']['jspath'];?>home.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } elseif($_G['basescript'] == 'portal') { ?>
<script src="<?php echo $_G['setting']['jspath'];?>portal.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } if($_G['basescript'] != 'portal' && $_GET['diy'] == 'yes' && check_diy_perm($topic)) { ?>
<script src="<?php echo $_G['setting']['jspath'];?>portal.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<?php } if($_GET['diy'] == 'yes' && check_diy_perm($topic)) { ?>
<link rel="stylesheet" type="text/css" id="diy_common" href="data/cache/style_<?php echo STYLEID;?>_css_diy.css?<?php echo VERHASH;?>" />
<?php } ?>
     <script type="text/javascript" src='<?php echo $_G['style']['styleimgdir'];?>/js/jquery-1.8.3.min.js'></script>
 <script type="text/javascript">
        var jq=jQuery.noConflict();
     </script>
 <link rel="stylesheet" type="text/css" href="<?php echo $_G['style']['styleimgdir'];?>/js/animate.min.css">
     <script src="<?php echo $_G['style']['styleimgdir'];?>/js/jquery.pagnation.js" type="text/javascript"></script>
 <script src="<?php echo $_G['style']['styleimgdir'];?>/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
     <script src="<?php echo $_G['style']['styleimgdir'];?>/js/jquery.flexslider-min.js" type="text/javascript"></script>
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

<body id="nv_<?php echo $_G['basescript'];?>" class="pg_<?php echo CURMODULE;?><?php if($_G['basescript'] === 'portal' && CURMODULE === 'list' && !empty($cat)) { ?> <?php echo $cat['bodycss'];?><?php } ?>" onkeydown="if(event.keyCode==27) return false;">
<div id="append_parent"></div><div id="ajaxwaitid"></div>
<?php if($_GET['diy'] == 'yes' && check_diy_perm($topic)) { include template('common/header_diy'); } if(check_diy_perm($topic)) { include template('common/header_diynav'); } if(CURMODULE == 'topic' && $topic && empty($topic['useheader']) && check_diy_perm($topic)) { ?>
<?php echo $diynav;?>
<?php } if(empty($topic) || $topic['useheader']) { if($_G['setting']['mobile']['allowmobile'] && (!$_G['setting']['cacheindexlife'] && !$_G['setting']['cachethreadon'] || $_G['uid']) && ($_GET['diy'] != 'yes' || !$_GET['inajax']) && ($_G['mobile'] != '' && $_G['cookie']['mobile'] == '' && $_GET['mobile'] != 'no')) { ?>
<div class="xi1 bm bm_c">
    ��ѡ�� <a href="<?php echo $_G['siteurl'];?>forum.php?mobile=yes">�����ֻ���</a> <span class="xg1">|</span> <a href="<?php echo $_G['setting']['mobile']['nomobileurl'];?>">�������ʵ��԰�</a>
</div>
<?php } if($_G['setting']['shortcut'] && $_G['member']['credits'] >= $_G['setting']['shortcut']) { ?>
<div id="shortcut">
<span><a href="javascript:;" id="shortcutcloseid" title="�ر�">�ر�</a></span>
���������� <?php echo $_G['setting']['bbname'];?>��������ӵ����棬���ʸ����㣡
<a href="javascript:;" id="shortcuttip">��� <?php echo $_G['setting']['bbname'];?> ������</a>

</div>
<script type="text/javascript">setTimeout(setShortcut, 2000);</script>
<?php } ?>
        <div class="deanftbgh"></div>
<div id="toptb" class="cl" style="display:none;">
<?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_top'])) echo $_G['setting']['pluginhooks']['global_cpnav_top'];?>
<div class="wp">
<div class="z"><?php if(is_array($_G['setting']['topnavs']['0'])) foreach($_G['setting']['topnavs']['0'] as $nav) { if($nav['available'] && (!$nav['level'] || ($nav['level'] == 1 && $_G['uid']) || ($nav['level'] == 2 && $_G['adminid'] > 0) || ($nav['level'] == 3 && $_G['adminid'] == 1))) { ?><?php echo $nav['code'];?><?php } } ?>
<?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_extra1'])) echo $_G['setting']['pluginhooks']['global_cpnav_extra1'];?>
</div>
<div class="y">
<?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_extra2'])) echo $_G['setting']['pluginhooks']['global_cpnav_extra2'];?>
</div>
                <div class="clear"></div>
</div>
</div>
<?php if(!IS_ROBOT) { if($_G['uid']) { ?>
<ul id="myprompt_menu" class="p_pop" style="display: none;">
<li><a href="home.php?mod=space&amp;do=pm" id="pm_ntc" style="background-repeat: no-repeat; background-position: 0 50%;"><em class="prompt_news<?php if(empty($_G['member']['newpm'])) { ?>_0<?php } ?>"></em>��Ϣ</a></li>

<li><a href="home.php?mod=follow&amp;do=follower"><em class="prompt_follower<?php if(empty($_G['member']['newprompt_num']['follower'])) { ?>_0<?php } ?>"></em>������<?php if($_G['member']['newprompt_num']['follower']) { ?>(<?php echo $_G['member']['newprompt_num']['follower'];?>)<?php } ?></a></li>

<?php if($_G['member']['newprompt'] && $_G['member']['newprompt_num']['follow']) { ?>
<li><a href="home.php?mod=follow"><em class="prompt_concern"></em>�ҹ�ע��(<?php echo $_G['member']['newprompt_num']['follow'];?>)</a></li>
<?php } if($_G['member']['newprompt']) { if(is_array($_G['member']['category_num'])) foreach($_G['member']['category_num'] as $key => $val) { ?><li><a href="home.php?mod=space&amp;do=notice&amp;view=<?php echo $key;?>"><em class="notice_<?php echo $key;?>"></em><?php echo lang('template', 'notice_'.$key); ?>(<span class="rq"><?php echo $val;?></span>)</a></li>
<?php } } if(empty($_G['cookie']['ignore_notice'])) { ?>
<li class="ignore_noticeli"><a href="javascript:;" onClick="setcookie('ignore_notice', 1);hideMenu('myprompt_menu')" title="�ݲ�����"><em class="ignore_notice"></em></a></li>
<?php } ?>
</ul>
<?php } if($_G['uid'] && !empty($_G['style']['extstyle'])) { ?>
<div id="sslct_menu" class="cl p_pop" style="display: none;">
<?php if(!$_G['style']['defaultextstyle']) { ?><span class="sslct_btn" onClick="extstyle('')" title="Ĭ��"><i></i></span><?php } if(is_array($_G['style']['extstyle'])) foreach($_G['style']['extstyle'] as $extstyle) { ?><span class="sslct_btn" onClick="extstyle('<?php echo $extstyle['0'];?>')" title="<?php echo $extstyle['1'];?>"><i style='background:<?php echo $extstyle['2'];?>'></i></span>
<?php } ?>
</div>
<?php } ?>
            <?php if($_G['uid']) { ?>
<ul id="myitem_menu" class="p_pop" style="display: none;">
<li><a href="forum.php?mod=guide&amp;view=my">����</a></li>
<li><a href="home.php?mod=space&amp;do=favorite&amp;view=me">�ղ�</a></li>
<li><a href="home.php?mod=space&amp;do=friend">����</a></li>
<?php if(!empty($_G['setting']['pluginhooks']['global_myitem_extra'])) echo $_G['setting']['pluginhooks']['global_myitem_extra'];?>
</ul>
<?php } ?><div id="qmenu_menu" class="p_pop <?php if(!$_G['uid']) { ?>blk<?php } ?>" style="display: none;">
<?php if(!empty($_G['setting']['pluginhooks']['global_qmenu_top'])) echo $_G['setting']['pluginhooks']['global_qmenu_top'];?>
<?php if($_G['uid']) { ?>
<ul class="cl nav"><?php if(is_array($_G['setting']['mynavs'])) foreach($_G['setting']['mynavs'] as $nav) { if($nav['available'] && (!$nav['level'] || ($nav['level'] == 1 && $_G['uid']) || ($nav['level'] == 2 && $_G['adminid'] > 0) || ($nav['level'] == 3 && $_G['adminid'] == 1))) { ?>
<li><?php echo $nav['code'];?></li>
<?php } } ?>
</ul>
<?php } elseif($_G['connectguest']) { ?>
<div class="ptm pbw hm">
����<br /><a class="xi2" href="member.php?mod=connect"><strong>�����ʺ���Ϣ</strong></a> �� <a href="member.php?mod=connect&amp;ac=bind" class="xi2 xw1"><strong>�������ʺ�</strong></a><br />��ʹ�ÿ�ݵ���
</div>
<?php } else { ?>
<div class="ptm pbw hm">
�� <a href="javascript:;" class="xi2" onclick="lsSubmit()"><strong>��¼</strong></a> ��ʹ�ÿ�ݵ���<br />û���ʺţ�<a href="member.php?mod=<?php echo $_G['setting']['regname'];?>" class="xi2 xw1"><?php echo $_G['setting']['reglinkname'];?></a>
</div>
<?php } if($_G['setting']['showfjump']) { ?><div id="fjump_menu" class="btda"></div><?php } ?>
<?php if(!empty($_G['setting']['pluginhooks']['global_qmenu_bottom'])) echo $_G['setting']['pluginhooks']['global_qmenu_bottom'];?>
</div><?php } ?><?php echo adshow("headerbanner/wp a_h");?><div id="hd">
        	<div style="width:1180px!important; margin:0 auto!important;">
            	<div class="w1180">
                	<?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_top'])) echo $_G['setting']['pluginhooks']['global_cpnav_top'];?>
                    <div class="z"><?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_extra1'])) echo $_G['setting']['pluginhooks']['global_cpnav_extra1'];?></div>
                    <div class="y"><?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_extra2'])) echo $_G['setting']['pluginhooks']['global_cpnav_extra2'];?></div>
                    <div class="clear"></div>
                </div>
            </div>
            <div class="deanheaderbg">
            	<div class="w1180">
                	<div class="deanlogo"><h2><?php if(!isset($_G['setting']['navlogos'][$mnid])) { ?><a href="<?php if($_G['setting']['domain']['app']['default']) { ?>http://<?php echo $_G['setting']['domain']['app']['default'];?>/<?php } else { ?>./<?php } ?>" title="<?php echo $_G['setting']['bbname'];?>"><?php echo $_G['style']['boardlogo'];?></a><?php } else { ?><?php echo $_G['setting']['navlogos'][$mnid];?><?php } ?></h2></div>
                    <div class="deansearch">
                        <?php if($_G['setting']['search']) { $slist = array();?><?php if($_G['fid'] && $_G['forum']['status'] != 3 && $mod != 'group') { ?><?php
$slist[forumfid] = <<<EOF
<li><a href="javascript:;" rel="curforum" fid="{$_G['fid']}" >����</a></li>
EOF;
?><?php } if($_G['setting']['portalstatus'] && $_G['setting']['search']['portal']['status'] && ($_G['group']['allowsearch'] & 1 || $_G['adminid'] == 1)) { ?><?php
$slist[portal] = <<<EOF
<li><a href="javascript:;" rel="article">����</a></li>
EOF;
?><?php } if($_G['setting']['search']['forum']['status'] && ($_G['group']['allowsearch'] & 2 || $_G['adminid'] == 1)) { ?><?php
$slist[forum] = <<<EOF
<li><a href="javascript:;" rel="forum" class="curtype">����</a></li>
EOF;
?><?php } if(helper_access::check_module('blog') && $_G['setting']['search']['blog']['status'] && ($_G['group']['allowsearch'] & 4 || $_G['adminid'] == 1)) { ?><?php
$slist[blog] = <<<EOF
<li><a href="javascript:;" rel="blog">��־</a></li>
EOF;
?><?php } if(helper_access::check_module('album') && $_G['setting']['search']['album']['status'] && ($_G['group']['allowsearch'] & 8 || $_G['adminid'] == 1)) { ?><?php
$slist[album] = <<<EOF
<li><a href="javascript:;" rel="album">���</a></li>
EOF;
?><?php } if($_G['setting']['groupstatus'] && $_G['setting']['search']['group']['status'] && ($_G['group']['allowsearch'] & 16 || $_G['adminid'] == 1)) { ?><?php
$slist[group] = <<<EOF
<li><a href="javascript:;" rel="group">{$_G['setting']['navs']['3']['navname']}</a></li>
EOF;
?><?php } ?><?php
$slist[user] = <<<EOF
<li><a href="javascript:;" rel="user">�û�</a></li>
EOF;
?>
<?php } if($_G['setting']['search'] && $slist) { ?>
<div id="scbar" class="<?php if($_G['setting']['srchhotkeywords'] && count($_G['setting']['srchhotkeywords']) > 5) { ?>scbar_narrow <?php } ?>cl">
<form id="scbar_form" method="<?php if($_G['fid'] && !empty($searchparams['url'])) { ?>get<?php } else { ?>post<?php } ?>" autocomplete="off" onsubmit="searchFocus($('scbar_txt'))" action="<?php if($_G['fid'] && !empty($searchparams['url'])) { ?><?php echo $searchparams['url'];?><?php } else { ?>search.php?searchsubmit=yes<?php } ?>" target="_blank">
<input type="hidden" name="mod" id="scbar_mod" value="search" />
<input type="hidden" name="formhash" value="<?php echo FORMHASH;?>" />
<input type="hidden" name="srchtype" value="title" />
<input type="hidden" name="srhfid" value="<?php echo $_G['fid'];?>" />
<input type="hidden" name="srhlocality" value="<?php echo $_G['basescript'];?>::<?php echo CURMODULE;?>" />
<?php if(!empty($searchparams['params'])) { if(is_array($searchparams['params'])) foreach($searchparams['params'] as $key => $value) { $srchotquery .= '&' . $key . '=' . rawurlencode($value);?><input type="hidden" name="<?php echo $key;?>" value="<?php echo $value;?>" />
<?php } ?>
<input type="hidden" name="source" value="designshow" />
<input type="hidden" name="fId" id="srchFId" value="<?php echo $_G['fid'];?>" />
<input type="hidden" name="q" id="cloudsearchquery" value="" />

<style>
#scbar { overflow: visible; position: relative; }
#sg{ background: #FFF; width:456px; border: 1px solid #B2C7DA; }
.scbar_narrow #sg { width: 316px; }
#sg li { padding:0 8px; line-height:30px; font-size:14px; }
#sg li span { color:#999; }
.sml { background:#FFF; cursor:default; }
.smo { background:#E5EDF2; cursor:default; }
            </style>
            <div style="display: none; position: absolute; top:37px; left:44px;" id="sg">
                <div id="st_box" cellpadding="2" cellspacing="0"></div>
            </div>
<?php } ?>
<div class="dean_scbar">
            	<div class="dean_scbar_type_td"><a href="javascript:;" id="scbar_type" class="xg1" onclick="showMenu(this.id)" hidefocus="true">����</a></div>
<div class="dean_scbartxt"><input type="text" name="srchtxt" id="scbar_txt" value="��������������" autocomplete="off" x-webkit-speech speech /></div>
<div class="dean_scbar_btn"><button type="submit" name="searchsubmit" id="scbar_btn" sc="1" class="pn pnc" value="true">��&nbsp;��</button></div>
                <div class="clear"></div>
        </div>        
</form>
</div>

<ul id="scbar_type_menu" class="p_pop" style="display: none;"><?php echo implode('', $slist);; ?></ul>
<script type="text/javascript">
initSearchmenu('scbar', '<?php echo $searchparams['url'];?>');
</script>
<?php } ?>                    </div>
                    <div class="deantoptools">
                    	<div class="deanttops" title="������">
                        	<span class="deanlinetop"></span>
                            <span class="deanlinemiddle"></span>
                            <span class="deanlinebottoms"></span>
                        </div>
                        <div class="deantthiddens">
                        	<ul>
                            	<em></em>
                            	<li class="deanfwcells">
                                	<a href="#" target="_blank">
                                    	<i></i>
                                        <p>�����ֻ���</p>
                                    </a>
                                </li>
                                <li class="deanktmembs">
                                	<a href="#" target="_blank">
                                    	<i></i>
                                        <p>��ͨ��Ա</p>
                                    </a>
                                </li>
                                <li class="deanuploadzp">
                                	<a onClick="showWindow('nav', this.href, 'get', 0)" href="forum.php?mod=misc&amp;action=nav">
                                    	<i></i>
                                        <p>�ϴ���Ʒ</p>
                                    </a>
                                </li>
                                <li class="deanmyfavsd">
                                	<a href="home.php?mod=space&amp;do=favorite&amp;view=me" target="_blank">
                                    	<i></i>
                                        <p>�ҵ��ղ�</p>
                                    </a>
                                </li>
                                <div class="clear"></div>
                            </ul>
                        </div>
                        <script type="text/javascript">
  jQuery(".deanttops").on("click", function(e){
jQuery('.deanttops').addClass('on');
jQuery(".deantthiddens").show();

jQuery(document).one("click", function(){
jQuery('.deanttops').removeClass('on');
jQuery(".deantthiddens").hide();
});

e.stopPropagation();
});
jQuery(".deantthiddens").on("click", function(e){
e.stopPropagation();
});
</script>
                    </div>
                    <div class="deandl">
                    	<?php if(!empty($_G['setting']['pluginhooks']['global_cpnav_extra2'])) echo $_G['setting']['pluginhooks']['global_cpnav_extra2'];?>
                    <?php include template('common/header_userstatus'); ?>                    </div>
                	<div class="clear"></div>
                </div>
        	</div>
            
            <div id="deannavbox">
            	<div class="w1180">
                	<div class="deantypes">
                    	<div class="deantypetraggler">�زķ���</div>
                        <div class="deansidebar">
                        <!--�����˵��ӿڿ�ʼ-->
                        <?php block_display('166');?>                        
                        <!--�����˵��ӿڽ���-->
                        </div>
                    </div>
                   <div class="deannav">
                       <?php $mnid = getcurrentnav();?>                       <ul>
                        <?php if(is_array($_G['setting']['navs'])) foreach($_G['setting']['navs'] as $nav) { ?>                            <?php if($nav['available'] && (!$nav['level'] || ($nav['level'] == 1 && $_G['uid']) || ($nav['level'] == 2 && $_G['adminid'] > 0) || ($nav['level'] == 3 && $_G['adminid'] == 1))) { ?><li <?php if($mnid == $nav['navid']) { ?>class="a" <?php } ?><?php echo $nav['nav'];?>></li><?php } ?>
                        <?php } ?>
                       </ul>
                       <?php if(!empty($_G['setting']['pluginhooks']['global_nav_extra'])) echo $_G['setting']['pluginhooks']['global_nav_extra'];?>
                        <script type="text/javascript">
jQuery(function() { 
var elm = jQuery('#deannavbox'); 
var startPos = jQuery(elm).offset().top; 
jQuery.event.add(window, "scroll", function() { 
var p = jQuery(window).scrollTop(); 
jQuery(elm).css('position',((p) > startPos) ? 'fixed' : 'relative'); 
jQuery(elm).css('top',((p) > startPos) ? '0px' : ''); 
jQuery(elm).css('opacity',((p) > startPos) ? '0.9' : '');
jQuery(elm).css('z-index',((p) > startPos) ? '180' : '');
jQuery(elm).addClass('deanonce');
}); 
}); 
</script>
                    </div>
                    <div class="deanqmenu">
                    	<a href="javascript:;" id="qmenu" onMouseOver="delayShow(this, function () {showMenu({'ctrlid':'qmenu','pos':'34!','ctrlclass':'a','duration':2});showForummenu(<?php echo $_G['fid'];?>);})"></a>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>
             <!--��߹�����-->
            <div class="deansidetools">
            	<ul>
                	<li class="kefu_part_box">
                        <a class="kefu_part">
                            <i class="icon_kefu"></i>
                            �ͷ�
                        </a>
                        <div class="kefu_part_open">
                        	<i class="deansideicon_qq"></i>
                        	<a href="http://wpa.qq.com/msgrd?v=3&amp;uin=125422921&amp;site=qq&amp;menu=yes" title="������ѯ" class="deanonline">������ѯ</a>
                        	<p class="deansidetime">����ʱ�䣺9:00~18��00</p>
                        	<p class="deansidephone">�̶��绰��0592-3593333</p>
                        	<p class="deansidetel">�ͷ����ߣ�400-9907-315</p>
                        </div>
                    </li>
                    <li class="weixin_part_box">
                        <a class="weixin_part">
                            <i class="icon_erweima"></i>
                            ΢��
                        </a>
                        <div class="weixin_part_open"></div>
                    </li>
                    <li class="app_part_box">
                        <a class="app_part" onClick="showWindow('nav', this.href, 'get', 0)" href="forum.php?mod=misc&amp;action=nav">
                            <i class="icon_app"></i>
                            ����
                        </a>
                    </li>
                    <!--���ض���-->
                    <div id="scrolltop">
                        <?php if($_G['fid'] && $_G['mod'] == 'viewthread') { ?>
                        <?php } ?>
                        <span hidefocus="true"><a title="���ض���" onClick="window.scrollTo('0','0')" class="scrolltopa" ><b>���ض���</b></a></span>
                        <?php if($_G['fid']) { ?>
                        <span>
                            <?php if($_G['mod'] == 'viewthread') { ?>
                            <a href="forum.php?mod=forumdisplay&amp;fid=<?php echo $_G['fid'];?>" hidefocus="true" class="returnlist" title="�����б�"><b>�����б�</b></a>
                            <?php } else { ?>
                            <a href="forum.php" hidefocus="true" class="returnboard" title="���ذ��"><b>���ذ��</b></a>
                            <?php } ?>
                        </span>
                        <?php } ?>
                    </div>
                    
                </ul>
            </div>
<div class="wp">
<div class="hdc cl">



</div>


<?php if(!empty($_G['setting']['plugins']['jsmenu'])) { ?>
<ul class="p_pop h_pop" id="plugin_menu" style="display: none"><?php if(is_array($_G['setting']['plugins']['jsmenu'])) foreach($_G['setting']['plugins']['jsmenu'] as $module) { ?> <?php if(!$module['adminid'] || ($module['adminid'] && $_G['adminid'] > 0 && $module['adminid'] >= $_G['adminid'])) { ?>
 <li><?php echo $module['url'];?></li>
 <?php } } ?>
</ul>
<?php } ?>
<?php echo $_G['setting']['menunavs'];?>
<div id="mu" class="cl">
<?php if($_G['setting']['subnavs']) { if(is_array($_G['setting']['subnavs'])) foreach($_G['setting']['subnavs'] as $navid => $subnav) { if($_G['setting']['navsubhover'] || $mnid == $navid) { ?>
<ul class="cl <?php if($mnid == $navid) { ?>current<?php } ?>" id="snav_<?php echo $navid;?>" style="display:<?php if($mnid != $navid) { ?>none<?php } ?>">
<?php echo $subnav;?>
</ul>
<?php } } } ?>
</div><?php echo adshow("subnavbanner/a_mu");?></div>
        </div>
<?php if(!empty($_G['setting']['pluginhooks']['global_header'])) echo $_G['setting']['pluginhooks']['global_header'];?>
<?php } ?>
<div id="wp" class="wp">
