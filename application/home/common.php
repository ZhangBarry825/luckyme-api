<?php
use think\exception\HttpResponseException;

function throwError($message, $code = 400)
{
    $messageObj = [
        'msg' => $message,
        'data' => '',
        'code' => $code
    ];
    throw new HttpResponseException(json($messageObj));
}

