var HelloWorld = (function () {
    function HelloWorld(msg) {
        this.msg = msg;
    }
    HelloWorld.prototype.say = function () {
        return this.msg;
    };
    return HelloWorld;
}());
var helloWorld = new HelloWorld("HelloWorld");
console.log(helloWorld.say());
