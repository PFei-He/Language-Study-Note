<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/7/20
 * Time: 下午2:32
 */

function bubble_sort(&$array) {
    for ($i = 0; $i < count($array) - 1; $i++)
        for ($j = 0; $j < count($array) - 1 - $i; $j++)
            if ($array[$j] > $array[$j + 1])
                swap($array[$j], $array[$j + 1]);
    return $array;
}

function swap(&$i, &$j) {
    $temp = $i;
    $i = $j;
    $j = $temp;
}

$array = array(2, 1, 3, 5, 4);
echo join(' ', bubble_sort($array))."\n";
