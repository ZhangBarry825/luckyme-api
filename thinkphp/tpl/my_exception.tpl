<?php
header("Content-type:text/html;charset=utf-8");
    if(!function_exists('parse_file')){
        function parse_file($file, $line)
        {
            return basename($file)." line {$line}";
        }
    }

    $file_line=sprintf('%s',parse_file($file,$line));
    $main=$message;

    $arr=[
       'msg' => '服务器内部错误',
        'data' =>[
            'file_line' => $file_line,
            'main' => $main,
        ],
        'code'=> 401,
     ];
echo json_encode($arr);
?>