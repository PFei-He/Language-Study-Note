<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/5/31
 * Time: 下午3:47
 */

function main() {
    say(function ($content) {
        echo $content;
        return "Hello PHP!\n";
    });
}

function say($reply) {
     echo $reply("Hello World!\n");
}

main();
