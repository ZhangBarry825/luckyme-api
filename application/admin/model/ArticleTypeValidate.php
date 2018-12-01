<?php
/**
 * Created by PhpStorm.
 * User: zhangbin
 * Date: 2018/10/18
 * Time: 14:48
 */

namespace app\admin\model;


use think\Validate;

class ArticleTypeValidate extends Validate
{
    protected $rule=[
        ['id','require','id必须'],
        ['name','require','分类名称必须'],
        ['en_name','require','英文分类名称必须'],
        ['cn_name','require','中文分类名称必须'],
        ['create_time','require','创建时间必须'],
        ['update_time','require','更新时间必须'],
        ['page_num','require','page_num必须'],
        ['page_size','require','page_size必须'],
        ['all','require','all必须'],
    ];
    protected $scene = [
        'createType' => ['create_time','en_name','cn_name'],
        'updateType' => ['id','en_name','cn_name'],
        'deleteType' => ['id'],
        'listType' => ['page_num','page_size','all'],
    ];
}