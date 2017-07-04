/**
 * Created by fay on 2017/5/8.
 */

function add(x) {
    return function (y) {
        return x + y;
    }; 
}

console.log(add(8)(10));
