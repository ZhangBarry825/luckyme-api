<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 14:48
 */

namespace app\home\model;


use think\Validate;

class ArticleTypeValidate extends Validate
{
    protected $rule=[
        ['id','require','id必须'],
        ['name','require','分类名称必须'],
        ['create_time','require','创建时间必须'],
        ['update_time','require','更新时间必须']
    ];
    protected $scene = [
        'createType' => ['name','create_time'],
        'updateType' => ['id','name','update_time'],
        'deleteType' => ['id'],
        'listType' => [''],
    ];
}