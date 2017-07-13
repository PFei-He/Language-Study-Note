/**
 * Created by fay on 2017/5/8.
 */

public class main {
    public static void main(String args[]) {
        main m = new main();
        m.say((content) -> System.out.println(content));
    }

    void say(Reply reply) {
        reply.f("Hello World!");
    }
}

interface Reply {
    void f(String string);
}
