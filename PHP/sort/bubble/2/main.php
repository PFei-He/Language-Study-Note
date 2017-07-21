<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/7/20
 * Time: 下午2:32
 */

function bubbleSort($array) {
    $size = count($array);
    for ($i = 0; $i < $size; $i++) {
        for ($j = 0; $j < $size - 1 - $i; $j++) {
            if ($array[$j + 1] < $array[$j]) {
                swap($array,$j,$j + 1);
            }
        }
    }
    return $array;
}

function swap(&$array, $i, $j) {
    list($array[$i], $array[$j]) = array($array[$j], $array[$i]);
}

$array = array(2, 1, 3, 5, 4);
echo join(' ', bubbleSort($array));
