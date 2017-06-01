<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/5/8
 * Time: 下午4:50
 */

 	function add($x) {
       return function ($y) use ($x) {
           return $x + $y;
       } ;
    }

    $addx = add(8);

    echo $addx(10);
