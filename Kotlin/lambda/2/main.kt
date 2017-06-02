/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    say {
        println(it)
    }
}

fun say(reply: (string: String) -> Unit) {
    reply("Hello World!")
}
