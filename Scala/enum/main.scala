/**
  * Created by fay on 2017/8/1.
  */

object main {
  object Color extends Enumeration {
    val RED, ORANGE, YELLOW, GREEN, CYAN, BLUE, PURPLE = Value
  }

  def main(args: Array[String]): Unit = {
    println(Color.CYAN)
  }
}
