/**
  * Created by fay on 2017/8/3.
  */

object main {
  def main(args: Array[String]): Unit = {
    print("A", "B", "C")
  }

  def print(values: String *): Unit = {
    for (v <- values) {
      println(v)
    }
  }
}
