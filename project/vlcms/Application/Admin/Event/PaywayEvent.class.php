<?php
// +----------------------------------------------------------------------
// | OneThink [ WE CAN DO IT JUST THINK IT ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013 http://www.onethink.cn All rights reserved.
// +----------------------------------------------------------------------
// | Author: 麦当苗儿 <zuojiazi@vip.qq.com> <http://www.zjzit.cn>
// +----------------------------------------------------------------------
namespace Admin\Event;
use Think\Controller;
/**
 * 后台首页控制器
 * @author 麦当苗儿 <zuojiazi@vip.qq.com>
 */
class PaywayEvent extends Controller {

    public function this_year(){
        $this_year_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,1,1,date("Y")))) ;
        $this_year_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,12,31,date("Y")))) ;
        $where = " where pay_time BETWEEN '".$this_year_start."' and '".$this_year_end."'";
        $this->group_data($where);
    }

    /**
    *本月数据
    */
    public function this_month(){
        $this_month_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m"),1,date("Y")))) ;
        $this_month_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m"),date("t"),date("Y")))) ;
        $where = " where pay_time BETWEEN '".$this_month_start."' and '".$this_month_end."'";
        $this->group_data($where);
    }

    /**
    *上月数据
    */
    public function last_month(){
        $last_month_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-1,1,date("Y"))));
        $last_month_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m") ,0,date("Y"))));
        $where = " where pay_time BETWEEN '".$last_month_start."' and '".$last_month_end."'";
        $this->group_data($where);
    }

    /**
    *本周数据
    */
    public function this_week(){
        $this_week_start = this_monday(0,false);
        $this_week_end   = this_sunday(0,false);
        $where = " where pay_time BETWEEN '".$this_week_start."' and '".$this_week_end."'";
        $this->group_data($where);
    }

    /**
    *上周数据
    */
    public function last_week(){
        if (date('l',time()) == 'Monday') $last_week_start = date('m月d日',strtotime('last monday'));
        $last_week_start =strtotime(date('Y-m-d',strtotime('-1 week last monday')));

        $last_week_end   =strtotime(date('Y-m-d',strtotime('last sunday')));
        $where = " where pay_time BETWEEN '".$last_week_start."' and '".$last_week_end."'";
        $this->group_data($where);
        //var_dump($last_week_start."————".$last_week_end);
    }

    public function group_data($str_where){
        $data = M()->query("select pay_time,sum(case pay_way when '0' then pay_amount else 0 end) as alipay,sum(case pay_way when '1' then pay_amount else 0 end) as wxpay,sum(pay_amount) as total from tab_recharge ".$str_where." group by DATE_FORMAT(pay_time,'%Y%m%d') order by pay_time DESC");
        $this->assign('list_data', $data);
        $this->assign("alipay_total",$this->fun_sum($data,"alipay"));
        $this->assign("weixin_total",$this->fun_sum($data,"wxpay"));
        $this->assign("total",$this->fun_sum($data,"total"));
    }

    function fun_sum($data,$field){
        $data_sum = array();
        foreach ($data as $key => $value) {
            $data_sum[$key]=$value[$field];
        }
        return array_sum($data_sum);
    }
   
}
