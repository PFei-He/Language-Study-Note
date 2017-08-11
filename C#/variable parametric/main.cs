using System;
 
public class M {
	public static void Main() {
	    print("A", "B", "C");
	}

	static void print(params String[] values) {
	    foreach (String value in values) {
	        Console.WriteLine(value);
	    }
	}
}
