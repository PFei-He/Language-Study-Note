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

public class main {
	public static void main(String args[]) {

		/**
		 * String
		 */
		String string = "This is a String";

		//.substirng() 从设置的位置开始截取字符串
		System.out.println(string.substring(3));

		/**
		 * StringBuffer
		 */
		StringBuffer stringBuffer = new StringBuffer("This is a String");

		//.append() 拼接字符串
		stringBuffer.append("Buffer");
		System.out.println(stringBuffer);

		//.reverse() 字符串倒序
		//System.out.println(stringBuffer.reverse());

		//.delete(x, y) 从第x个开始删除y个字符
		stringBuffer.delete(0, 5);
		System.out.println(stringBuffer);

		//.insert(x, y) 从第x个开始插入y字符
		stringBuffer.insert(0, "This ");
		System.out.println(stringBuffer);

		//.replace(x, y, z) 从第x个开始到第y个，替换为z字符
		stringBuffer.replace(8, stringBuffer.length(), "my project");
		System.out.println(stringBuffer);
	}
}

