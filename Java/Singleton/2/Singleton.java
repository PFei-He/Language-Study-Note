//懒汉式单例类。在第一次调用的时候实例化
public class Singleton {
	//私有的默认构造子
	private singleton() {}

	//此处不需要final关键字
	private static Singleton instance = null;

	//静态工厂方法
	public synchronized static Singleton getInstance() {
		if (instance == null) {
			instance = new singleton();
		}
		return instance;
	}
}

