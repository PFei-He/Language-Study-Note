/**
  * Created by fay on 2017/6/15.
  */

object main {
  def main(args: Array[String]): Unit = {
    say(end => {
      println("Hello Scala!")
      end("^_^")
    })
  }

  def say(reply: ((String) => Unit) => Unit) = {
    println("Hello World!")
    reply { content =>
      println(content)
    }
  }
}
