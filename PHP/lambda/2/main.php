<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/5/31
 * Time: 下午3:47
 */

    function main() {
        say(function ($v) {
            echo $v;
            return "Hello PHP!\n";
        });
    }

    function say($lambda) {
        echo $lambda("Hello World!\n");
    }

    main();
