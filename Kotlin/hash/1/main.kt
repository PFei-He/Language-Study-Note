/**
 * Created by fay on 2017/7/19.
 */

fun main(args: Array<String>) {
    val hashMap = hashMapOf<String, Int>()
    hashMap.put("A", 1)
    hashMap.put("B", 2)
    hashMap.put("C", 3)
    println(hashMap)
    println(hashMap.get("A"))
    println(hashMap.get("B"))
    println(hashMap.get("C"))
}
