/**
  * Created by fay on 2017/7/24.
  */

object main {
  def main(args: Array[String]): Unit = {
    recursive(0)
  }

  def recursive(i: Int): Unit = {
    var j = i
    if (j >= 10) {
      0
    } else {
      println(j)
      j += 1
      recursive(j)
    }
  }
}
