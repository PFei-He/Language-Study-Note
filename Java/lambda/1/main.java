/**
 * Created by fay on 2017/5/8.
 */

public class main {
    public static void main(String args[]) {
        main main = new main();
        main.say((content) -> System.out.println(content));
    }

    void say(Reply reply) {
        reply.r("Hello World!");
    }
}

interface Reply {
    void r(String content);
}
