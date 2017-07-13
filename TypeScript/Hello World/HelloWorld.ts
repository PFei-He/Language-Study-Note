class HelloWorld {
    constructor(public msg : string) {}

    say() {
        return this.msg;    
    }
}

var helloWorld = new HelloWorld("HelloWorld");
console.log(helloWorld.say());
