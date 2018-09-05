<?php

namespace Admin\Controller;
use User\Api\UserApi as UserApi;

/**
 * 推广查询控制器
 * @author 王贺
 */
class StatisticsController extends ThinkController {
    /**
    *日常统计
    */
    public function index(){
        $this->display();
    }

  
}
