<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 16:01
 */

namespace app\admin\controller;


class Upload extends Base
{
    public function __construct()
    {
        parent::__construct();
    }
    public function upload(){
        // 获取表单上传文件
        $file = request()->file('files');
        $config = [
            'size' => 10485760,
            'ext'  => 'jpg,gif,png,jpeg'
        ];
        if (empty($file)) {
            //$this->error('请选择上传文件');
            return $this->errorReturn('请选择上传图片');
        }
        // 移动到框架应用根目录/public/uploads/ 目录下
        $info = $file->validate($config)->move(ROOT_PATH . 'public' . DS . '/static/uploads/');
        if ($info) {
            $path='static/uploads/'.date('Ymd',time()).'/'.$info->getFilename();
            return $this->successReturn('success',$path);
        } else {
            // 上传失败获取错误信息
            return $this->errorReturn($file->getError());
        }
    }
}