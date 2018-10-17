<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/15
 * Time: 15:45
 */

namespace app\admin\model;


use think\Validate;

class UserValidate extends Validate
{
    protected $rule=[
        ['username','require','账号必须'],
        ['password','require','密码必须'],
        ['old_password','require','原密码必须'],
        ['new_password','require','新密码必须']
    ];
    protected $scene = [
        'login' => ['username','password'],
        'updatePwd'=>['new_password','old_password'],
        'updateInfo'=>[]
    ];
}