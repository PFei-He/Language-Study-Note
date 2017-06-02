/**
 * Created by fay on 2017/6/2.
 */

fun main(args: Array<String>) {
    say { content: String ->
        println(content)
        return@say "Hello Kotlin!"
    }
}

fun say(reply: (String) -> String) {
    println(reply("Hello World!"))
}
