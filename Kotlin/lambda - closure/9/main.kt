/**
 * Created by fay on 2017/6/15.
 */

fun main(args: Array<String>) {
    say { end ->
        println("Hello Kotlin!")
        end("^_^")
    }
}

fun say(reply: ((end: String) -> Unit) -> Unit) {
    println("Hello World!")
    reply { content ->
        println(content)
    }
}
