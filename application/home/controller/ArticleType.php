<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 14:46
 */

namespace app\home\controller;

use app\home\model\ArticleTypeModel;
use app\home\model\ArticleTypeValidate;

class ArticleType extends Base
{
    protected $artType;
    protected $artTypeValidate;
    public function __construct()
    {
        parent::__construct();
        $this->artType = new ArticleTypeModel();
        $this->artTypeValidate = new ArticleTypeValidate();
    }

    public function listType(){
        $rec=$_GET;
        $res=$this->artTypeValidate->check($rec,'','listType');
        if($res){
            $result=$this->artType->order('update_time desc')->select();
            $count=count($this->artType->order('update_time desc')->select());
            if($result){
                $r=[
                    'total'=>$count,
                    'types'=>$result
                ];
                return $this->successReturn('success',$r);
            }else if(empty($result)){
                return $this->successReturn('success',[]);
            }else{
                return $this->errorReturn($this->artType->getError());
            }
        }else{
            return $this->errorReturn($this->artTypeValidate->getError());
        }
    }

}