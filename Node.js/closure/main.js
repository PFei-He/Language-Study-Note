/**
 * Created by fay on 2017/5/8.
 */

function add(x) {
    return function (y) {
        return x + y;
    }; 
}

addx = add(8);

console.log(addx(10));
