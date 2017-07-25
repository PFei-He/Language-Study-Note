/**
 * Created by fay on 2017/7/20.
 */

function main() {
    var array = [2, 1, 3, 5, 4];
    console.log(array.bubble_sort());
}

Array.prototype.bubble_sort = function() {
    var i, j, temp;
    for (i = 0; i < this.length - 1; i++)
        for (j = 0; j < this.length - 1 - i; j++)
            if (this[j] > this[j + 1]) {
                temp = this[j];
                this[j] = this[j + 1];
                this[j + 1] = temp;
            }
    return this;
};

main();
