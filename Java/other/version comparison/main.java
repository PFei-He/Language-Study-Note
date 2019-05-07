/**
 * Copyright (c) 2019 faylib.top
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import java.util.ArrayList;

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
