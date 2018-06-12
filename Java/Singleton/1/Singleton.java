//饿汉式单例类。在类初始化时，已经自行实例化
public class Singleton {
	//私有的默认构造子
	private singleton() {}

	//已经自行实例化
	private static final Singleton instance = new singleton();

	//静态工厂方法
	public static Singleton getInstance() {
		return instance;
	}
}

