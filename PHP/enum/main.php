<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/8/1
 * Time: 下午4:56
 */

class Color extends SplEnum {
    const RED = 0;
    const ORANGE = 1;
    const YELLOW = 2;
    const GREEN = 3;
    const CYAN = 4;
    const BLUE = 5;
    const PURPLE = 6;
}

function main() {
    echo Color::CYAN;
}

main();
