/**
 * Created by fay on 2017/5/25.
 */

fun main(args: Array<String>) {
    say { content: String ->
        println(content)
        "Hello Kotlin!"
    }
}

fun say(reply: (string: String) -> String) {
    println(reply("Hello World!"))
}
