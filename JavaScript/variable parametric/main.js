/**
 * Created by fay on 2017/8/1.
 */

function main() {
    print("A", "B", "C");
}

function print() {
    for (var v in arguments) {
        console.log(arguments[v]);
    }
}

main();
