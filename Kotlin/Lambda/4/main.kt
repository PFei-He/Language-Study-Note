import sun.awt.shell.ShellFolder.invoke

/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    add(8)(10)
}

fun add(x: Int): (y: Int) -> Unit {
    return { y: Int ->
        println(x + y)
    }
}
