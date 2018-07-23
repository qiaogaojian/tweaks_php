<?php
if(!defined('IN_DISCUZ')) {
	exit('Access Denied');
}
$summary = DB::result(DB::query("SELECT message FROM ".DB::table('forum_post')." WHERE tid = '$thread[tid]' AND first = '1' ")); $summary_echo = preg_replace ("/\[[a-z][^\]]*\]|\[\/[a-z]+\]/i",'',preg_replace("/\[attach\]\d+\[\/attach\]/i",'',$summary));
$deanusersfollows = DB::result(DB::query("SELECT follower FROM ".DB::table('common_member_count')." WHERE uid = '$article[uid]'"));
$ralatedsarts = DB::fetch_all("SELECT * FROM ".DB::table('portal_article_title')." WHERE uid= '$article[uid]' ORDER BY `dateline` DESC ");
?>