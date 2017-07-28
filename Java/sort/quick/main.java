import java.util.ArrayList;

/**
 * Created by fay on 2017/7/27.
 */

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
