/**
 * Created by fay on 2017/6/1.
 */

function main() {
    say(function (string) {
        console.log(string);
        return "Hello JavaScript!";
    })
}

function say(closure) {
    console.log(closure("Hello World!"));
}

main();
