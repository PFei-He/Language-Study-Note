/**
 * Created by fay on 2017/6/1.
 */

function main() {
    say(function (content) {
        console.log(content);
        return "Hello JavaScript!";
    })
}

function say(reply) {
    console.log(reply("Hello World!"));
}

main();
