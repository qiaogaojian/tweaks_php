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
class StatisticsEvent extends Controller {

    /**
    *充值统计
    */
    public function recharge_statistics(){
        $model_name = "recharge";
        $serach_field = "pay_time";
        $field = "sum(pay_amount) as amount";
        $group="pay_way";
        $order="pay_way ASC";

        $last_month_amount = $this->last_month_data($model_name,$serach_field,$field,$group,$order);
        $last_month_total  = array_sum(array($last_month_amount[0]["pay_amount"],$last_month_amount[1]["pay_amount"]));
        $last_data = array($last_month_amount[1]["pay_amount"],$last_month_amount[0]["pay_amount"],$last_month_total);

        $this_month_amount = $this->this_month_data($model_name,$serach_field,$field,$group,$order);
        $this_month_total  = array_sum(array($this_month_amount[0]["pay_amount"],$this_month_amount[1]["pay_amount"]));
        $this_data = array($this_month_amount[1]["amount"],$this_month_amount[0]["amount"],$this_month_total);

        $this->assign("recharge_last_data",$last_data);
        $this->assign("recharge_this_data",$this_data);
    }
    /**
    *注册统计
    */
    public function register_statistics(){
        $model_name = "User";
        $serach_field = "register_time";
        $field = "count(id) as counts,register_way";
        $group="register_way";
        $order="register_way ASC";

        $last_month = $this->last_month_data($model_name,$serach_field,$field,$group,$order);
        $last_month_total  = array_sum(array($last_month[0]["counts"],$last_month[1]["counts"]));
        $last_data = array(
            $last_month[1]["counts"],
            $last_month[0]["counts"],
            $last_month_total
        );

        $this_month = $this->this_month_data($model_name,$serach_field,$field,$group,$order);

        $this_month_total  = array_sum(array($this_month[0]["counts"],$this_month[1]["counts"]));
        $this_data = array(
            $this_month[1]["counts"],
            $this_month[0]["counts"],
            $this_month_total
        );

        
        $this->assign("reg_last_data",$last_data);
        $this->assign("reg_this_data",$this_data);
    }

    /**
    *本年总充值
    */
    public function recharge_statistics_year(){
        $model_name = "recharge";
        $serach_field = "pay_time";
        $field = "sum(pay_amount) as amount";
        $group="FROM_UNIXTIME(pay_time,'%Y%m%d')";
        $order="pay_time ASC";
        $map["pay_status"]=1;                        
        $year_total = $this->data_year($model_name,$map,$serach_field,$field,$group,$order);

        $map["promote_id"] = array("neq","null");
        $year_promote = $this->data_year($model_name,$map,$serach_field,$field,$group,$order,$where);
        $this->assign("year_total",$year_total);
        $this->assign("year_promote",$year_promote);
    }

    /**
    *本年总注册
    */
    public function register_statistics_year(){
        $model_name = "User";
        $serach_field = "register_time";
        $field = "count(id) as counts";
        $group="DATE_FORMAT(register_time,'%m')";
        $order="register_time ASC";
        $last_data = $this->user_data_year($model_name,$map,$serach_field,$field,$group,$order);
        //$map["prmoote_id"] = array("neq","null");
        $this_data = $this->user_data_year($model_name,$map,$serach_field,$field,$group,$order);

        $this->assign("reg_data_year",$last_data);
        $this->assign("prom_data_year",$this_data);
    }

    /**
    *上月数据 
    */
    public function last_month_data($model_name,$serach_field,$field=true,$group="",$order=""){
        $last_month_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m")-1,1,date("Y"))));
        $last_month_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m") ,0,date("Y")))) ;
        
        $map[$serach_field] = array("BETWEEN",array($last_month_start,$last_month_end));
        $model = D($model_name);
        $data = $model->field($field)->where($map)->group($group)->order($order)->select();
        return $data;
    }

    /**
    *本月数据
    */
    protected function this_month_data($model_name,$serach_field,$field=true,$group="",$order=""){
        $this_month_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,date("m"),1,date("Y"))));
        $this_month_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,date("m"),date("t"),date("Y"))));
        $map[$serach_field] =array("BETWEEN",array($this_month_start,$this_month_end));
        $model = D($model_name);
        $data = $model->field($field)->where($map)->group($group)->order($order)->select();
        return $data;
    }

    /**
    *本年数据 根据月份分组
    */
    protected function data_year($model_name,$map,$serach_field,$field=true,$group="",$order=""){
        $this_year_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,1,1,date("Y"))));
        $this_year_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,12,31,date("Y"))));
        $map[$serach_field] =array("BETWEEN",array($this_year_start,$this_year_end));
        $model = D($model_name);
        $data = $model->field($field)->where($map)->group($group)->order($order)->select();
        return $data;
        
    }

    protected function user_data_year($model_name,$map,$serach_field,$field=true,$group="",$order="",$where="")
    {
        $this_year_start =strtotime(date("Y-m-d H:i:s",mktime(0, 0 , 0,1,1,date("Y"))));
        $this_year_end   =strtotime(date("Y-m-d H:i:s",mktime(23,59,59,12,31,date("Y"))));
        $map[$serach_field] =array("BETWEEN",array($this_year_start,$this_year_end));
        $model = D($model_name);
        $data  = $model->field($field)->where($map)->group($group)->order($order)->select();
        //return $model->getlastsql();
        return $data;
    }
   
}
