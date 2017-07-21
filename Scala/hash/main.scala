/**
  * Created by fay on 2017/7/17.
  */

object main {
  def main(args: Array[String]): Unit = {
    val hashMap = mutable.HashMap("A" -> 1, "B" -> 2, "C" -> 3)
    println(hashMap)
    println(hashMap("A"))
    println(hashMap("B"))
    println(hashMap("C"))
  }
}
