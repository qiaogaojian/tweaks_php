<?php if(!defined('IN_DISCUZ')) exit('Access Denied'); ?>
<style type="text/css">
.deanlogin .pipe{ display:none;} 
.deanlogin dl a{ padding:0;}
</style>
<div class="deanlogin">                 
        <?php if($_G['uid']) { ?>
        <div class="allmember" style="float:right; position:relative;line-height: 25px;">
        	<div class="deandiy_btn"><?php if(check_diy_perm($topic)) { ?><?php echo $diynav;?><?php } ?></div>
        	<div class="deanusersets"><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra4'])) echo $_G['setting']['pluginhooks']['global_usernav_extra4'];?><a href="home.php?mod=spacecp" title="����"></a></div>
        	<div class="deantongzhi"><a href="home.php?mod=space&amp;do=notice" title="��֪ͨ" id="deanmypostsd"<?php if($_G['member']['newprompt']) { ?> class="new"<?php } ?>><?php if($_G['member']['newprompt']) { ?><span><?php echo $_G['member']['newprompt'];?></span><?php } ?></a></div>
            <div class="deantongzhi" style="margin-right:75px;"><a href="home.php?mod=space&amp;do=pm" title="����Ϣ" id="deanpm_ntc"<?php if($_G['member']['newpm']) { ?> class="new"<?php } ?>></a></div>
            <div class="deanloginout"><a href="member.php?mod=logging&amp;action=logout&amp;formhash=<?php echo FORMHASH;?>" title="�˳���½"></a></div>
            <div class="clear"></div>
            <div id="deanmemberinfo"><a class="deanvwmy" href="home.php?mod=space&amp;uid=<?php echo $_G['uid'];?>" target="_blank" title="�����ҵĿռ�"><?php echo avatar($_G[uid],middle);?><i></i></a><div class="clear"></div></div>
            
        <div class="clear"></div>
            <div id="deanmembercontent">
                <dl>
                	<dd><a class="deanadmin" href="home.php?mod=space&amp;uid=<?php echo $_G['uid'];?>" target="_blank" title="�����ҵĿռ�"><?php echo $_G['member']['username'];?></a></dd>
                   <dd><?php if($_G['setting']['taskon'] && !empty($_G['cookie']['taskdoing_'.$_G['uid']])) { ?><a href="home.php?mod=task&amp;item=doing" id="task_ntc" class="new">�����е�����</a><?php } ?></dd>
                    <?php if(($_G['group']['allowmanagearticle'] || $_G['group']['allowpostarticle'] || $_G['group']['allowdiy'] || getstatus($_G['member']['allowadmincp'], 4) || getstatus($_G['member']['allowadmincp'], 6) || getstatus($_G['member']['allowadmincp'], 2) || getstatus($_G['member']['allowadmincp'], 3))) { ?>
                       <dd><a href="portal.php?mod=portalcp"><?php if($_G['setting']['portalstatus'] ) { ?>�Ż�����<?php } else { ?>ģ�����<?php } ?></a></dd>
                    <?php } ?>
                    <?php if($_G['uid'] && $_G['group']['radminid'] > 1) { ?>
                       <dd><a href="forum.php?mod=modcp&amp;fid=<?php echo $_G['fid'];?>" target="_blank"><?php echo $_G['setting']['navs']['2']['navname'];?>����</a></dd>
                    <?php } ?>
                    <?php if($_G['uid'] && $_G['adminid'] == 1 && $_G['setting']['cloud_status']) { ?>
                        <dd><a href="admin.php?frames=yes&amp;action=cloud&amp;operation=applist" target="_blank">��ƽ̨</a></dd>
                    <?php } ?>
                    <?php if($_G['uid'] && getstatus($_G['member']['allowadmincp'], 1)) { ?>
                      <dd><a href="admin.php" target="_blank">��������</a></dd>
                    <?php } ?>
                    
                    <?php $upgradecredit = $_G['uid'] && $_G['group']['grouptype'] == 'member' && $_G['group']['groupcreditslower'] != 999999999 ? $_G['group']['groupcreditslower'] - $_G['member']['credits'] : false;?>                    <dd><a href="home.php?mod=spacecp&amp;ac=usergroup"<?php if($upgradecredit !== 'false') { ?> class="xi2"<?php } ?>><?php echo $_G['group']['grouptitle'];?></a></dd>
                    <dd><div class="deandiybtn"><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra1'])) echo $_G['setting']['pluginhooks']['global_usernav_extra1'];?><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra2'])) echo $_G['setting']['pluginhooks']['global_usernav_extra2'];?><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra3'])) echo $_G['setting']['pluginhooks']['global_usernav_extra3'];?><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra4'])) echo $_G['setting']['pluginhooks']['global_usernav_extra4'];?></div></dd>
                </dl>
            </div>
            <script type="text/javascript">
                jq("#deanmemberinfo").hover(
                    function(){
                        jq(this).siblings("#deanmembercontent").show();
                        },
                    function(){
                        jq(this).siblings("#deanmembercontent").hide();
                        })
                jq("#deanmembercontent").hover(
                    function(){
                        jq(this).show();
                        jq(this).siblings("#deanmemberinfo").addClass("curs");
                        },
                    function(){
                        jq(this).hide();
                        jq(this).siblings("#deanmemberinfo").removeClass("curs");
                        })
            </script>
        </div>
   <ul>
     <?php } elseif(!empty($_G['cookie']['loginuser'])) { ?>
        <li><a id="loginuser" class="noborder"><?php echo dhtmlspecialchars($_G['cookie']['loginuser']); ?></a></li>
        <li><a href="member.php?mod=logging&amp;action=login" onClick="showWindow('login', this.href)">����</a></li>
        <li><a href="member.php?mod=logging&amp;action=logout&amp;formhash=<?php echo FORMHASH;?>">�˳�</a></li>
    <?php } elseif(!$_G['connectguest']) { ?>
    <style tpye="text/css">

    </style>
    	 <div class="deandenglu">
         	<div class="deanundl">
            	<div class="deanundlicon">
                	<div class="deandlkuang">
                    	<i></i>
                        <ul>
                            <li><a href="javascript:;" onclick="showWindow('login', 'member.php?mod=logging&action=login&viewlostpw=1')">�������룿</a></li>
                            <li><a href="connect.php?mod=login&amp;op=init&amp;referer=index.php&amp;statfrom=login_simple" title="QQ��¼">QQ��¼</a></li>
                            <li><a href="plugin.php?id=wechat:login" target="_blank">΢�ŵ�¼</a></li>
                        </ul>
                    </div>
                </div>
            	<span class="deandlbtn"><a href="member.php?mod=logging&amp;action=login" onclick="showWindow('login', this.href)">��½</a></span>
                <span class="deanregbtn"><a href="member.php?mod=<?php echo $_G['setting']['regname'];?>">ע��</a></span>
                <div class="clear"></div>
            </div>
            
        </div>
            
<script type="text/javascript">
                jq(".deanundlicon").hover(
                    function(){
                        jq(".deandlkuang").show();
                        },
                    function(){
                        jq(".deandlkuang").hide();
                        })
                jq(".deanundlicon").hover(
                    function(){
                        jq(this).addClass("curss");
                        },
                    function(){
                        jq(this).removeClass("curss");
                        })
            </script>      
     <?php } else { ?>
        <div id="um">
        	<dl>
                <dd class="vwmy qq"><?php echo $_G['member']['username'];?></dd>
                <dd><?php if(!empty($_G['setting']['pluginhooks']['global_usernav_extra1'])) echo $_G['setting']['pluginhooks']['global_usernav_extra1'];?></dd>
                <dd><a href="member.php?mod=logging&amp;action=logout&amp;formhash=<?php echo FORMHASH;?>">�˳�</a></dd>
                <dd><a href="home.php?mod=spacecp&amp;ac=credit&amp;showcredit=1">����: 0</a></dd>
                <dd>�û���: <?php echo $_G['group']['grouptitle'];?></li>
            </dl>
        </div>
        <?php } ?>
    </ul>
</div>