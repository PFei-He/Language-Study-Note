/**
 * Created by fay on 2017/7/24.
 */

function main() {
    var array = [2, 1, 3, 5, 4];
    console.log(array.quick_sort());
}

Array.prototype.quick_sort = function() {
    var length = this.length;
    if (length <= 1)
        return this.slice(0);
    var left = [];
    var right = [];
    var mid = [this[0]];
    for (var i = 1; i < length; i++)
        if (this[i] < mid[0])
            left.push(this[i]);
        else
            right.push(this[i]);
    return left.quick_sort().concat(mid.concat(right.quick_sort()));
};

main();
