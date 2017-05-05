/**
 * Created by fay on 2017/5/3.
 */

//$ node main.js

var stdin = process.openStdin();
stdin.addListener("data", function(input) {
    // note:  input is an object, and when converted to a string it will
    // end with a linefeed.  so we (rather crudely) account for that
    // with toString() and then trim()
    console.log(input.toString().trim());
    process.exit(0);
});


// var readline = require('readline');
// var rl = readline.createInterface(process.stdin, process.stdout);
// rl.setPrompt('guess> ');
// rl.prompt();
// rl.on('line', function(line) {
//     if (line === "right") rl.close();
//     rl.prompt();
// }).on('close',function(){
//     process.exit(0);
// });
