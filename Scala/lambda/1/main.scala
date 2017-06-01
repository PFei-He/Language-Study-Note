/**
  * Created by fay on 2017/6/1.
  */

object main {
  def main(args: Array[String]): Unit = {
    say(string => {
      println(string)
      "Hello Scala!"
    })
  }

  def say(lambda: (String) => String) = {
    println(lambda("Hello World!"))
  }
}
