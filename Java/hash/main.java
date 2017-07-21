import java.util.HashMap;

/**
 * Created by fay on 2017/7/19.
 */

public class main {
    public static void main(String args[]) {
        HashMap hashMap = new HashMap();
        hashMap.put("A", 1);
        hashMap.put("B", 2);
        hashMap.put("C", 3);
        System.out.println(hashMap);
        System.out.println(hashMap.get("A"));
        System.out.println(hashMap.get("B"));
        System.out.println(hashMap.get("C"));
    }
}
