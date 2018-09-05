/**
 * Copyright (c) 2018 faylib.top
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
        int[] array = {2, 1, 3, 5, 4};
        ArrayList<Integer> arrayList = new ArrayList<Integer>();
        for (int v: array) {
            arrayList.add(v);
        }
        System.out.println(quickSort(arrayList));
    }

    private static ArrayList<Integer> quickSort(ArrayList<Integer> array) {
        if (array.size() <= 1) {
            return array;
        }

        int pivot = array.get(0);
        ArrayList<Integer> left = new ArrayList<Integer>();
        ArrayList<Integer> right = new ArrayList<Integer>();

        for (int v: array) {
            if (v < pivot) {
                left.add(v);
            } else if (v > pivot) {
                right.add(v);
            }
        }

        ArrayList<Integer> result = new ArrayList<Integer>();

        for (int i = 0; i < left.size(); i++) {
            result.add(quickSort(left).get(i));
        }

        result.add(pivot);

        for (int i = 0; i < right.size(); i++) {
            result.add(quickSort(right).get(i));
        }

        return result;
    }
}
