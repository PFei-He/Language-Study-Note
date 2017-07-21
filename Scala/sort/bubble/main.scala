/**
  * Created by fay on 2017/7/20.
  */

object main {
  def main(args: Array[String]): Unit = {
    var array = Array(2, 1, 3, 5, 4)
    println(bubbleSort(array.toList))
  }

  def bubbleSort[A <% Ordered[A]](list: List[A]): List[A] = {
    def sort(as: List[A], bs: List[A]): List[A] =
      if (as.isEmpty) bs
      else bubble(as, Nil, bs)

    def bubble(as: List[A], zs: List[A], bs: List[A]): List[A] = as match {
      case h1 :: h2 :: t =>
        if (h1 > h2) bubble(h1 :: t, h2 :: zs, bs)
        else bubble(h2 :: t, h1 :: zs, bs)
      case h1 :: Nil => sort(zs, h1 :: bs)
    }

    sort(list, Nil)
  }
}
