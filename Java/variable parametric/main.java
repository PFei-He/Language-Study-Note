/**
 * Created by fay on 2017/8/3.
 */

public class main {
    public static void main(String args[]) {
        print("A", "B", "C");
    }

    static void print(String ... values) {
        for (String v : values) {
            System.out.println(v);
        }
    }
}
