/**
  * Created by fay on 2017/6/1.
  */

object main {
  def main(args: Array[String]): Unit = {
    say(content => {
      println(content)
      "Hello Scala!"
    })
  }

  def say(reply: (String) => String) = {
    println(reply("Hello World!"))
  }
}
