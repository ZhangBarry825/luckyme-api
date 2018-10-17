<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 15:37
 */

namespace app\admin\controller;


use think\Controller;

class Base extends Controller
{
    protected $userInfo;
    protected $needUser = true;

    public function __construct()
    {
        parent::__construct();
        if ($this->needUser) {
            $this->userInfo = getUser();
            if ($this->userInfo === false) {
                throwError('请重新登录', 401);
            }
        }
    }

    public function errorReturn($msg = 'error', $data = '', $code = 400)
    {
        $res['msg'] = $msg;
        $res['data'] = $data;
        $res['code'] = $code;
        return json($res);
    }

    public function successReturn($msg = 'success', $data = '', $code = 200)
    {
        $res['msg'] = $msg;
        $res['data'] = $data;
        $res['code'] = $code;
        return json($res);
    }
}