<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 15:42
 */

namespace app\admin\controller;


use app\admin\model\UserModel;
use app\admin\model\UserValidate;

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
    public function login(){
        if(isset($_POST['username'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode($request_data,true);
        }
        $res = $this->userValidate->check($rec, '', 'login');
        if ($res) {
            $rec['password']=md5($rec['password']);
            $result=$this->user->where('username','=',$rec['username'])->where('password','=',$rec['password'])->field('name,roles')->find();
            if($result){
                session('user',$result);
                return $this->successReturn("success",$result);
            }else{
                return $this->errorReturn('账号或密码错误！');
            }
        } else {
            return $this->errorReturn($this->userValidate->getError());
        }
    }
    public function updatepwd(){
        if(isset($_POST['old_password'])){
            $rec = $_POST;
        }else{
            $request_data = file_get_contents ('php://input');
            $rec = json_decode ($request_data,true);
        }
        $res = $this->userValidate->check($rec, '', 'updatePwd');
        if($res){
            $rec['old_password']=md5($rec['old_password']);
            $result=$this->user->where('username','=','admin')->where('password','=',$rec['old_password'])->field('name,roles')->find();
            if($result){
                $data['password']=md5($rec['new_password']);
                $result2=$this->user->where('username','=','admin')->update($data);
                if($result2){
                    return $this->successReturn('success');
                }else{
                    return $this->errorReturn('新旧密码不能一致！');
                }
            }else{
                return $this->errorReturn('原密码错误！');
            }
        }else{
            return $this->errorReturn($this->userValidate->getError());
        }
    }
    public function logout(){
        unsetUser();
        return $this->successReturn();
    }
    public function info(){
        if(getUser()){
            return $this->successReturn('success',getUser());
        }else{
            return $this->errorReturn('获取信息失败');
        }
    }
}