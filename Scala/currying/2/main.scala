/**
  * Created by fay on 2017/6/1.
  */

object main {
  def main(args: Array[String]): Unit = {
    add(8)(10)
  }

  def add(x: Int) = (y: Int) => {
    println(x + y)
  }
}
