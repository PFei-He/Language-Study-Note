/**
 * Created by fay on 2017/7/24.
 */

public class main {
    public static void main(String args[]) {
        recursive(0);
    }

    static void recursive(Integer i) {
        if (i >= 10) {
            return;
        } else {
            System.out.println(i);
            i++;
            recursive(i);
        }
    }
}
