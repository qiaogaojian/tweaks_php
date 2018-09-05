<?php

namespace Media\Controller;
use OT\DataDictionary;
use User\Api\MemberApi;

/**
 * 前台首页控制器
 * 主要获取首页聚合数据
 */
class IndexController extends BaseController {


    protected function _initialize(){
        /* 读取站点配置 */
        $config = api('WebConfig/lists');
        C($config); //添加配置
            if(C('JADMIN_ALLOW_IP')){              
                $this->error('您无权访问此网站');
            exit();
        }
    }

	//系统首页
    public function index(){
        $this->slide();
    	$this->recommend();
    	$this->hot();
    	$this->gift();
    	$this->area();
        $this->display();
    }

    public function slide(){
        $model = D('Slidemanage');
        $data = $model->where('classify=1')->limit(4)->select();
        $this->assign("slide_data",$data);
    }

    /***
	*推荐游戏
    */
    public function recommend(){
    	$model = array(
    		'm_name'=>'Game',
    		'prefix'=>'tab_',
    		'map'   =>array('game_status'=>1,'recommend_status'=>1),
    		'field' =>true,
    		'order' =>'sort asc',
    		'limit' =>4,
    	);
    	$reco = parent::list_data($model);
    	$this->assign('recommend',$reco);
    }

    /***
	*热门游戏
    */
    public function hot(){
    	$model = array(
    		'm_name'=>'Game',
    		'prefix'=>'tab_',
    		'map'   =>array('game_status'=>1,'recommend_status'=>2),
    		'field' =>true,
    		'order' =>'sort asc',
    		'limit' =>9,
    	);
    	$hot = parent::list_data($model);
    	$this->assign('hot',$hot);
    }

    /***
	*游戏礼包
    */
    public function gift(){
    	$model = array(
    		'm_name'=>'Giftbag',
    		'prefix'=>'tab_',
    		'field' =>'tab_giftbag.id as gift_id,game_id,giftbag_name,giftbag_type,tab_game.icon,tab_giftbag.create_time',
    		'join'	=>'tab_game on tab_giftbag.game_id = tab_game.id',
    		'map'   =>array('game_status'=>1),
    		'order' =>'create_time ',
    		'limit' =>9,
    	);
    	$gift = parent::join_data($model);
    	$this->assign('gift',$gift);
    }

    /***
	*游戏区服
    */
    public function area(){
    	$model = array(
    		'm_name'=>'Area',
    		'prefix'=>'tab_',
    		'field' =>'tab_area.id as area_id,game_id,game_name,area_name,start_time,tab_game.icon,tab_area.create_time',
    		'join'	=>'tab_game on tab_area.game_id = tab_game.id',
    		'map'   =>array('game_status'=>1),
    		'order' =>'create_time ',
    		'limit' =>9,
    	);
    	$area = parent::join_data($model);
    	$this->assign('area',$area);
    }

}