/**
 * Created by fay on 2017/5/31.
 */

public class main {
    public static void main(String args[]) {
        main main = new main();
        main.say((content) -> {
            System.out.println(content);
            return "Hello Java!";
        });
    }

    void say(Reply reply) {
        System.out.println(reply.r("Hello World!"));
    }
}

interface Reply {
    String r(String content);
}
