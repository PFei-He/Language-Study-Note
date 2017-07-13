/**
  * Created by fay on 2017/6/2.
  */

object main {
  def main(args: Array[String]): Unit = {
    say(content => {
      println(content)
      return "Hello Scala!"
    })
  }

  def say(reply: (String) => String): Unit = {
    println(reply("Hello World!"))
  }
}
