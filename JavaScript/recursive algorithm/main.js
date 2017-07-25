/**
 * Created by fay on 2017/7/24.
 */

function main() {
    recursive(0);
}

function recursive(i) {
    if (i >= 10) {
        return 0;
    } else {
        console.log(i);
        i++;
        recursive(i);
    }
}

main();
