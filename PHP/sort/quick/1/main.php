<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/7/24
 * Time: 下午2:19
 */

function main() {
    $array = [2, 1, 3, 5, 4];
    echo join(' ', quick_sort($array))."\n";
}

function quick_sort($array) {
    $length = count($array);

    if ($length <= 1)
        return $array;

    $left = $right = array();
    $mid_value = $array[0];

    for ($i = 1; $i < $length; $i++)
        if ($array[$i] < $mid_value)
            $left[] = $array[$i];
        else
            $right[] = $array[$i];

    return array_merge(quick_sort($left), (array)$mid_value, quick_sort($right));
}

main();
