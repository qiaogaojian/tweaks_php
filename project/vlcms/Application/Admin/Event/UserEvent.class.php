<?php
namespace Admin\Event;
use Think\Controller;
/**
 * 后台事件控制器
 * @author 王贺 
 */
class UserEvent extends ThinkEvent {

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
        $map    =  $model['map']; //array();
        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
            $map['login_time']  =  array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
            unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }

        foreach ($key as $key => $value) {
            if(isset($_REQUEST[$value])){
                $map[$value]  =   array('like','%'.$_GET[$value].'%');
                unset($_REQUEST[$value]);
            }
        }
        // 条件搜索
        foreach($_REQUEST as $name=>$val){
            if(in_array($name,$fields)){
                $map[$name] =   $val;
            }
        }

        $row    = empty($model['list_row']) ? 10 : $model['list_row'];

        //读取模型数据列表
        $name = $model['m_name'];
        //$new_model = D($name);
        $data = D($name)
            ->field('tab_user.*,tab_game.id as game_id,tab_game.game_name as game_name,tab_promote.id as promote_id,tab_promote.account as p_account')
            ->join('tab_user_play ON tab_user.id = tab_user_play.user_id','LEFT')
            ->join('tab_game ON tab_user_play.game_appid = tab_game.game_appid','LEFT')
            ->join('tab_promote ON tab_user_play.promote_id = tab_promote.id','LEFT')
            // 查询条件
            ->where($map)
            /* 默认通过id逆序排列 */
            ->order($model['order'])
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count = D($name)
            ->field('tab_user.*,tab_game.id as game_id,tab_game.game_name as game_name,tab_promote.id as promote_id,tab_promote.account as p_account')
            ->join('tab_user_play ON tab_user.id = tab_user_play.user_id','LEFT')
            ->join('tab_game ON tab_user_play.game_appid = tab_game.game_appid','LEFT')
            ->join('tab_promote ON tab_user_play.promote_id = tab_promote.id','LEFT')
            // 查询条件
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

        public function user_joinz($model = null, $p = 0){
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据

        //解析列表规则
        $fields = $model['fields'];
        // 关键字搜索
        $map    =  $model['map']; //array();
        if(isset($_REQUEST['time-start']) && isset($_REQUEST['time-end'])){
            $map['login_time']  =  array('BETWEEN',array(strtotime($_REQUEST['time-start']),strtotime($_REQUEST['time-end'])));
            unset($_REQUEST['time-start']);unset($_REQUEST['time-end']);
        }

        foreach ($key as $key => $value) {
            if(isset($_REQUEST[$value])){
                $map[$value]  =   array('like','%'.$_GET[$value].'%');
                unset($_REQUEST[$value]);
            }
        }
        // 条件搜索
        foreach($_REQUEST as $name=>$val){
            if(in_array($name,$fields)){
                $map[$name] =   $val;
            }
        }
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        //读取模型数据列表
        $name = $model['m_name'];
        //$new_model = D($name);
        $data = D($name)
            // 查询条件
            ->where($map)
            /* 默认通过id逆序排列 */
            ->order($model['order'])
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count = D($name)
            // 查询条件
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


    public function user_mend($model,$p){
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据
        // 关键字搜索
        $map    =   $model['map'];
        
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        
        //读取模型数据列表
        $name = $model['m_name'];
        $new_model = D($name);
        $data = D($name)
            ->field('tab_user_play.*,tab_user.account,tab_user.login_time,tab_user.login_ip,tab_game.id,tab_game.game_name')
            ->join('left join tab_user ON tab_user_play.user_id = tab_user.id')
            ->join('left join tab_game ON tab_user_play.game_appid = tab_game.game_appid')
            // 查询条件
            ->where($map)
            ->group($model['group'])
            /* 默认通过id逆序排列 */
            ->order($model['order'])
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count = D($name)
            ->field('tab_user_play.*,tab_user.account,tab_user.login_time,tab_user.login_ip,tab_game.game_name')
            ->join('left join tab_user ON tab_user_play.user_id = tab_user.id')
            ->join('left join tab_game ON tab_user_play.game_appid = tab_game.game_appid')
            // 查询条件
            ->where($map)
            ->group($model['group'])
            ->count();


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

       public function user_mendlist($model,$p){
        $model || $this->error('模型名标识必须！');
        $page = intval($p);
        $page = $page ? $page : 1; //默认显示第一页数据
        // 关键字搜索
        $map    =   $model['map'];        
        $row    = empty($model['list_row']) ? 10 : $model['list_row'];
        //读取模型数据列表
        $name = $model['m_name'];
        $new_model = D($name);
        $data = D($name)
            // 查询条件
            ->where($map)
            /* 默认通过id逆序排列 */
            ->order($model['order'])
            /* 数据分页 */
            ->page($page, $row)
            /* 执行查询 */
            ->select();
        /* 查询记录总数 */
        $count = D($name)
            // 查询条件
            ->where($map)
            ->count();
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

    public function user_join_entity($id=null){
        $map['tab_user_play.user_id'] = $id;
        $data = D('Play')
            ->field(' tab_user_play.*,tab_user.account,tab_user.login_time,tab_user.login_ip,tab_game.game_name')
            ->join('left join tab_user ON tab_user_play.user_id = tab_user.id')
            ->join('left join tab_game ON tab_user_play.game_appid = tab_game.game_appid')
            // 查询条件
            ->where($map)
            /* 执行查询 */
            ->find();
        $this->assign('data',$data);
    }

    public function user_entity($id=null){
        $map['tab_user.id'] = $id;
        $data = D('User')
            ->field(' tab_user.*,tab_user.account,tab_user.login_time,tab_user.login_ip,tab_game.id as game_id,promote_id')
            ->join('tab_user_play ON tab_user_play.user_id = tab_user.id','LEFT')
            ->join('tab_game ON tab_user_play.game_appid = tab_game.id','LEFT')
            // 查询条件
            ->where($map)
            /* 执行查询 */
            ->find();
        $this->assign('data',$data);
    }

    public function extend_edit($model=null,$id=null,$data=null){
        $id || $this->error("请选择要编辑的数据");

        parent::extend_edit($model,$id,$data);
    }
}
