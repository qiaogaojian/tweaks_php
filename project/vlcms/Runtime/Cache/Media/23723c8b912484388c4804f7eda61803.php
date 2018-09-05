<?php if (!defined('THINK_PATH')) exit();?><div class="side1">
    <div class="title"> <span>游戏排行</span>  </div>
    <div class="game-ranklist">
        
        <?php if(is_array($list_rank)): $i = 0; $__LIST__ = $list_rank;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$vo): $mod = ($i % 2 );++$i;?><dl class="clearfix">
            <dt> 
    			<span class="ranknum num<?php echo ($key+1); ?>"><?php echo ($key+1); ?></span> 
    			<span class="rankpic"><a href="<?php echo U('Game/game_detail?id='.$vo['id'].'');?>" target="_blank">
    				<img src="/project/vlcms<?php echo (get_cover($vo["icon"],'path')); ?>"></a></span> 
    		</dt>
            <dd>
                <h3><a href="<?php echo U('Game/detail?id='.$vo['id'].'');?>"><?php echo ($vo["game_name"]); ?></a></h3>
                <p class="rank-mark<?php echo ($vo["recommend_level"]); ?>">推荐：</p>
                <p class="rank-checkin">
    				<a href="<?php echo U('Down/down_file?game_id='.$vo['id'].'&type=1');?>" class="down">下载</a>
    				<a href="<?php echo U('Game/gift_list?game_id='.$vo['id'].'');?>" class="gift">礼包</a>
    			</p>
            </dd>
        </dl><?php endforeach; endif; else: echo "" ;endif; ?> 

    </div>
</div>