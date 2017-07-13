<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/7/13
 * Time: 下午5:45
 */

$array = array(
    'A' => '1',
    "B" => "2",
    C => "3",
);

// 自 PHP 5.4 起
//    $array = [
//        'A' => '1',
//        "B" => "2",
//        C => "3",
//    ];

echo $array['A']."\n";
echo $array["B"]."\n";
echo $array[C]."\n";
