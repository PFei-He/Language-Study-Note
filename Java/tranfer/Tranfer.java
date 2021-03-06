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

import java.util.*;

public class Tranfer {
	public static void main(String args[]) {

		/*
		 * List -> 数组
		 */
		List<String> list = new ArrayList<String>();
		list.add("a");
		list.add("b");
		list.add("c");

		//返回Object数组
		Object object[] = list.toArray();
		//System.out.println(Arrays.toString(object));

		String string1[] = new String[list.size()];

		//将转化后的数组放入已经创建好的对象中
		list.toArray(string1);
		System.out.println(Arrays.toString(string1));

		//将转化后的数组赋给新对象
		String string2[] = list.toArray(new String[0]);
		System.out.println(Arrays.toString(string2));



		/**
		 * 数组 -> List
		 */
		String string3[] = {"a", "b", "c"};
		List<String> list1 = Arrays.asList(string3);
		List<String> list2 = Arrays.asList("A", "B", "C");
		System.out.println(list1);
		System.out.println(list2);



		/**
  		 * List -> Set
		 */
		List<String> list3 = new ArrayList<String>(new HashSet<String>());
		System.out.println(list3.toString());



		/**
		 * Set -> List
		 */
		Set<String> set = new HashSet<String>(new ArrayList<String>());
		System.out.println(set.toString());



		/**
		 * 数组 -> Set
		 */
		String string4[] = {"a", "b", "c"};
		Set<String> set2 = new HashSet<String>(Arrays.asList(string4));
		System.out.println(string4.toString());



		/**
		 * Set -> 数组
		 */
		Set<String> set3 = new HashSet<String>(Arrays.asList("a", "b", "c"));
		String string5[] = new String[set3.size()];
		set3.toArray(string5);
		System.out.println(Arrays.toString(string5));



		/**
		 * Map -> Set
		 */
		Map<String, String> map = new HashMap<String, String>();
		map.put("a", "A");
		map.put("b", "B");
		map.put("c", "C");

		//将key转化为Set
		Set<String> mapKeySet = map.keySet();
		System.out.println(mapKeySet);

		//将value转化为Set
		Set<String> mapValuesSet = new HashSet<String>(map.values());
		System.out.println(mapValuesSet);

		//将value转化为List
		List<String> mapValuesList = new ArrayList<String>(map.values());
		System.out.println(mapValuesList);
	}
}
