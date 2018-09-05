<?php
namespace Admin\Event;
use Think\Controller;
/**
 * 后台事件控制器
 * @author 王贺 
 */
class RechargeEvent extends ThinkEvent {

    public function lists($model=null){
        //parent::join_more($model);
    }

    public function user_join($model = null, $p = 0){
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据

        //解析列表规则
        $fields = $model['fields'];
        // 关键字搜索
        $map    = empty($model['map'])?array():$model['map'];
        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
            $map['pay_time']  =  array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
            unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }
        // 条件搜索
        foreach($_REQUEST as $name=>$val){
            switch ($name) {
                case 'account':
                    $map['tab_recharge.user_account']  =   array('like','%'.$val.'%');
                    break;
                case 'game_id':
                    $map['tab_game.id']  =  $val;
                    break;
                case 'promote_id':
                    $map['tab_recharge.promote_id']  =  $val;
                    break;
                case 'pay_status':
                    $map['tab_recharge.pay_status']  =  $val;
                    break;
                case 'pay_way':
                    $map['pay_way']  =  $val;
                    break;
            }
        }
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        //读取模型数据列表
        $name = $model['m_name'];
        $new_model = D($name);
        $data = D($name)
            ->field('tab_recharge.*,tab_game.id,tab_game.game_name,tab_promote.id,tab_promote.account')
            ->join('left join tab_game ON tab_recharge.game_appid = tab_game.game_appid')
            ->join('left join tab_promote ON tab_recharge.promote_id = tab_promote.id')
            // 查询条件
            ->where($map)
            /* 默认通过id逆序排列 */
            ->order($order)
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count =D($name)
            ->field('tab_recharge.*,tab_game.id,tab_game.game_name,tab_promote.id,tab_promote.account')
            ->join('left join tab_game ON tab_recharge.game_appid = tab_game.game_appid')
            ->join('left join tab_promote ON tab_recharge.promote_id = tab_promote.id')
            ->where($map)->count();
         //分页
        if($count > $row){
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $this->assign('model', $model);
        $this->assign('list_data', $data);
        $this->meta_title = $model['title'].'列表';
        $this->display($model['template_list']);
    }

    public function group_list($model = null,$p){
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据

        //解析列表规则
        $fields = $model['fields'];
        // 关键字搜索
        $map    =   array();
        $map['tab_recharge.pay_status'] = 1;
        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
            $map['pay_time']  =  array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
            unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }
        // 条件搜索
        foreach($_REQUEST as $name=>$val){
            switch ($name) {
                case 'account':
                    $map['tab_recharge.user_account']  =   array('like','%'.$val.'%');
                    break;
                case 'game_id':
                    $map['tab_game.id']  =  $val;
                    break;
                case 'promote_id':
                    $map['tab_recharge.promote_id']  =  $val;
                    break;
            }
        }
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];

        //读取模型数据列表
        $name = $model['m_name'];
        $new_model = D($name);
        $data = D($name)
            ->field('tab_recharge.*,case parent_id  when 0 then promote_id else parent_id end AS parent_id,sum(pay_amount) AS total_amount,DATE_FORMAT( FROM_UNIXTIME(pay_time),"%Y-%m-%d") AS period')
            ->join('left join tab_promote ON tab_recharge.promote_id = tab_promote.id') 
            // 查询条件
            ->where($map)
            /* 默认通过id逆序排列 */
            ->order($model['order'])
            //根据字段分组
            ->group($model['group'])
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count = count($data);
         //分页
        if($count > $row){
            $page = new \Think\Page($count, $row);
            $page->setConfig('theme','%FIRST% %UP_PAGE% %LINK_PAGE% %DOWN_PAGE% %END% %HEADER%');
            $this->assign('_page', $page->show());
        }
        $this->assign('model', $model);
        $this->assign('list_data', $data);
        $this->meta_title = $model['title'].'列表';
        $this->display($model['template_list']);
    }

    public function extend_edit($model=null,$id=null,$data=null){
        $id || $this->error("请选择要编辑的数据");

        parent::extend_edit($model,$id,$data);
    }
}
