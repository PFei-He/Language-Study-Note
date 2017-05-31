import sun.awt.shell.ShellFolder.invoke

/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    println(add(8)(10))
}

fun add(x: Int): (y: Int) -> Int {
    return { y: Int ->
        x + y
    }
}
