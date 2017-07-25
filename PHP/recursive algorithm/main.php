<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/7/24
 * Time: 上午10:51
 */

function main() {
    recursive(0);
}

function recursive($i) {
    if ($i >= 10) {
        return;
    } else {
        echo "$i\n";
        $i++;
        recursive($i);
    }
}

main();
