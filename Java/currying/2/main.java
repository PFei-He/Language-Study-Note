/**
 * Created by fay on 2017/5/9.
 */

public class main {
    public static void main(String args[]) {
        main m = new main();
        System.out.println(m.add(8).add(10));
    }

    lambda add(int x) {
       return y -> {
           return x + y;
       };
    }
}

interface lambda {
    int add(int y);
}
