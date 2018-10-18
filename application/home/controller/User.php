<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 15:42
 */

namespace app\home\controller;


use app\home\model\UserModel;
use app\home\model\UserValidate;

class User extends Base
{
    protected $user;
    protected $userValidate;
    public function __construct()
    {
        $this->needUser=false;
        parent::__construct();
        $this->user=new UserModel();
        $this->userValidate=new UserValidate();
    }

    public function info(){
        if(getUser()){
            return $this->successReturn('success',getUser());
        }else{
            return $this->errorReturn('获取信息失败');
        }
    }

}