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

