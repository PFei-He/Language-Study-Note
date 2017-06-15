/**
 * Created by fay on 2017/6/15.
 */

function main() {
    say(function (end) {
        console.log("Hello JavaScript!");
        end("^_^");
    })
}

function say(reply) {
    console.log("Hello World!");
    reply(function (content) {
        console.log(content);
    });
}

main();
