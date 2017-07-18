using System;
 
public class M {
	public static void Main() {
	    M m = new M();
	    Console.WriteLine(m.add(8)(10));
	}

	Lambda add(int x) {
	    return y => {
	        return x+y;
	    };
	}

	delegate int Lambda(int y);
}
