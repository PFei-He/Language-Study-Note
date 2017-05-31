/**
 * Created by fay on 2017/5/8.
 */

public class main {
    public static void main(String args[]) {
        main main = new main();
        main.say((s) -> System.out.println(s));
    }

    void say(Lambda lambda) {
        lambda.function("Hello World!");
    }
}

interface Lambda {
    void function(String string);
}
