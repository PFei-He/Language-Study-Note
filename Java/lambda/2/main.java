/**
 * Created by fay on 2017/5/31.
 */

public class main {
    public static void main(String args[]) {
        main main = new main();
        main.say((s) -> {
            System.out.println(s);
            return "Hello Java!";
        });
    }

    void say(Lambda lambda) {
        System.out.println(lambda.function("Hello World!"));
    }
}

interface Lambda {
    String function(String string);
}
