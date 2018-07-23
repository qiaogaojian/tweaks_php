<?php if(!defined('IN_DISCUZ')) exit('Access Denied'); hookscriptoutput('view_8');
0
|| checktplrefresh('data/diy/./template/dean_source_170511//portal/view_8.htm', './template/dean_source_170511/portal/portal_comment.htm', 1501344519, 'diy', './data/template/2_diy_portal_view_8.tpl.php', 'data/diy/./template/dean_source_170511/', 'portal/view_8')
|| checktplrefresh('data/diy/./template/dean_source_170511//portal/view_8.htm', './template/default/common/seccheck.htm', 1501344519, 'diy', './data/template/2_diy_portal_view_8.tpl.php', 'data/diy/./template/dean_source_170511/', 'portal/view_8')
;
block_get('160,161,162,163,165,164');?><?php include template('common/header'); ?><script src="<?php echo $_G['setting']['jspath'];?>forum_viewthread.js?<?php echo VERHASH;?>" type="text/javascript"></script>
<script type="text/javascript">zoomstatus = parseInt(<?php echo $_G['setting']['zoomstatus'];?>), imagemaxwidth = '<?php echo $_G['setting']['imagemaxwidth'];?>', aimgcount = new Array();</script>
<style type="text/css">
.wp, #wp{ width:100%;}
.pn{ font-size:12px!important; font-weight:normal!important;}
.ct2 .mn {border-right:0; float:left; width:862px;}
.ct2 .sd{ overflow:visible; width:300px;}
.deanacticletop{}
.deanacticletop h4{font-size:40px; line-height:58px;overflow:hidden; color:#333; font-weight:300; text-align:center; margin-bottom:15px;}
.deanneirong_c{width:832px; padding:15px; background:#fff;    box-shadow: 0 2px 3px rgba(0,0,0,0.06);}

.deanmanagerart{ border-bottom:1px solid #ededed; padding:5px 0px 10px 0; text-align:center; margin-bottom:15px;}
.deanmanagerart span{ display:inline-block; padding-left:25px; font-size:12px; color:#999; margin-right:10px;}
.deanmanagerart span a{ font-size:12px; color:#999;}
.deanmanagerart span a:hover{ color:#07AEFC}
.deanmanagerart span.deanviews{background:url(./template/dean_source_170511/deancss/portal_list_view/view.png) left center no-repeat;}
.deanmanagerart span.deanreplies{background:url(./template/dean_source_170511/deancss/portal_list_view/reply.png) left center no-repeat;}
.deanmanagerart span.deanedit{background:url(./template/dean_source_170511/deancss/portal_list_view/edit.png) left center no-repeat;}
.deanmanagerart span.deandelete{background:url(./template/dean_source_170511/deancss/portal_list_view/delete.png) left center no-repeat;}
.deanmanagerart span.deanshoucang{background:url(./template/dean_source_170511/deancss/portal_list_view/xin.png) left center no-repeat;}
.deanmanagerart span.deanfenxianga{background:url(./template/dean_source_170511/deancss/portal_list_view/share.png) left center no-repeat;}
.deanmanagerart span.deanyaoqing{background:url(./template/dean_source_170511/deancss/portal_list_view/invite.png) left center no-repeat;}
.deanmanagerart span.deanadds{background:url(./template/dean_source_170511/deancss/portal_list_view/add.png) left center no-repeat;}
.deanmanagerart span.deanpushed{background:url(./template/dean_source_170511/deancss/portal_list_view/cloud.png) left center no-repeat;}
/*相关阅读*/
#related_article .bm_c{ padding:0;}
.deanxgydbox_pd{ margin:20px 0; padding:15px 15px 0 15px; background:#fff; width:832px;    box-shadow: 0 2px 3px rgba(0,0,0,0.06);}
.deanxgydbox_pd h3{  border-bottom: 1px solid #ededed;  height: 35px; margin-bottom: 15px;}
.deanxgydbox_pd span{ display:block; font-size: 18px;  height: 22px; line-height: 22px;  margin-top: 5px; color: #333;
font-weight: normal; padding-left: 15px;  border-left: 4px solid #07AEFC;}
.deanthreadslists{ width:850px;}
.deanthreadslists li{ float:left; width:267.33px; margin:0 15px 15px 0;}
.deantoppicfd{ width:267.33px; height:170px; overflow:hidden;}
.deantoppicfd img{ width:267.33px; height:170px;-webkit-transition:all 0.3s linear;-moz-transition:all 0.3s linear;-o-transition:all 0.3s linear;-ms-transition:all 0.3s linear;transition:all 0.3s linear;}
.deanthreadslists li:hover img{transform: scale(1.1); -moz-transform: scale(1.1); -webkit-transform: scale(1.1); -o-transform: scale(1.1); -ms-transform: scale(1.1); }
.deanrpingfdf{ border:1px solid #ededed; padding:10px; height:65px; border-top:0; position:relative;}
.deanrpingfdf h5{ height:22px; line-height:22px; overflow:hidden; margin-bottom:10px;}
.deanrpingfdf h5 a{ font-size:14px; color:#333; font-weight:300;}
.deanrpingfdf h5 a:hover{color:#07AEFC}
.deanrfgtr{ padding:0 10px;height: 40px; width:245.3px; background: #f5f5f5; position:absolute; left:0; bottom:0;}
.deanfrzuoze{ float:left; font-size: 12px; color: #999; height: 40px; line-height: 40px;padding-left:18px; background:url(./template/dean_source_170511/deancss/portal_list_view/admin.png) left center no-repeat;}
.deandaterf{ float:right;font-size: 12px; color: #999; height: 40px; line-height: 40px; padding-left:18px;background:url(./template/dean_source_170511/deancss/portal_list_view/group.png) left center no-repeat;}




/*作者栏*/
.deanfabuxinxi{ width:270px; padding:15px; background:#fff; margin-bottom:15px; position:relative;    box-shadow: 0 2px 3px rgba(0,0,0,0.06);}
.deanfabuxinxi i{ display:block; width:12px; height:20px; background:url(./template/dean_source_170511/deancss/portal_list_view/b-trangle.png) center no-repeat; position:absolute; top:70px; left:-12px;}

.bm{ border:0; margin-bottom:0;}
.deanfbxxtop{}
.deanfbxxtop a{ display:block; padding-top:10px; }
.deantx{width:88px; height:88px; margin:0 auto;}
.deantx img{width:88px; height:88px; border-radius:100%;}
.deanzzm{ text-align:center; height:20px; line-height:20px; margin:14px 0 10px 0; font-size:16px; color:#333; font-weight:bold;}
.deanfbxxtop a span{ display:block; width:80px; height:20px; margin:0 auto 15px auto; line-height:20px; text-align:center; font-size:12px; color:#fff; border-radius:24px;  background-color: #07AEFC; background: linear-gradient(90deg,#5ea2ff,#00e3ff);}
.deanzztouxian{ display:block; margin:10px auto 15px auto; text-align:center;height:23px; line-height:23px; background:#07AEFC; font-size:12px; color:#fff; border-radius:24px; max-width:80px; overflow:hidden;}
.deanfbxxtop a em{ text-align:center; height:20px; line-height:20px; font-size:12px; color:#333; display:block; margin-bottom:15px;}

.deanfbxxbottom{ padding-top:10px; border-top:1px solid #ededed;}
.deanfbxxbottom span{ text-align:center; font-size:12px; color:#999;  float: left;  width: 33%; display:block;line-height: 24px;}
.deanfbxxbottom span.deansss{ margin-right:-1px;}
.deanfbxxbottom span.deanviews{ border-left:1px solid #ededed; border-right:1px solid #ededed; width: 34%;}
.deanfbxxbottom span.deanreplies{margin-left:-1px;}
.deanfbxxbottom span.deanreplies a{}
.deanfbxxbottom span em{ display: block; font-size: 20px; color: #333;  font-weight: normal;}
.deanxgydbox{ padding:15px; background:#fff; margin-bottom:15px; box-shadow: 0 2px 3px rgba(0,0,0,0.06);}

/*上一篇下一篇*/
.deanupdowns{}
.deanupdowns h5{ font-size:16px; color:#9ca4ab; font-weight:300; height:30px; line-height:30px;}
.deanupdowns a{ display:block; height:30px; line-height:30px; font-size:14px; color:#333; overflow:hidden;text-overflow:ellipsis; white-space:nowrap; }
.deanupdowns a:hover{ color:#07AEFC}
.deanupdowns em{ font-size:12px; color:#999;}

</style>


<?php if(!empty($_G['setting']['pluginhooks']['view_article_top'])) echo $_G['setting']['pluginhooks']['view_article_top'];?><?php echo adshow("text/wp a_t");?><div class="wp">
<!--[diy=diy1]--><div id="diy1" class="area"></div><!--[/diy]-->
</div>

<div id="ct" class="ct2 wp cl" style="width:1180px!important; margin:20px auto;">
    	<div class="mn">
        	<div class="deanneirong_c">
                <div class="deanacticletop">
                    <h4><?php echo $article['title'];?> <?php if($article['status'] == 1) { ?>(待审核)<?php } elseif($article['status'] == 2) { ?>(已忽略)<?php } ?></h4>
                </div>
                <div class="deanmanagerart">
                    <span class="deanedit"><?php if($article['author']) { ?>原作者: <?php echo $article['author'];?><?php } ?>
                            <?php if($article['from']) { ?>来自: <?php if($article['fromurl']) { ?><a href="<?php echo $article['fromurl'];?>" target="_blank"><?php echo $article['from'];?></a><?php } else { ?><?php echo $article['from'];?><?php } } ?>
                            <?php if($_G['group']['allowmanagearticle'] || ($_G['group']['allowpostarticle'] && $article['uid'] == $_G['uid'] && (empty($_G['group']['allowpostarticlemod']) || $_G['group']['allowpostarticlemod'] && $article['status'] == 1)) || $categoryperm[$value['catid']]['allowmanage']) { ?>
                            <a href="portal.php?mod=portalcp&amp;ac=article&amp;op=edit&amp;aid=<?php echo $article['aid'];?>">编辑</a>
                         </span>
                         <span class="deandelete">
                            <?php if($article['status']>0 && ($_G['group']['allowmanagearticle'] || $categoryperm[$value['catid']]['allowmanage'])) { ?>
                            <a href="portal.php?mod=portalcp&amp;ac=article&amp;op=verify&amp;aid=<?php echo $article['aid'];?>" id="article_verify_<?php echo $article['aid'];?>" onclick="showWindow(this.id, this.href, 'get', 0);">审核</a>
                                <?php } else { ?>
                                    <a href="portal.php?mod=portalcp&amp;ac=article&amp;op=delete&amp;aid=<?php echo $article['aid'];?>" id="article_delete_<?php echo $article['aid'];?>" onclick="showWindow(this.id, this.href, 'get', 0);">删除</a>
                                <?php } ?>
                            <?php } ?>
                            <?php if(!empty($_G['setting']['pluginhooks']['view_article_subtitle'])) echo $_G['setting']['pluginhooks']['view_article_subtitle'];?>
                         </span>
                         <span class="deanshoucang"><a href="home.php?mod=spacecp&amp;ac=favorite&amp;type=article&amp;id=<?php echo $article['aid'];?>&amp;handlekey=favoritearticlehk_<?php echo $article['aid'];?>" id="a_favorite" onclick="showWindow(this.id, this.href, 'get', 0);">收藏</a></span>
                        <?php if(helper_access::check_module('share')) { ?>
                        <span class="deanfenxianga"><a href="home.php?mod=spacecp&amp;ac=share&amp;type=article&amp;id=<?php echo $article['aid'];?>&amp;handlekey=sharearticlehk_<?php echo $article['aid'];?>" id="a_share" onclick="showWindow(this.id, this.href, 'get', 0);">分享</a></span>
                        <?php } ?>
                        <span class="deanyaoqing"><a href="misc.php?mod=invite&amp;action=article&amp;id=<?php echo $article['aid'];?>" id="a_invite" onclick="showWindow('invite', this.href, 'get', 0);">邀请</a></span>
                        <?php if($_G['group']['allowmanagearticle'] || ($_G['group']['allowpostarticle'] && $article['uid'] == $_G['uid'] && (empty($_G['group']['allowpostarticlemod']) || $_G['group']['allowpostarticlemod'] && $article['status'] == 1)) || $categoryperm[$value['catid']]['allowmanage']) { ?>
                        <span class="deanadds"><a id="related_article" href="portal.php?mod=portalcp&amp;ac=related&amp;aid=<?php echo $article['aid'];?>&amp;catid=<?php echo $article['catid'];?>&amp;update=1" onclick="showWindow(this.id, this.href, 'get', 0);return false;">添加相关文章</a></span>
                        
                        <?php } ?>
                        <?php if($article['status']==0 && ($_G['group']['allowdiy']  || getstatus($_G['member']['allowadmincp'], 4) || getstatus($_G['member']['allowadmincp'], 5) || getstatus($_G['member']['allowadmincp'], 6))) { ?>
                        <span class="deanpushed"><a href="portal.php?mod=portalcp&amp;ac=portalblock&amp;op=recommend&amp;idtype=aid&amp;id=<?php echo $article['aid'];?>" onclick="showWindow('recommend', this.href, 'get', 0)">模块推送</a></span>
                        <?php } ?>
                </div>
                <div class="bm vw">
                  <div class="d"> 
                    <table cellpadding="0" cellspacing="0" class="vwtb">
                      <tr>
                        <td id="article_content"><?php echo adshow("article/a_af/1");?> 
                          <?php if($content['title']) { ?>
                          
                          <div class="vm_pagetitle xw1"><?php echo $content['title'];?></div>
                          
                          <?php } ?> 
                          <?php echo $content['content'];?> </td>
                      </tr>
                    </table>
                    <?php if(!empty($_G['setting']['pluginhooks']['view_article_content'])) echo $_G['setting']['pluginhooks']['view_article_content'];?> 
                    <?php if($multi) { ?>
                    <div class="ptw pbw cl"><?php echo $multi;?></div>
                    <?php } ?>
                    
                    <div class="o cl ptm pbm"> 
                      <?php if(!empty($_G['setting']['pluginhooks']['view_article_op_extra'])) echo $_G['setting']['pluginhooks']['view_article_op_extra'];?> 
                    <script src="<?php echo $_G['setting']['jspath'];?>home.js?<?php echo VERHASH;?>" type="text/javascript"></script>
                    <div id="click_div"> 
                      <?php include template('home/space_click'); ?> 
                    </div>
                    
                    <?php if(!empty($contents)) { ?>
                    <div id="inner_nav" class="ptn xs1">
                      <h3>本文导航</h3>
                      <ul class="xl xl2 cl">
                        <?php if(is_array($contents)) foreach($contents as $key => $value) { ?> 
                        <?php $curpage = $key+1;?> 
                        <?php $inner_view_url = helper_page::mpurl($viewurl, 'page=', $curpage);?>                        <li>&bull; <a href="<?php echo $inner_view_url;?>"<?php if($key === $start) { ?> class="xi1"<?php } ?>>第 <?php echo $curpage;?> 页 <?php echo $value['title'];?></a></li>
                        <?php } ?>
                      </ul>
                    </div>
                    <?php } ?> 
                    
                    <!--[diy=diycontentclickbottom]--><div id="diycontentclickbottom" class="area"></div><!--[/diy]--> 
                    
                  </div>
                  <?php if(!empty($aimgs[$content['pid']])) { ?> 
                  <script type="text/javascript" reload="1">aimgcount[<?php echo $content['pid'];?>] = [<?php echo implode(',', $aimgs[$content['pid']]);; ?>];attachimgshow(<?php echo $content['pid'];?>);</script> 
                  <?php } ?> 
                  
                  <?php if(!empty($_G['setting']['pluginhooks']['view_share_method'])) { ?>
                  <div class="tshare cl"> <strong>!viewthread_share_to!:</strong> 
                    <?php if(!empty($_G['setting']['pluginhooks']['view_share_method'])) echo $_G['setting']['pluginhooks']['view_share_method'];?> 
                  </div>
                  <?php } ?> 
                  
                </div>
                <?php echo adshow("article/mbm hm/2");?><?php echo adshow("article/mbm hm/3");?> 
                
                
                
                <?php if($article['allowcomment']==1) { ?> 
                <?php $data = &$article?> 
                <div id="comment" class="bm">
  <div class="deanartcomment"> 
    <em class="y">该文章已有<span><?php echo $data['commentnum'];?></span>人参与评论</em>
    <h3>请发表评论</h3>
    
  </div>
  <div id="comment_ul"> 
    
    <?php if(!empty($pricount)) { ?>
    <p class="mtn mbn y">提示：本页有 <?php echo $pricount;?> 个评论因未通过审核而被隐藏</p>
    <?php } ?> 
    
    <?php if(!$data['htmlmade']) { ?>
    
    
    
    <form id="cform" name="cform" action="<?php echo $form_url;?>" method="post" autocomplete="off">
<div class="tedt" id="tedt">
<div class="area">
<textarea name="message" rows="3" class="pt" id="message"  <?php if(!$_G['uid']) { ?> placeholder="立即登录发表您的看法吧^0^"<?php } ?> onkeydown="ctrlEnter(event, 'commentsubmit_btn');"></textarea>
</div>
</div>
                <div class="mb15 cl">


<?php if($secqaacheck || $seccodecheck) { ?><?php
$sectpl = <<<EOF
<sec> <span id="sec<hash>" onclick="showMenu(this.id);"><sec></span><div id="sec<hash>_menu" class="p_pop p_opt" style="display:none"><sec></div>
EOF;
?>
<div class="mtm z"><?php $sechash = !isset($sechash) ? 'S'.($_G['inajax'] ? 'A' : '').$_G['sid'] : $sechash.random(3);
$sectpl = str_replace("'", "\'", $sectpl);?><?php if($secqaacheck) { ?>
<span id="secqaa_q<?php echo $sechash;?>"></span>		
<script type="text/javascript" reload="1">updatesecqaa('q<?php echo $sechash;?>', '<?php echo $sectpl;?>', '<?php echo $_G['basescript'];?>::<?php echo CURMODULE;?>');</script>
<?php } if($seccodecheck) { ?>
<span id="seccode_c<?php echo $sechash;?>"></span>		
<script type="text/javascript" reload="1">updateseccode('c<?php echo $sechash;?>', '<?php echo $sectpl;?>', '<?php echo $_G['basescript'];?>::<?php echo CURMODULE;?>');</script>
<?php } ?></div>
<?php } if(!empty($topicid) ) { ?>
<input type="hidden" name="referer" value="<?php echo $topicurl;?>#comment" />
<input type="hidden" name="topicid" value="<?php echo $topicid;?>">
<?php } else { ?>
<input type="hidden" name="portal_referer" value="<?php echo $viewurl;?>#comment">
<input type="hidden" name="referer" value="<?php echo $viewurl;?>#comment" />
<input type="hidden" name="id" value="<?php echo $data['id'];?>" />
<input type="hidden" name="idtype" value="<?php echo $data['idtype'];?>" />
<input type="hidden" name="aid" value="<?php echo $aid;?>">
<?php } ?>
<input type="hidden" name="formhash" value="<?php echo FORMHASH;?>">
<input type="hidden" name="replysubmit" value="true">
<input type="hidden" name="commentsubmit" value="true" />
<p class="pt10 cl y"><button type="submit" name="commentsubmit_btn" id="commentsubmit_btn" value="true" class="pn y">评论</button></p>
                </div>
</form>
    
    
    

   
    
        <script type="text/javascript">
    jQuery(function(){
jQuery("#tedt .pt").focus(function(){
  jQuery(this).addClass("bgchange");
}).blur(function(){
  jQuery(this).removeClass("bgchange");
});
    });
    </script> 

    <h3>全部评论</h3>
    <?php } ?> 
    <ul>
    <?php if(is_array($commentlist)) foreach($commentlist as $comment) { ?> 
    <?php include template('portal/comment_li'); ?> 
    <?php if(!empty($aimgs[$comment['cid']])) { ?> 
    <script type="text/javascript" reload="1">aimgcount[<?php echo $comment['cid'];?>] = [<?php echo implode(',', $aimgs[$comment['cid']]);; ?>];attachimgshow(<?php echo $comment['cid'];?>);</script> 
    <?php } ?> 
    <?php } ?>
    </ul>
    <p class="ptn cl" style=" text-align:center">
        <?php if($data['commentnum']) { ?><a href="<?php echo $common_url;?>" class="xi2">查看全部评论>></a><?php } ?>
      </p>
  </div>
</div>
 
                <?php } ?>     
                </div>
            </div>
            
            <?php if($article['related']) { ?>
            <!--相关文章阅读-->
            <div class="deanxgydbox_pd">
                <h3><span>相关阅读</span></h3>
                <div id="related_article" class="bm">
                  <div class="bm_c">
                    <ul class="deanthreadslists" id="raid_div">
                      <?php if(is_array($article['related'])) foreach($article['related'] as $raid => $rvalue) { ?>                      <input type="hidden" value="<?php echo $raid;?>" />
                      <li>
                        <div class="deantoppicfd">
                            <a href="<?php echo $rvalue['uri'];?>" target="_blank"><img src="data/attachment/<?php echo $rvalue['pic'];?>"/></a>
                        </div>
                        <div class="deanrpingfdf">
                            <h5><a href="<?php echo $rvalue['uri'];?>"><?php echo $rvalue['title'];?></a></h5>
                            <div class="deanrfgtr">
                            	<div class="deanfrzuoze"><?php echo $rvalue['username'];?></div>
                                <div class="deandaterf"><?php echo date("Y-m-d",$rvalue['dateline']); ?></div>
                                <div class="clear"></div>
                            </div>
                        </div>
                        <div class="clear"></div>
                      </li>
                      <?php } ?>
                      <div class="clear"></div>
                    </ul>
                  </div>
                </div>
            </div>
            <?php } ?>
        </div>
    	<div class="sd pph">
        	
            <div class="deanfabuxinxi">
            	<i></i>
                <div class="deanfbxxtop">
                    <a href="home.php?mod=space&amp;uid=<?php echo $article['uid'];?>" target="_blank">
                        <div class="deantx"><?php echo avatar($article[uid],big);?></div>
                        <div class="deanzzm"><?php echo $article['username'];?></div>
                        <span>本文作者</span>
                        <em><?php echo $article['dateline'];?></em>
                    </a>
                    <div class="clear"></div>
                </div>
                <div class="deanfbxxbottom">
                <?php $deanusersfollows = DB::result(DB::query("SELECT follower FROM ".DB::table('common_member_count')." WHERE uid = '$article[uid]'"));?>                    <span class="deansss">粉丝<em><?php echo $deanusersfollows['follower'];?></em></span>
                    
                    <span class="deanviews">阅读<em><?php if($article['viewnum'] > 0) { ?><?php echo $article['viewnum'];?><?php } else { ?>0<?php } ?></em></span>
                    <span class="deanreplies">回复<?php if($article['commentnum'] > 0) { ?><a href="<?php echo $common_url;?>" title="查看全部评论"><em><?php echo $article['commentnum'];?></em></a><?php } else { ?><em>0</em><?php } ?></span>
                    <div class="clear"></div>
                </div>
                
            </div>
            <!--上一篇下一篇-->
            <?php if($article['preaid'] || $article['nextaid']) { ?>
            <div class="deanxgydbox">
                <div class="deanupdowns">
                	<h5>上一篇：</h5>
                    <?php if($article['prearticle']) { ?><a href="<?php echo $article['prearticle']['url'];?>"><?php echo $article['prearticle']['title'];?></a><em>发布时间：<?php echo date("Y-m-d",$article['prearticle']['dateline']); ?></em><?php } ?>
                    <h5>下一篇：</h5>
                    <?php if($article['nextarticle']) { ?><a href="<?php echo $article['nextarticle']['url'];?>"><?php echo $article['nextarticle']['title'];?></a><em>发布时间：<?php echo date("Y-m-d",$article['nextarticle']['dateline']); ?></em><?php } ?>
                    <div class="clear"></div>
                </div>
            </div>
            <?php } ?>
            <!-- 精彩阅读 -->
            <div class="deansidebox">
                <div class="deanpubtitle">
                    <h4>精彩阅读</h4>
                    <div class="deanpbright">
                        <a href="#" target="_blank">更多</a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="focusBox">
                    <!--[diy=focusBox]--><div id="focusBox" class="area"><div id="framejQdr98" class="frame move-span cl frame-1"><div id="framejQdr98_left" class="column frame-1-c"><div id="framejQdr98_left_temp" class="move-span temp"></div><?php block_display('160');?></div></div></div><!--[/diy]-->
                        
                        <a class="prev" href="javascript:void(0)"><</a>
                        <a class="next" href="javascript:void(0)">></a>
                        <ul class="hd">
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                        </ul>
                </div>
            
                <script type="text/javascript">
                    jQuery(".focusBox").slide({ mainCell:".pic",effect:"left", autoPlay:true, delayTime:300});
                </script>
                
                
            </div>

            <!-- 精选资讯 -->
            <div class="deansidebox">
                <div class="deangltt">
                    <!--[diy=deangltt2]--><div id="deangltt2" class="area"><div id="framewHHZSf" class="frame move-span cl frame-1"><div id="framewHHZSf_left" class="column frame-1-c"><div id="framewHHZSf_left_temp" class="move-span temp"></div><?php block_display('161');?></div></div></div><!--[/diy]-->
                    <div class="clear"></div>
                </div>
                <div class="deangllists">
                    <ul>
                        <!--[diy=deangllists]--><div id="deangllists" class="area"><div id="frameShhw1e" class="frame move-span cl frame-1"><div id="frameShhw1e_left" class="column frame-1-c"><div id="frameShhw1e_left_temp" class="move-span temp"></div><?php block_display('162');?></div></div></div><!--[/diy]-->
                    </ul>
                </div>
            </div>
            
            <!-- 推荐视频 -->
            <div class="deansidebox">
                <div class="deanpubtitle">
                    <h4>推荐视频</h4>
                    <div class="deanpbright">
                        <a href="#" target="_blank">更多</a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="deanonvideos">
                    <ul>
                        <!--[diy=deangamestt1ss]--><div id="deangamestt1ss" class="area"><div id="framend25f0" class="frame move-span cl frame-1"><div id="framend25f0_left" class="column frame-1-c"><div id="framend25f0_left_temp" class="move-span temp"></div><?php block_display('163');?></div></div></div><!--[/diy]-->
                        <div class="clear"></div>
                    </ul>
                </div>
                
            </div>
            
            <!-- 排行榜 -->
<div class="deansidebox">
        	<div class="deanpubtitle">
                <h4>阅读排行榜</h4>
                <div class="deanpbright">
                    <a href="#" target="_blank">更多</a>
                </div>
                <div class="clear"></div>
            </div>
            <div class="deanranklistbox">
                <ul>
                    <!--[diy=deanranklistbox]--><div id="deanranklistbox" class="area"><div id="frameDB8N6u" class="frame move-span cl frame-1"><div id="frameDB8N6u_left" class="column frame-1-c"><div id="frameDB8N6u_left_temp" class="move-span temp"></div><?php block_display('165');?></div></div></div><!--[/diy]-->
                </ul>
            </div>
            <script type="text/javascript">
jq(".deanranklistbox ul li").each(function(s){
jq(this).hover(function(){
jq(this).addClass("on").siblings().removeClass("on");
})
})
</script>
        </div>
            
            <!-- 专访 -->
            <div class="deansidebox">
                <div class="deanpubtitle">
                    <h4>专访</h4>
                    <div class="deanpbright">
                        <a href="#" target="_blank">更多</a>
                    </div>
                    <div class="clear"></div>
                </div>
                <div class="deanimg_news">
                    <!--[diy=deanimg_news]--><div id="deanimg_news" class="area"><div id="framekvbRRs" class="frame move-span cl frame-1"><div id="framekvbRRs_left" class="column frame-1-c"><div id="framekvbRRs_left_temp" class="move-span temp"></div><?php block_display('164');?></div></div></div><!--[/diy]-->
                    
                    <div class="clear"></div>
                </div>
                
            </div>
            <!--关注我们-->
            <div class="deanguanzhu">
                <!--[diy=deanguanzhu]--><div id="deanguanzhu" class="area"></div><!--[/diy]-->
            </div> 
        </div>
    	<div class="clear"></div>

</div>

<?php if($_G['relatedlinks']) { ?>
<script type="text/javascript">
var relatedlink = [];<?php if(is_array($_G['relatedlinks'])) foreach($_G['relatedlinks'] as $key => $link) { ?>relatedlink[<?php echo $key;?>] = {'sname':'<?php echo $link['name'];?>', 'surl':'<?php echo $link['url'];?>'};
<?php } ?>
relatedlinks('article_content');
</script>
<?php } ?>

<div class="wp mtn">
<!--[diy=diy3]--><div id="diy3" class="area"></div><!--[/diy]-->
</div>
<input type="hidden" id="portalview" value="1">
<script type="text/javascript">
jQuery(function() { 
var elm = jQuery('.deanguanzhu'); 
var startPos = jQuery(elm).offset().top; 
jQuery.event.add(window, "scroll", function() { 
var p = jQuery(window).scrollTop(); 
jQuery(elm).css('position',((p) > startPos) ? 'fixed' : 'relative'); 
jQuery(elm).css('top',((p) > startPos) ? '75px' : ''); 
jQuery(elm).css('box-shadow',((p) > startPos) ? '0px 2px 4px 2px #eaeaea' : '');
jQuery(elm).css('z-index',((p) > startPos) ? '2' : '');
}); 
}); 
</script><?php include template('common/footer'); ?>