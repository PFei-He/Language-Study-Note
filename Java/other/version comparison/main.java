import java.util.ArrayList;

/**
 * Created by fay on 2017/8/31.
 */

public class main {
    public static void main(String args[]) {
        main m = new main();
        System.out.println(m.versionComparison("0.0.21", "1.0.0"));
    }

    /* 版本对比 */
    private Boolean versionComparison(String currentVersion, String serverVersion) {
        ArrayList<String> currentVersionArray = separateString(currentVersion);
        ArrayList<String> serverVersionArray = separateString(serverVersion);
        for (int i = 0; i < serverVersionArray.size(); i++) {
            if(i > (currentVersionArray.size() - 1)){
                return true;
            } else if (Integer.valueOf(serverVersionArray.get(i)) > Integer.valueOf(currentVersionArray.get(i))) {
                return true;
            } else if (Integer.valueOf(serverVersionArray.get(i)) < Integer.valueOf(currentVersionArray.get(i))) {
                return false;
            }
        }
        return false;
    }

    /* 分离字符 */
    private ArrayList<String> separateString(String string) {
        string = replaceString(string, 2);
        ArrayList<String> arrayList = new ArrayList<>();
        for (int i = 0; i < string.length(); i++) {
            arrayList.add(Character.toString(string.charAt(i)));
        }
        return arrayList;
    }

    /* 替换字符 */
    private String replaceString(String string, int count) {
        if (count < 1) {
            return string;
        }
        string = string.replace(".", "");
        count--;
        return replaceString(string, count);
    }
}
