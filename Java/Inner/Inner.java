import java.util.*;

interface Interface {
	public void function();
}

public class Inner {
	public static void main(String args[]) {
		Interface interface = new Interface() {
			public void function() {
				System.out.println("function run");
			}
		};
		interface.function();
	}
}
