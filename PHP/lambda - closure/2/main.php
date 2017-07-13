<?php
/**
 * Created by IntelliJ IDEA.
 * User: fay
 * Date: 2017/6/15
 * Time: 下午2:15
 */

function main() {
    say(function ($end) {
        echo "Hello PHP!\n";
        $end("^_^");
    });
}

function say($reply) {
    echo "Hello World!\n";
    $reply(function ($content) {
        echo $content;
    });
}

main();
