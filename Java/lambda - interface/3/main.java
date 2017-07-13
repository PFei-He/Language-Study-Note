/**
 * Created by fay on 2017/5/31.
 */

public class main {
    public static void main(String args[]) {
        main m = new main();
        m.say(content -> {
            System.out.println(content);
            return "Hello Java!";
        });
    }

    void say(Reply reply) {
        System.out.println(reply.f("Hello World!"));
    }
}

interface Reply {
    String f(String string);
}
