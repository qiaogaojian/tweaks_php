<?php if (!defined('THINK_PATH')) exit(); if(is_array($category)): $i = 0; $__LIST__ = $category;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$cate): $mod = ($i % 2 );++$i; if(in_array($cate["name"],array("media_gg","media_new","media_activity"))): if(($current) == $cate['id']): ?><li class="active">
			<a class="on" href="<?php echo U('Article/lists?category='.$cate['name']);?>">
				<i class="icon-chevron-right"></i><?php echo ($cate["title"]); ?>
			</a>
		</li>
	<?php else: ?>
		<li>
			<a  href="<?php echo U('Article/lists?category='.$cate['name']);?>">
				<i class="icon-chevron-right"></i><?php echo ($cate["title"]); ?>
			</a>
		</li><?php endif; endif; endforeach; endif; else: echo "" ;endif; ?>