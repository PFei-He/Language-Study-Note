/**
 * Created by fay on 2017/6/14.
 */

public class main {
    public static void main(String[] args) {
        main m = new main();
        m.say(end -> {
            System.out.println("Hello Java!");
            end.f("^_^");
        });
    }

    void say(Reply reply) {
        System.out.println("Hello World!");
        reply.f(content -> {
            System.out.println(content);
        });
    }
}

interface End {
    void f(String string);
}

interface Reply {
    void f(End end);
}
