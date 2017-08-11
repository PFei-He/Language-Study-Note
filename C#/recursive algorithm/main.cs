using System;
 
public class M {
	public static void Main() {
	    recursive(0);
	}

	static void recursive(int i) {
	    if (i >= 10) {
	        return;
	    } else {
	        Console.WriteLine(i);
	        i++;
	        recursive(i);
	    }
	}
}
